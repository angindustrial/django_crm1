from django import template

register = template.Library()


@register.simple_tag()
def total_task_time(orders):
    total = 0
    for order in orders:
        task = order.task.all().first()
        if task:
            total += task.get_time_diff
    return total
