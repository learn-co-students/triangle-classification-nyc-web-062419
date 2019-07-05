require 'pry'
class Triangle
  attr_reader :a,:b,:c
  def initialize(a,b,c)
    @a,@b,@c = a,b,c
  end
  def valid?
    if ![self.a,self.b,self.c].any? {|x| x <= 0}
    permutations = [self.a,self.b,self.c].permutation.to_a
    !permutations.any? {|x| (x[0]+x[1])<= x[2] }
    else 
      false
    end
  end
  def kind
    if valid?  
      case [self.a,self.b,self.c].uniq.length
      when 1
        :equilateral
      when 2
        :isosceles
      when 3
        :scalene
      end
    else
      raise TriangleError
    end
  end
  class TriangleError < StandardError
  end      
end




t6 = Triangle.new(3,2,3)
t5 = Triangle.new(5,2,3)
t4 = Triangle.new(8,2,3)
t2 = Triangle.new(7,7,3)
t3 = Triangle.new(0,0,0)