WHITE='W'
BLACK='B'
NONE=None
class Board:
    """Count territories of each player in a Go game

    Args:
        board (list[str]): A two-dimensional Go board
    """

    def __init__(self, board):
        self.board = []
        self.height = len(board)
        for row in board:
            self.width = len(row)
            self.board.append(list(row))

    def territory(self, x, y):
        return self._territory(x, y, set(), list())

    def _territory(self, x, y, terr=set(), stones=list()):
        if (x, y) in terr: return (None, set())
        """Find the owner and the territories given a coordinate on
           the board

        Args:
            x (int): Column on the board
            y (int): Row on the board

        Returns:
            (str, set): A tuple, the first element being the owner
                        of that area.  One of "W", "B", "".  The
                        second being a set of coordinates, representing
                        the owner's territories.

        """
        if x < 0 or x >= self.width or y < 0 or y >= self.height:
            raise ValueError('Invalid coordinate')

        b = self.board
        if b[y][x] == ' ':
            terr.add((x, y))
        else:
            return (None, set())

        # check up, down, left, right
        coords = ((x-1, y), (x+1, y), (x, y-1), (x, y+1))
        for c in coords:
            x, y = c
            if x < 0 or y < 0 or x >= self.width or y >= self.height: continue
            if b[y][x] == ' ':
                s, t = self._territory(x, y, terr, stones)
                terr.update(t)
            else:
                stones.append(b[y][x])

        stone = stones[0] if len(stones) and all(s == stones[0] for s in stones) else None
        return (stone, terr)


    def territories(self):
        """Find the owners and the territories of the whole board

        Args:
            none

        Returns:
            dict(str, set): A dictionary whose key being the owner
                        , i.e. "W", "B", "".  The value being a set
                        of coordinates owned by the owner.
        """
        b, seen, t = self.board, set(), {'B': set(), 'W': set(), None: set()}
        for y, row in enumerate(b):
            for x, col in enumerate(b[y]):
                if (x, y) in seen:
                    continue
                elif b[y][x] == ' ':
                    stone, territory = self.territory(x, y)
                    seen.update(territory)
                    t[stone].update(territory)
        return t
