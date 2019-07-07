require 'pry'
class Triangle
  attr_reader :ang1, :ang2, :ang3
  @@all = []
  def initialize(ang1, ang2, ang3)
    @ang1 = ang1
    @ang2 = ang2
    @ang3 = ang3
  end

  def kind
    is_it_real
    if self.ang1 == self.ang2 && self.ang1 == self.ang3
      :equilateral
    elsif self.ang1 == self.ang2 || self.ang1 == self.ang3 || self.ang2 == self.ang3
      :isosceles
    else
      :scalene
    end
  end
  
  def is_it_real
    raise TriangleError if 
    self.ang1 + self.ang2 <= self.ang3 || 
    self.ang1 + self.ang3 <= self.ang2 || 
    self.ang3 + self.ang2 <= self.ang1 ||
    self.ang1 <= 0 || self.ang2 <= 0 || self.ang3 <= 0
  end

  class TriangleError < StandardError
  end
end
