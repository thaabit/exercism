import datetime
# subclassing the built-in ValueError to create MeetupDayException
class MeetupDayException(ValueError):
    """Exception raised when the Meetup weekday and count do not result in a valid date.

    message: explanation of the error.

    """
    def __init__(self, message):
        self.message = message

DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
WEEKS = ['first', 'second', 'third', 'fourth', 'fifth']
def meetup(year, month, week, day_of_week):
    if day_of_week: day_of_week = DAYS.index(day_of_week)

    d = datetime.date(year, month, 1)
    week_index = 0
    if week == 'teenth':
        d = datetime.date(year, month, 13)
        week_index = 1 if d.weekday() > day_of_week else 0
    elif week == 'last':
        week_index = 3
    else:
        week_index = WEEKS.index(week)
        if d.weekday() > day_of_week: week_index += 1

    d = d + datetime.timedelta(days = (7 * week_index))
    if d.weekday() != day_of_week:
        d = d + datetime.timedelta(days = day_of_week - d.weekday())

    if month != d.month:
        raise MeetupDayException("That day does not exist.")

    if week == 'last':
        fifth = d + datetime.timedelta(weeks = 1)
        if fifth.month == d.month: d = fifth

    return d
