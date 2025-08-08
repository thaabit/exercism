class DndCharacter
  attr_reader :constitution, :strength, :dexterity, :intelligence, :wisdom, :charisma, :hitpoints

  def self.modifier(num)
    ((num - 10)/ 2).floor
  end

  def initialize
    @constitution = rando
    @hitpoints = 10 + DndCharacter.modifier(@constitution)
    @strength = rando
    @dexterity = rando
    @intelligence = rando
    @wisdom = rando
    @charisma = rando
  end

  def rando
    rolls = ((1..4).map { rand(5) + 1 })
    rolls.delete_at(rolls.index(rolls.min))
    rolls.sum
  end

end
