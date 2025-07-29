# Globals for the directions
# Change the values as you see fit
EAST = 'east'
NORTH = 'north'
WEST = 'west'
SOUTH = 'south'

dlist = [NORTH,EAST,SOUTH,WEST]

class Robot:
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.direction = direction
        self.coordinates = (x_pos, y_pos)

    def move(self, directions):
        for d in [*directions]:
            if d == 'R':
                self.direction = dlist[(dlist.index(self.direction) + 1) % 4]
            elif d == 'L':
                self.direction = dlist[(dlist.index(self.direction) - 1)]
            elif d == 'A':
                cur = self.coordinates
                match self.direction:
                    case 'north':
                        self.coordinates = (cur[0], cur[1] + 1)
                    case 'east':
                        self.coordinates = (cur[0] + 1, cur[1])
                    case 'south':
                        self.coordinates = (cur[0], cur[1] - 1)
                    case 'west':
                        self.coordinates = (cur[0] - 1, cur[1])
                    case _:
                        raise ValueError("invalid direction")
