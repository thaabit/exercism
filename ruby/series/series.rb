class Series
  def initialize(_txt)
    if _txt.length < 1 then raise ArgumentError.new("too short") end
    @txt = _txt
  end

  def slices(_len)
    if _len > @txt.length then raise ArgumentError.new("too long") end
    if _len < 1           then raise ArgumentError.new("too short") end
    last = @txt.length - _len
    (0..last).to_a.map { |idx| @txt[idx..idx + _len - 1] }
  end
end
