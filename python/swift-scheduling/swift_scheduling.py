import re
from datetime import datetime, timedelta
from calendar import FRIDAY, SATURDAY, SUNDAY, MONDAY, WEDNESDAY, monthrange
def delivery_date(start, description):
    d = datetime.fromisoformat(start)
    match description:
        case "NOW" : d += timedelta(hours=2)
        case "ASAP":
            if d.hour < 13:
                d = d.replace(hour=17, minute=0)
            else:
                d += timedelta(days=1)
                d = d.replace(hour=13, minute=0)
        case "EOW":
            if d.weekday() < 3:
                d += timedelta(days=FRIDAY - d.weekday())
                d = d.replace(hour=17, minute=0)
            else:
                d += timedelta(days=SUNDAY - d.weekday())
                d = d.replace(hour=20, minute=0)
        case _:
            if description[0] == "Q":
                month = int(description[1]) * 3
                year = d.year if d.month <= month else d.year + 1
                d = datetime(year, month, monthrange(year, month)[1], 8, 0)
                while d.weekday() in [SATURDAY, SUNDAY]: d -= timedelta(days=1)
            else:
                month = int(description[:-1])
                year = d.year if d.month < month else d.year + 1
                d = datetime(year, month, 1, 8, 0)
                while d.weekday() in [SATURDAY, SUNDAY]: d += timedelta(days=1)

    return d.isoformat()
