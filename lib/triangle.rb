class Triangle

  attr_accessor :length_1, :length_2, :length_3
  
  def initialize(length_1, length_2, length_3)
    @length_1 = length_1
    @length_2 = length_2
    @length_3 = length_3

  end

  class TriangleError < StandardError

  end

  def combinded_lengths

    self.length_1  + self.length_2 + self.length_3

  end

  def mutually_limited_sides?

    self.length_1 < (combinded_lengths/2.0).ceil &&
    self.length_2 < (combinded_lengths/2.0).ceil &&
    self.length_3 < (combinded_lengths/2.0).ceil

  end

  def positive_sides?

    self.length_1 > 0 && self.length_2 > 0 && self.length_3 > 0

  end

  def kind

    if !self.positive_sides? || !self.mutually_limited_sides?

      raise TriangleError

    else

      if length_1 == length_2 && length_2 == length_3
        :equilateral
      elsif length_1 == length_2 || length_1 == length_3 || length_2 == length_3
        :isosceles
      else 
        :scalene
      end 
    end
  end
end
