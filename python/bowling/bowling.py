class BowlingGame:
    def __init__(self):
        self.frames = []
        self.cur_frame = (None, None)

    def is_strike(self, frame):
        return frame[0] == 10

    def is_spare(self, frame):
        return not self.is_strike(frame) and sum(frame) == 10

    def roll(self, pins):
        f = self.frames
        cur = self.cur_frame
        if pins > 10 or pins < 0 or (cur[0] and pins + cur[0] > 10): raise ValueError("too high")
        if len(f) == 11 and not self.is_strike(f[-1]) and not self.is_spare(f[-1]): raise ValueError("invalid")
        if len(f) == 10 and not self.is_strike(f[-1]) and not self.is_spare(f[-1]): raise ValueError("invalid")
        if len(f) == 10 and self.is_spare(f[-1]) and cur[0] is not None: raise ValueError("invalid")
        if len(f) == 11 and not self.is_strike(f[-2]) and not self.is_spare(f[-1]): raise ValueError("invalid")
        if pins == 10:
            f.append((10, 0))
        elif cur[0] is not None:
            if cur[0] + pins > 10: raise ValueError("invalid")
            f.append((cur[0], pins))
            self.cur_frame = (None, None)
        else:
            self.cur_frame = (pins, None)


    def score(self):
        f = self.frames
        if self.cur_frame[0] is not None: f.append((self.cur_frame[0], 0))
        if len(f) < 10: raise ValueError("invalid")
        total = 0
        for i, frame in enumerate(f):
            if i >= 10: break
            total += sum(frame)
            if frame[0] == 10:
               _first = f[i + 1][0]
               _second = f[i + 2][0] if _first == 10 else f[i + 1][1]
               total += _first + _second
            elif sum(frame) == 10:
               total += f[i + 1][0]

        return total
