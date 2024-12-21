# frozen_string_literal: true

class Vec2
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_a
    [x, y]
  end

  def +(other)
    Vec2.new(x + other.x, y + other.y)
  end

  def -(other)
    Vec2.new(x - other.x, y - other.y)
  end

  def hash
    [x, y].hash
  end

  def eql?(other)
    x == other.x && y == other.y
  end
end
