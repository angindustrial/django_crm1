from django import template

register = template.Library()


@register.simple_tag()
def seconds_to_time(raw_seconds):
    hours = float(raw_seconds // 3600)
    minutes = float((raw_seconds % 3600) // 60)
    seconds = float((raw_seconds % 3600) % 60)
    hours_string = f"{f'{hours} ساعت ' if hours!=0 else ''}"
    minutes_string = f"{f'{minutes} دقیقه ' if minutes!=0 else ''}"
    seconds_string = f"{f'{seconds} ثانیه ' if seconds!=0 else ''}"
    output = hours_string + minutes_string + seconds_string
    if output == '':
        output = 'فعالیتی پیدا نشد'
    return output
