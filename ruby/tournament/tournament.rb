class Tournament
  FORMAT = "%-31s| %2s | %2s | %2s | %2s | %2s"
  def self.tally(input)
    h = {}
    input.split("\n") do |line|
      t1, t2, res = line.split(';')
      [t1, t2].each do |t|
        h[t] = Hash({ W:0, D:0, L:0, P:0, MP:0 }) unless h.key?(t)
        h[t][:MP] += 1
      end
      if res == 'win'
        h[t1][:W] += 1
        h[t1][:P] += 3
        h[t2][:L] += 1
      elsif res == 'loss'
        h[t2][:W] += 1
        h[t2][:P] += 3
        h[t1][:L] += 1
      elsif res == 'draw'
        h[t1][:D] += 1
        h[t1][:P] += 1
        h[t2][:D] += 1
        h[t2][:P] += 1
      end
    end
    out = FORMAT % %w[Team MP W D L P] + "\n"
    if not h.empty?
      (h.sort_by { |team, h| [-h[:P], team] }).each do |team, h|
        out += FORMAT % [team, h.slice(:MP,:W,:D,:L,:P).values] + "\n"
      end
    end
    out
  end
end
