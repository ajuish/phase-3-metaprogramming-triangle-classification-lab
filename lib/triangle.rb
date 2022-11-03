require "pry"

class Triangle
  # write code here
  attr_reader :x, :y, :z

  def initialize(x,y,z)
    @x = x
    @y = y
    @z = z
  end


  def kind
    validate_triangle
    if x == y && y == z
      :equilateral
    elsif x == y || y == z || x == z
      :isosceles
    else 
      :scalene
    end
  end

  def check_sides
    [x,y,z].all?(&:positive?)
  end

  def triangle_inequality
    x + y > z && (x-y).abs() < z
  end

  def validate_triangle
    raise TriangleError unless check_sides && triangle_inequality
  end

  class TriangleError < StandardError
  end
end

