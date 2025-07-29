class LogLineParser
  def initialize(line)
    @line = line
    @level, @message = @line.match(/^\[(.*?)\]\s*:?\s*(.*?)\s*$/).captures
  end

  def message
    @message
  end

  def log_level
    @level.downcase
  end

  def reformat
    "#{@message} (#{@level.downcase})"
  end
end
