
def split_persian_date(date):
    year = int(date.split('-')[0])
    month = int(date.split('-')[1])
    day = int(date.split('-')[2])

    return year, month, day


def is_member(user):
    return user.groups.filter(name='کاربر فنی').exists()
