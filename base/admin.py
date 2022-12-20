from django.contrib import admin
from .models import Order, Department, Task, Subgroup


# class OrderInline(admin.TabularInline):
# 	model = Order
# 	raw_id_fields = ('user',)
#

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'operation', 'department')
    list_filter = ('user', 'department')
# inlines = (OrderInline,)


@admin.register(Department)
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')
    list_filter = ('name',)


# 	inlines = (DepartmentInline,)


@admin.register(Task)
class TaskAdmin(admin.ModelAdmin):
    list_display = ['id', 'user']
    list_filter = ['user']


admin.site.register(Subgroup)
