class Triangle
  # write code here
  attr_reader :side_one, :side_two, :side_three

  def initialize(side_one, side_two, side_three)
  	@side_three = side_three
  	@side_two = side_two
  	@side_one = side_one
  end

  def kind 
  	valid_triangle
  	if side_one == side_two && side_two == side_three
  		:equilateral
  	elsif side_one == side_two || side_two == side_three || side_three == side_one
  		:isosceles
  	else
  		:scalene
  	end
  end

  def valid_triangle
  	triangle_inequality_thm = [(side_one + side_two > side_three), (side_one + side_three > side_two), (side_three + side_two > side_one)]
  	[side_one, side_two, side_three].each do |side|
  		triangle_inequality_thm << false if side <= 0
  	raise TriangleError if triangle_inequality_thm.include?(false)
  	end
  end

  class TriangleError < StandardError
  	
  end
end

