class ETL
  def self.transform(old)
    old.each.inject({}) do |agg, (points, letters)|
      letters.each do |letter| agg[letter.downcase] = points end
      agg
    end
  end
end
