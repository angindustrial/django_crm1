from django.contrib import admin
from .models import Order, Department, Task, Subgroup, Operation


# class OrderInline(admin.TabularInline):
# 	model = Order
# 	raw_id_fields = ('user',)
#

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'operation', 'department', 'orderId')
    list_filter = ('user', 'department', 'createdAt')
# inlines = (OrderInline,)


@admin.register(Department)
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')
    list_filter = ('name',)


# 	inlines = (DepartmentInline,)


@admin.register(Task)
class TaskAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'order']
    list_filter = ['user']


admin.site.register(Subgroup)
admin.site.register(Operation)
# admin.site.register(RepairOperator)
