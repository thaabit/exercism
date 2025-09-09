from datetime import datetime
def delivery_date(start, description):
    print(start)
    datetime.strptime(start, '%y-%m-%dT%H:%M:%S')
    print(datetime)
delivery_date("1999-06-03T09:45:00", "ASAP")
