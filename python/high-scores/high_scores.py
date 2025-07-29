class HighScores:
    def __init__(self, scores):
        self.scores = scores

    def latest(self):
        return self.scores[-1]

    def personal_best(self):
        return max(self.scores)

    def personal_top_three(self):
        copy = [*self.scores]
        best = []
        for i in range(3):
            if not len(copy): break
            m = max(copy)
            del copy[copy.index(m)]
            best.append(m)
        return best

