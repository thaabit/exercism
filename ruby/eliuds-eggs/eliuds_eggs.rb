class EliudsEggs
  def self.egg_count(integer)
    eggs = 0
    while integer > 0
      eggs += integer % 2
      integer /= 2
    end
    eggs
  end
end
