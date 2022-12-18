from django.shortcuts import render, redirect
from django.views.generic import ListView
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.db.models import Q

import random
import jdatetime

from .models import *
from users.models import *
from .forms import OrderForm
from .utils import split_persian_date, is_member

@login_required(login_url='/users/login/')
def index(request):
    user = request.user
    if user.is_superuser:
        users = User.objects.filter(is_superuser=False)
        orders = Order.objects.all()
        tasks = Task.objects.all()
    else:
        users = User.objects.filter(is_superuser=False)
        orders = Order.objects.filter(user=user)
        tasks = Task.objects.filter(order__user=user,completed=True)

    context = {'users':users, 'orders':orders, 'tasks':tasks}
    return render(request, 'index.html', context)

class OrdersList(ListView):
    model = Order
    template_name = 'order/list.html'
    paginate_by = 30
    context_object_name = 'orders'

    def get_queryset(self):
        if self.request.user.has_perm('base.view_order_all'):
            orders = Order.objects.all().order_by('-createdAt')

            
        else:
            profile = Profile.objects.get(user=self.request.user)
            orders =  Order.objects.filter(department_id=profile.department.id, isConfirmed=True).order_by('-createdAt')


        q = self.request.GET.get('q')
        department = self.request.GET.get('department')
        operation = self.request.GET.get('operation')
        status = self.request.GET.get('status')

        if q:
            orders = orders.filter(Q(orderId__contains=q))
        
        if department:
            orders = orders.filter(department_id=department)

        if operation:
            orders = orders.filter(operation_id=operation)

        if status:
            orders = orders.filter(isCompleted=status)

        return orders
        
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
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
            instance.save()
            
            instance.isConfirmed = True
            instance.status = f'ارسال به  {department.name}'
            instance.status = 'درانتظار تایید مدیریت'
            instance.status = 'ارسال به واحد فنی'

            for subgroupId in subgropuIds:
                instance.subGroup.add(Subgroup.objects.get(id=subgroupId))

            instance.save()        
        messages.success(request, 'درخواست ثبت شد')
        
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    
    else:
        form = OrderForm()
    subgroups = Subgroup.objects.all()
    operations = Operation.objects.all()
    departments = Department.objects.filter(id=3) # limit the department by technical in form
    context = {'departments':departments, 'operations':operations, 'subgroups':subgroups, 'form':form}
    return render(request, 'order/add.html', context)


@login_required(login_url='/users/login/')
def order_edit(request, orderId):
    order = Order.objects.get(orderId=orderId)
    if request.method == 'POST':
        operationId = request.POST.get('operation')
        departmentId = request.POST.get('department')
        subgropuIds = request.POST.getlist('subgroup')
        description = request.POST.get('description')
        priority = request.POST.get('priority')

        operation = Operation.objects.get(id=operationId)
        department = Department.objects.get(id=departmentId)

        form = OrderForm(request.POST, instance=order)
        if form.is_valid():
            instance = form.save(commit=False)
            instance.description = description
            instance.operation = operation
            instance.operationName = operation.name
            
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
    departments = Department.objects.filter(id=3) # limit the department by technical in form
    context = {'departments':departments, 'operations':operations, 'subgroups':subgroups, 'order':order,
                'form':form}
    return render(request, 'order/edit.html', context)


def order_detail(request, orderId):
    order = Order.objects.get(orderId=orderId)
    context = {'order':order}
    return render(request, 'order/detail.html', context)

def order_invoice(request, orderId):
    order = Order.objects.get(orderId=orderId)
    context = {'order':order}
    return render(request, 'order/invoice.html', context)

from django.http import HttpResponse
class TasksList(ListView):
    model = Task
    template_name = 'task/list.html'
    paginate_by = 10
    context_object_name = 'tasks'

    def get_queryset(self):
        if is_member(self.request.user):
            tasks = Task.objects.all().order_by('-date')
        else:
            tasks = Task.objects.filter(order__user=self.request.user,completed=True).order_by('-date')


        q = self.request.GET.get('q')
        department = self.request.GET.get('department')
        status = self.request.GET.get('status')

        if q:
            tasks = tasks.filter(order__orderId__contains=q)
        
        if department:
            tasks = tasks.filter(order__department_id=department)

        if status:
            tasks = tasks.filter(completed=status)

        return tasks

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['departments'] = Department.objects.all()
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
        
        if orderId:
            order = Order.objects.get(orderId=orderId)
            task = Task.objects.create(order=order, user=request.user, description=description, description2=description2)
            year, month, day = split_persian_date(date)
            date = jdatetime.date(year, month, day).togregorian()

            task.date = date
            task.start_time = start_time
            task.end_time = end_time
            task.completed = status
            if status == '1':
                order.isCompleted = True
                order.save()
        
            task.save() 

            messages.success(request, 'درخواست شروع کار ثبت شد')
            return redirect('orders_list')

    if orderId:
        order = Order.objects.get(orderId=orderId)
        tasks = Task.objects.filter(order=order).order_by('date')
    else:
        order = None
        tasks = None
    context = {'order':order, 'tasks':tasks}
    return render(request, 'task/add.html', context)


@login_required(login_url='/users/login/')
def task_edit(request, taskId):
    task = Task.objects.get(id=taskId)

    if request.method == 'POST':
        description = request.POST.get('description')
        description2 = request.POST.get('description2') 
        date = request.POST.get('date')
        start_time = request.POST.get('start_time')
        end_time = request.POST.get('end_time')
        status = request.POST.get('status')

        year, month, day = split_persian_date(date)
        date = jdatetime.date(year, month, day).togregorian()

        task.description = description
        task.description2 = description2
        task.date = date
        task.start_time = start_time
        task.end_time = end_time
        task.completed = status
        task.save()
        
        if status == '1':
            order = Order.objects.get(task__id=taskId)
            order.isCompleted = True
            order.save()
        

        messages.success(request, 'درخواست شروع کار ویرایش شد')
        return redirect('orders_list')

    context = {'task':task}
    return render(request, 'task/edit.html', context)      


def task_detail(request, taskId):
    task = Task.objects.get(id=taskId)
    context = {'task':task}
    return render(request, 'task/detail.html', context)

def task_invoice(request, taskId):
    task = Task.objects.get(id=taskId)
    context = {'task':task}
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