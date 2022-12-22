from django import template

register = template.Library()


@register.simple_tag()
def seconds_to_time(seconds):
    a = str(seconds // 3600)
    b = str((seconds % 3600) // 60)
    c = str((seconds % 3600) % 60)
    d = "{} ساعت {} دقیقه {} ثانیه".format(a, b, c)
    return d
