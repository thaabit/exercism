module Blackjack
  CARDS = %w[dummy one two three four five six seven eight nine ten ace].freeze
  TENS = %w[jack queen king]

  def self.parse_card(card)
    CARDS.index(card) || (TENS.include?(card) ? 10 : 0)
  end

  def self.card_range(card1, card2)
    case self.parse_card(card1) + self.parse_card(card2)
      when  4..11 then 'low'
      when 12..16 then 'mid'
      when 17..20 then 'high'
      when 21     then 'blackjack'
      when 22     then 'aces'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    dc = self.parse_card(dealer_card)
    case self.card_range(card1, card2)
      when 'aces'      then 'P'
      when 'blackjack' then [10,11].include?(dc) ? 'S' : 'W'
      when 'high'      then 'S'
      when 'mid'       then dc < 7 ? 'S' : 'H'
      when 'low'       then 'H'
    end
  end
end
