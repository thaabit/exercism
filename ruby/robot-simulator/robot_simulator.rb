DIRS = [[0,1],[1,0],[0,-1],[-1,0]].cycle # N,E,S,W
class Robot
    def orient(dir)
      puts DIRS
    end
end
Robot.new.orient
