
from django.urls import path

from . import ajax_views as views

urlpatterns = [
    path('confirm-order/', views.confirm_order),
    path('update-status/', views.update_status),
]