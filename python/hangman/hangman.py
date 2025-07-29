# Game status categories
# Change the values as you see fit
STATUS_WIN = 'win'
STATUS_LOSE = 'lose'
STATUS_ONGOING = 'ongoing'


class Hangman:
    def __init__(self, word):
        self.remaining_guesses = 9
        self.status = STATUS_ONGOING
        self.word = word
        self.wordset = set(word)
        self.guesses = set()

    def guess(self, char):
        if self.status != STATUS_ONGOING: raise ValueError("The game has already ended.")
        if self.remaining_guesses == 0: self.status = STATUS_LOSE
        if char in self.guesses or char not in self.wordset: self.remaining_guesses -= 1
        if char not in self.guesses: self.guesses.add(char)
        if self.guesses >= self.wordset: self.status = STATUS_WIN

    def get_masked_word(self):
        return "".join([c if c in self.guesses else '_' for c in self.word])

    def get_status(self):
        return self.status
