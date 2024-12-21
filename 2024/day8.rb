# frozen_string_literal: true

require_relative "day"
require_relative "lib/vec2"

class Day8 < Day
  def part1
    grid = lines.map(&:chars)

    antennas = {}
    grid.each_with_index do |line, y|
      line.each_with_index do |cell, x|
        if cell != "."
          antennas[cell] ||= []
          antennas[cell] << Vec2.new(x, y)
        end
      end
    end

    antinodes = Set.new
    antennas.each_value do |points|
      points.permutation(2) do |a, b|
        target = a - (b - a)
        antinodes << target if target.x.between?(0, grid.first.size - 1) && target.y.between?(0, grid.size - 1)
      end
    end

    antinodes.size
  end

  def part2
    grid = lines.map(&:chars)

    antennas = {}
    grid.each_with_index do |line, y|
      line.each_with_index do |cell, x|
        if cell != "."
          antennas[cell] ||= []
          antennas[cell] << Vec2.new(x, y)
        end
      end
    end

    antinodes = Set.new
    antennas.each_value do |points|
      points.permutation(2) do |a, b|
        diff = (b - a)
        target = a + diff
        while target.x.between?(0, grid.first.size - 1) && target.y.between?(0, grid.size - 1)
          antinodes << target
          target += diff
        end
      end
    end

    antinodes.size
  end
end
