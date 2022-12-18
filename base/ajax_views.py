
from django.http import JsonResponse
from .models import *

import json

def confirm_order(request):
    data = json.loads(request.body)
    orderId = data['orderId']
    
    q = Order.objects.filter(orderId=orderId)
    if q.exists():
        q.update(isConfirmed=True, status=f'ارسال به واحد {q[0].departmentName}')
        message = {'status':200, 'text':''}
    else:
        message = {'status':400, 'text':'شماره سفارش صحیح نمیباشد'}

    return JsonResponse(message, safe=False)


def update_status(request):
    data = json.loads(request.body)
    id = data['id']
    db = data['db']
    status = data['value']
    
    if db == 'user':
        q = User.objects.filter(id=id)
        if status:
            q.update(is_active=True)
            message = {'status': '200', 'detail': f'{q[0].profile} فعال شد'}
        else:
            q.update(is_active=False)
            message = {'status': '200', 'detail': f'{q[0].profile} غیرفعال شد'}
            

    return JsonResponse(message, safe=False)