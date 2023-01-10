from django.contrib.auth.models import Group
from django.db.models.functions import Coalesce
from django.shortcuts import render, redirect
from django.views.generic import ListView, CreateView
from django.contrib.auth.decorators import login_required
from django.db.models import DurationField
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.db.models import Q, Sum, F
from django.db.utils import IntegrityError
from users.models import Profile
from django.core.exceptions import PermissionDenied

import jdatetime
from datetime import timedelta

from .models import *
from .forms import OrderForm
from .utils import split_persian_date, is_member, total_seconds_calculator, to_gregorian, find_longest_work


# from .enum_types import StatusChoices


@login_required(login_url='/users/login/')
def index(request):
    user = request.user
    if user.is_superuser:
        users = User.objects.filter(is_superuser=False)
        orders = Order.published.all()
        tasks = Task.published.all()
    else:
        users = User.objects.filter(is_superuser=False)
        orders = Order.published.filter(user=user)
        tasks = Task.published.filter(user=user, completed=True)

    context = {'users': users, 'orders': orders, 'tasks': tasks}
    return render(request, 'index.html', context)


class OrdersList(ListView):
    model = Order
    template_name = 'order/list.html'
    paginate_by = 30
    context_object_name = 'orders'

    def get_queryset(self):
        if self.request.user.has_perm('review.view_order_all') or is_member(self.request.user):
            orders = Order.published.all().order_by('-createdAt')
        else:
            # profile = Profile.objects.get(user=self.request.user)
            orders = Order.published.filter(user=self.request.user, isConfirmed=True).order_by('-createdAt')

        q = self.request.GET.get('q')
        department = self.request.GET.get('department')
        operation = self.request.GET.get('operation')
        status = self.request.GET.get('status')
        start_date = self.request.GET.get('start_date')
        due_date = self.request.GET.get('due_date')
        if q:
            orders = orders.filter(Q(orderId__contains=q))

        if department:
            orders = orders.filter(department_id=department)

        if operation:
            orders = orders.filter(operation_id=operation)

        if status:
            orders = orders.filter(isCompleted=status)

        if start_date:
            start_date = jdatetime.datetime.strptime(start_date, '%Y-%m-%d').togregorian().date()
            orders = orders.filter(createdAt__gte=start_date)

        if due_date:
            due_date = jdatetime.datetime.strptime(due_date, '%Y-%m-%d').togregorian().date()
            orders = orders.filter(createdAt__lte=due_date)
        return orders

    def get_context_data(self, **kwargs):
        contains_building = False
        orders = self.get_queryset()
        context = super().get_context_data(**kwargs)
        context['templatetags'] = contains_building
        context['operations'] = Operation.objects.all()
        context['departments'] = Department.objects.all()

        return context


def order_add(request):
    if request.method == 'POST':
        operationId = request.POST.get('operation')
        departmentId = request.POST.get('department')
        subgropuIds = request.POST.getlist('subgroup')
        priority = request.POST.get('priority')

        lastOrder = Order.objects.last()
        print(lastOrder)
        print(lastOrder.orderId)

        code = int(lastOrder.orderId) + 1
        operation = Operation.objects.get(id=operationId)
        department = Department.objects.get(id=departmentId)

        form = OrderForm(request.POST)
        if form.is_valid():
            instance = form.save(commit=False)
            instance.orderId = code
            instance.user = request.user

            instance.operation = operation
            instance.operationName = operation.name

            instance.department = department
            instance.departmentName = department.name
            instance.priority = priority
            try:
                instance.save()
            except IntegrityError as e:
                messages.error(request, 'این رکورد در این تاریخ یک بار ثبت شده است')
                return redirect('orders_list')
            instance.isConfirmed = True
            instance.status = f'ارسال به  {department.name}'
            # instance.status = 'ارسال به واحد فنی'

            # id of ساخت subgroup is 4
            building_subgroup = Subgroup.objects.get(id=4)

            for subgroupId in subgropuIds:
                subgroup_item = Subgroup.objects.get(id=subgroupId)
                if subgroup_item == building_subgroup:
                    instance.isConfirmed = False
                    instance.status = 'درانتظار تایید مدیریت'
                instance.subGroup.add(subgroup_item)

            instance.save()
        else:
            messages.error(request, 'اطلاعات به صورت صحیح وارد نشده است')
        messages.success(request, 'درخواست ثبت شد')

        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

    else:
        form = OrderForm()

    subgroups = Subgroup.objects.all()
    operations = Operation.objects.all()
    departments = Department.objects.filter(id=3)  # limit the department by technical in form
    context = {'departments': departments, 'operations': operations, 'subgroups': subgroups, 'form': form}
    return render(request, 'order/add.html', context)


@login_required(login_url='/users/login/')
def order_edit(request, orderId):
    order = Order.published.get(orderId=orderId)
    if request.method == 'POST':
        operationId = request.POST.get('operation')
        departmentId = request.POST.get('department')
        subgropuIds = request.POST.getlist('subgroup')
        description = request.POST.get('description')
        priority = request.POST.get('priority')
        status = request.POST.get('status')
        operation = Operation.objects.get(id=operationId)
        department = Department.objects.get(id=departmentId)

        form = OrderForm(request.POST, instance=order)
        if form.is_valid():
            instance = form.save(commit=False)
            instance.description = description
            instance.operation = operation
            instance.operationName = operation.name
            instance.second_status = status
            instance.department = department
            instance.departmentName = department.name
            instance.priority = priority
            instance.save()

            instance.subGroup.clear()
            for subgroupId in subgropuIds:
                instance.subGroup.add(Subgroup.objects.get(id=subgroupId))

            instance.save()
        messages.success(request, 'درخواست ویرایش شد')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        form = OrderForm(request.POST or None, instance=order)
    subgroups = Subgroup.objects.all()
    operations = Operation.objects.all()
    departments = Department.objects.filter(id=3)  # limit the department by technical in form
    status_choices = Order.StatusChoices
    context = {'departments': departments, 'operations': operations, 'subgroups': subgroups, 'order': order,
               'form': form, "status_choices": status_choices}
    return render(request, 'order/edit.html', context)


def order_detail(request, orderId):
    order = Order.published.get(orderId=orderId)
    context = {'order': order}
    return render(request, 'order/detail.html', context)


def order_invoice(request, orderId):
    order = Order.published.get(orderId=orderId)
    context = {'order': order}
    return render(request, 'order/invoice.html', context)


class TasksList(ListView):
    model = Task
    template_name = 'task/list.html'
    paginate_by = 10
    context_object_name = 'tasks'

    def get_queryset(self):
        if self.request.user.is_superuser:
            tasks = Task.published.all().order_by('-date')
        else:
            # tasks = Task.objects.filter(order__user=self.request.user, completed=True).order_by('-date')
            tasks = Task.published.filter(user=self.request.user).order_by('-date')

        q = self.request.GET.get('q')
        department = self.request.GET.get('department')
        status = self.request.GET.get('status')
        operation = self.request.GET.get('operation')
        subgroup = self.request.GET.get('subgroup')
        start_date = self.request.GET.get('start_date')
        due_date = self.request.GET.get('due_date')

        if q:
            tasks = tasks.filter(order__orderId__contains=q)[:1]

        if department:
            tasks = tasks.filter(order__department_id=department)

        if status:
            tasks = tasks.filter(completed=status)

        if operation:
            tasks = tasks.filter(order__operation=operation)

        if subgroup:
            tasks = tasks.filter(order__subGroup=subgroup)

        if start_date:
            start_date = jdatetime.datetime.strptime(start_date, '%Y-%m-%d').togregorian().date()
            tasks = tasks.filter(date__gte=start_date)

        if due_date:
            due_date = jdatetime.datetime.strptime(due_date, '%Y-%m-%d').togregorian().date()
            tasks = tasks.filter(date__lte=due_date)

        return tasks

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['departments'] = Department.objects.all()
        context['operations'] = Operation.objects.all()
        return context


def task_add(request):
    orderId = request.GET.get('orderId')
    if request.method == 'POST':
        description = request.POST.get('description')
        description2 = request.POST.get('description2')
        orderId = request.POST.get('orderId')
        date = request.POST.get('date')
        start_time = request.POST.get('start_time')
        end_time = request.POST.get('end_time')
        status = request.POST.get('status')
        operator_id = request.POST.get('operator')

        if orderId:
            order = Order.published.get(orderId=orderId)
            operator = User.objects.get(id=operator_id)

            task = Task.published.create(order=order, user=request.user, description=description,
                                         description2=description2)
            year, month, day = split_persian_date(date)
            date = jdatetime.date(year, month, day).togregorian()

            task.date = date
            task.start_time = start_time
            task.end_time = end_time
            task.completed = status
            task.operator = operator
            if status == '1':
                order.isCompleted = True
                order.save()

            task.save()

            messages.success(request, 'درخواست شروع کار ثبت شد')
            return redirect('orders_list')

    if orderId:
        order = Order.published.get(orderId=orderId)
        tasks = Task.published.filter(order=order).order_by('date')
    else:
        order = None
        tasks = None
    operators = Group.objects.get(name='اپراتور فنی').user_set.all()
    context = {'order': order, 'tasks': tasks, 'operators': operators}
    return render(request, 'task/add.html', context)


@login_required(login_url='/users/login/')
def task_edit(request, taskId):
    task = Task.published.get(id=taskId)

    if request.method == 'POST':
        description = request.POST.get('description')
        description2 = request.POST.get('description2')
        date = request.POST.get('date')
        start_time = request.POST.get('start_time')
        end_time = request.POST.get('end_time')
        status = request.POST.get('status')

        start_time = start_time if start_time != '' else None
        end_time = end_time if end_time != '' else None

        if date != '-':
            print('here ', date)
            year, month, day = split_persian_date(date)
            date = jdatetime.date(year, month, day).togregorian()
        else:
            date = None
        task.description = description
        task.description2 = description2
        task.date = date
        task.start_time = start_time
        task.end_time = end_time
        task.completed = status
        task.save()

        if status == '1':
            order = Order.published.get(task__id=taskId)
            order.isCompleted = True
            order.save()

        messages.success(request, f' کار با شماره سفارش {task.order.orderId} ویرایش شد')
        return redirect('tasks_list')

    operators = Group.objects.get(name='اپراتور فنی').user_set.all()
    context = {'task': task, 'operators': operators}
    return render(request, 'task/edit.html', context)


def task_detail(request, taskId):
    task = Task.published.get(id=taskId)
    context = {'task': task}
    return render(request, 'task/detail.html', context)


def task_invoice(request, taskId):
    task = Task.published.get(id=taskId)
    context = {'task': task}
    return render(request, 'task/invoice.html', context)


class DepartmentList(ListView):
    model = Department
    template_name = 'department/list.html'
    paginate_by = 50
    context_object_name = 'departments'


def department_add(request):
    if request.method == 'POST':
        name = request.POST.get('departmentName')
        Department.objects.get_or_create(name=name)
        messages.success(request, 'واحد ایجاد شد')
        return redirect('department_list')


def department_edit(request, departmentId):
    if request.method == 'POST':
        name = request.POST.get('departmentName')
        Department.objects.filter(id=departmentId).update(name=name)
        messages.success(request, 'واحد ویرایش شد')
        return redirect('department_list')


class OperationList(ListView):
    model = Operation
    template_name = 'operation/list.html'
    paginate_by = 100
    context_object_name = 'operations'


def operation_add(request):
    if request.method == 'POST':
        name = request.POST.get('operationName')
        Operation.objects.get_or_create(name=name)
        messages.success(request, 'عملیات ایجاد شد')
        return redirect('operation_list')


def operation_edit(request, operationId):
    if request.method == 'POST':
        name = request.POST.get('operationName')
        Operation.objects.filter(id=operationId).update(name=name)
        messages.success(request, 'عملیات ویرایش شد')
        return redirect('operation_list')


class SubgroupList(ListView):
    model = Subgroup
    template_name = 'subgroup/list.html'
    paginate_by = 150
    context_object_name = 'subgroups'


def subgroup_add(request):
    if request.method == 'POST':
        name = request.POST.get('subgroupName')
        Subgroup.objects.get_or_create(name=name)
        messages.success(request, 'زیرگروه ایجاد شد')
        return redirect('subgroup_list')


def subgroup_edit(request, subgroupId):
    if request.method == 'POST':
        name = request.POST.get('subgroupName')
        Subgroup.objects.filter(id=subgroupId).update(name=name)
        messages.success(request, 'زیرگروه ویرایش شد')
        return redirect('subgroup_list')


class WorkReportView(ListView):
    # person per hour report
    template_name = "base/work_report.html"
    paginate_by = 10
    context_object_name = 'results'

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.tasks = None
        self.end_date = None
        self.start_date = None
        self.executor_name = None

    def get_queryset(self):
        self.executor_name = self.request.GET.get('executor_name')
        self.start_date = to_gregorian(self.request.GET.get('start_date'))
        self.due_date = to_gregorian(self.request.GET.get('due_date'))
        tasks = Task.objects.all()

        if self.start_date:
            tasks = tasks.filter(date__gte=self.start_date)
        if self.due_date:
            tasks = tasks.filter(date__lte=self.due_date)
        if self.executor_name:
            first_name, last_name = self.executor_name.split(' ')
            tasks = tasks.filter(user__first_name=first_name, user__last_name=last_name)

        return tasks

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data()
        total_seconds = 0
        the_longest_work_seconds = 0
        the_longest_work_object = None
        if self.start_date or self.end_date or self.executor_name:
            for task in self.get_queryset():
                total_seconds = total_seconds_calculator(task, total_seconds)
                the_longest_work_seconds, the_longest_work_object = find_longest_work(task, the_longest_work_seconds,
                                                                                      the_longest_work_object)
                context['the_longest_operation'] = the_longest_work_object.order
            context['total_seconds'] = total_seconds
            context['the_longest_work'] = the_longest_work_seconds
        context['persons'] = Profile.mechanical_users.all()
        return context


class MachineReportView(ListView):
    model = Operation
    template_name = "base/machine_report.html"
    paginate_by = 10

    def get_queryset(self):
        operation_query = self.request.GET.get('operation')
        operations = Operation.objects.annotate(
            time_spent=Coalesce(
                Sum(F('order__task__end_time') - F('order__task__start_time'), output_field=DurationField())
                , timedelta(0, 0, 0), timedelta(0, 0, 0), output_field=DurationField()
            ),
        )
        time_spent = self.request.GET.get('time_spent')

        if operation_query:
            operations = operations.filter(name=operation_query)
        if time_spent == 'highest':
            operations = operations.order_by('-time_spent')
        elif time_spent == 'lowest':
            operations = operations.order_by('time_spent')

        return operations

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(MachineReportView, self).get_context_data()
        context['all_operations'] = Operation.objects.all()
        return context


def change_task_publish_status(request, pk):
    if request.method == 'POST':

        if request.user.is_superuser:
            type_of_delete = request.POST.get('type_of_delete')
            task = Task.published.get(pk=pk)

            if type_of_delete == 'delete_all':
                task.publish = False
                task.save()
                task.order.publish = False
                task.order.save()

            elif type_of_delete == 'delete_this':
                task.publish = False
                task.save()

            return redirect('tasks_list')

        else:
            return PermissionDenied()
    else:
        return redirect('tasks_list')


def change_order_publish_status(request, pk):
    # if request.method == 'POST':
    #     if request.user.is_superuser:
    #         order = Order.published.get(pk=pk)
    #         order.publish = False
    #         order.save()
    #         return redirect('orders_list')
    #     else:
    #         return PermissionDenied()
    # else:
    #     return HttpResponseForbidden()
    if request.method == 'POST':

        if request.user.is_superuser:
            type_of_delete = request.POST.get('type_of_delete')
            order = Order.published.get(pk=pk)

            if type_of_delete == 'delete_all':
                order.publish = False
                order.save()
                order.task.all().update(publish=False)
                # order.task.all().save()

            elif type_of_delete == 'delete_this':
                order.publish = False
                order.save()

            return redirect('orders_list')

        else:
            return PermissionDenied()
    else:
        return redirect('orders_list')
