class ZebraPuzzle
  NATIONALITIES = %w[Englishman Norwegian Japanese Ukrainian Spaniard]
  COLORS        = %w[red green yellow ivory blue]
  PETS          = %w[dog snail fox horse zebra]
  ACTIVITY      = %w[dancing painting reading chess football]
  DRINKS        = %w[coffee tea milk oj water]

  def self.groups(type)
    NATIONALITIES.permutation.each { |n|
      next if n[0] != "Norwegian"
      COLORS.permutation.each { |c|
        next if c.index("red") != n.index("Englishman")
        next if c.index("green") != c.index("ivory") + 1
        next if (n.index("Norwegian") - c.index("blue")).abs != 1
        PETS.permutation.each { |p|
          next if p.index("dog") != n.index("Spaniard")
          DRINKS.permutation.each { |d|
            next if d.index("milk") != 2
            next if c.index("green") != d.index("coffee")
            next if n.index("Ukrainian") != d.index("tea")
            ACTIVITY.permutation.each { |a|
              next if p.index("snail") != a.index("dancing")
              next if c.index("yellow") != a.index("painting")
              next if (p.index("fox") - a.index("reading")).abs != 1
              next if (p.index("horse") - a.index("painting")).abs != 1
              next if d.index("oj") != a.index("football")
              next if n.index("Japanese") != a.index("chess")
              return type == :drinks ? d.zip(n).to_h : p.zip(n).to_h
            }
          }
        }
      }
    }
  end
  def self.water_drinker
    ZebraPuzzle.groups(:drinks)["water"]
  end
  def self.zebra_owner
    ZebraPuzzle.groups(:pets)["zebra"]
  end
end
