class PhoneNumber
  def self.clean(number)
    cleaned = number.sub(/^\+?1/,"").gsub(/\D/,"")
    cleaned.size == 10 && cleaned[0].match(/[2-9]/) && cleaned[3].match(/[2-9]/) ? cleaned : nil
  end
end
