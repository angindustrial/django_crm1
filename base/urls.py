from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='index'),

    path('orders/list/', views.OrdersList.as_view(), name='orders_list'),
    path('order/add/', views.order_add, name='order_add'),
    path('order/edit/<orderId>/', views.order_edit, name='order_edit'),
    path('order/detail/<orderId>/', views.order_detail, name='order_detail'),
    path('order/invoice/<orderId>/', views.order_invoice, name='order_invoice'),

    path('tasks/list/', views.TasksList.as_view(), name='tasks_list'),
    path('task/add/', views.task_add, name='task_add'),
    path('task/edit/<taskId>/', views.task_edit, name='task_edit'),
    path('task/detail/<taskId>/', views.task_detail, name='task_detail'),
    path('task/invoice/<taskId>/', views.task_invoice, name='task_invoice'),


    path('department/list/', views.DepartmentList.as_view(), name='department_list'),
    path('department/add/', views.department_add, name='department_add'),
    path('department/edit/<departmentId>/', views.department_edit, name='department_edit'),

    path('operation/list/', views.OperationList.as_view(), name='operation_list'),
    path('operation/add/', views.operation_add, name='operation_add'),
    path('operation/edit/<operationId>/', views.operation_edit, name='operation_edit'),

    path('subgroup/list/', views.SubgroupList.as_view(), name='subgroup_list'),
    path('subgroup/add/', views.subgroup_add, name='subgroup_add'),
    path('subgroup/edit/<subgroupId>/', views.subgroup_edit, name='subgroup_edit'),
    
    path('ajax/', include('base.ajax_urls')),

    path('persons_report/', views.WorkReportView.as_view(), name='persons_report'),
    path('machines_report/', views.MachineReportView.as_view(), name='machines_report')
]