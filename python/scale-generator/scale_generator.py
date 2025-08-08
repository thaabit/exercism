SHARPS = ['A','A#','B','C','C#','D','D#','E','F','F#','G','G#']
FLATS = ['A','Bb','B','C','Db','D','Eb','E','F','Gb','G','Ab']
JUMPS = {'A': 3, 'M': 2, 'm': 1, 'b': 11}
IS_SHARPS=['C', 'a', 'G', 'D', 'A', 'E', 'B', 'F#', 'e', 'b', 'f#', 'c#', 'g#', 'd#']
class Scale:
    def __init__(self, tonic):
        self.flats = tonic not in IS_SHARPS
        self.tonic = tonic[0].upper()
        if len(tonic) == 2:
            self.tonic += tonic[1]

    def chromatic(self):
        return self.interval('mmmmmmmmmmm')

    def interval(self, intervals):
        notes = FLATS if self.flats else SHARPS
        out = [self.tonic]
        index = notes.index(self.tonic)
        for i in intervals:
            index = (index + JUMPS[i]) % 12
            out.append(notes[index])
        return out
