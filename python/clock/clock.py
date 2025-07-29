import math
class Clock:
    def __init__(self, hour, minute):
        total = (hour * 60) + minute
        hour = int(total / 60) % 24
        hour = 24 + hour if hour < 0 else hour
        minute = int(math.fmod(total, 60))
        if minute < 0:
            minute = 60 + minute
            hour = (hour + 23) % 24

        self.hour = hour
        self.minute = minute

    def __repr__(self):
        return f'Clock({self.hour}, {self.minute})'

    def __str__(self):
        return f'{self.hour:02}:{self.minute:02}'

    def __eq__(self, other):
        return self.minute == other.minute and self.hour == other.hour

    def __add__(self, minutes):
        return Clock(self.hour, self.minute + minutes)

    def __sub__(self, minutes):
        return Clock(self.hour, self.minute - minutes)
