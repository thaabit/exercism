class ComplexNumber
  attr_reader :real, :imaginary
  alias_method :a, :real
  alias_method :b, :imaginary

  def initialize(real, imaginary=0)
    @real = real
    @imaginary = imaginary
  end

  def me(a,b); self.class.new(a,b) end
  def abs; Math.sqrt(a**2 + b**2) end
  def ==(rhs); a == rhs.a && b == rhs.b end

  def conjugate; me(a, -b) end
  def /(rhs);    me((a * rhs.a + b * rhs.b).to_f / (rhs.a**2 + rhs.b**2).to_f, (b * rhs.a - a * rhs.b).to_f / (rhs.a**2 + rhs.b**2).to_f) end
  def *(rhs);    me(a * rhs.a - b * rhs.b, b * rhs.a + a * rhs.b) end
  def -(rhs);    me(real - rhs.real, imaginary - rhs.imaginary) end
  def +(rhs);    me(real + rhs.real, imaginary + rhs.imaginary) end
  def exp;       me(Math.exp(a) * Math.cos(b), (Math.exp(b) * Math.sin(b)).to_i) end
end
