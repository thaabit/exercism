class TwoBucket

  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(b1_size, b2_size, goal, start_bucket)
    sizes = [b1_size, b2_size]
    shortest = nil
    seen = {}

    choose = ->(amts, action, actions, active) {
      other = active == 1 ? 0 : 1
      case action
      when "fill"
        amts[active] = sizes[active]
      when "empty"
        amts[active] = 0
      when "pour"
        amt_to_pour = amts[other]
        space = sizes[active] - amts[active]
        amt_to_pour = space if amt_to_pour > space
        amts[active] += amt_to_pour
        amts[other] -= amt_to_pour
      end
      actions << amts

      if (!shortest || actions.size < shortest) and amts.include?(goal)
        @moves = actions.size
        @goal_bucket = amts[0] == goal ? "one" : "two"
        @other_bucket = (@goal_bucket == "one") ? amts[1] : amts[0]
        return
      end
      # avoid infinite loops
      return if seen[amts.join(",")]
      seen[amts.join(",")] = 1

      choose.call(amts.dup, "pour",  actions.dup, active) if amts[other] > 0 and amts[active] < sizes[active]
      choose.call(amts.dup, "pour",  actions.dup, other)  if amts[active] > 0 and amts[other] < sizes[other]
      choose.call(amts.dup, "fill",  actions.dup, active) if amts[active] < sizes[active]
      choose.call(amts.dup, "fill",  actions.dup, other)  if amts[other] < sizes[other]
      choose.call(amts.dup, "empty", actions.dup, active) if amts[active] > 0
      choose.call(amts.dup, "empty", actions.dup, other)  if amts[other] > 0
    }
    choose.call([0,0], "fill", [], start_bucket == "one" ? 0 : 1)
  end
end
