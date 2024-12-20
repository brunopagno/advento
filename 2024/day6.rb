# frozen_string_literal: true

require_relative "day"

class Day6 < Day
  def part1
    grid = lines.map(&:chars)

    walk_route(grid).route.length
  end

  def part2
    grid = lines.map(&:chars)

    walk_route(grid).route.to_a[1..].map do |obstruction|
      grid[obstruction.y][obstruction.x] = "#"
      guard = walk_route(grid)
      grid[obstruction.y][obstruction.x] = "."

      guard.steps > 10_000 ? 1 : 0
    end.sum
  end

  private

  def walk_route(grid)
    y = grid.index { |l| l.include?("^") }
    x = grid[y].index("^")

    guard = Guard.new(Vec2.new(x, y), Vec2.new(0, -1))

    loop do
      target = guard.position + guard.direction

      break if target.x.negative? ||
               target.x >= grid.first.size ||
               target.y.negative? ||
               target.y >= grid.size ||
               guard.steps > 10_000

      if grid[target.y][target.x] == "#"
        guard.rotate
      else
        guard.move
      end
    end

    guard
  end
end

class Guard
  attr_reader :position, :direction, :route, :steps

  def initialize(position, direction)
    @position = position
    @direction = direction
    @route = Set[position.dup]
    @steps = 0
  end

  def move
    @position += @direction
    @route << position.dup
    @steps += 1
  end

  def rotate
    @direction = Vec2.new(-@direction.y, @direction.x)
  end
end

class Vec2
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(other)
    Vec2.new(x + other.x, y + other.y)
  end

  def hash
    [x, y].hash
  end

  def eql?(other)
    x == other.x && y == other.y
  end
end
