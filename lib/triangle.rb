require "pry"
class Triangle
  # write code here

  attr_accessor :a, :b, :c

  def initialize a,c,b
    @a = a
    @b = b
    @c = c
  end

  def kind
    triangle?
    if a == b && c == b
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def triangle?
    triangle = [(a + b > c),(b + c > a),(c + a > b)]
    [a,b,c].each do |side|
      if side <= 0
        triangle << false
      end
    end
    raise TriangleError if triangle.include?(false)
  end

  class TriangleError < StandardError
  end
end
