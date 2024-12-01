# frozen_string_literal: true

require_relative "day"

class Day1 < Day
  def part1
    left, right = input.split("\n").map do |line|
      line.split.map(&:to_i)
    end.transpose

    left.sort!
    right.sort!

    left.zip(right).sum { |l, r| (l - r).abs }
  end

  def part2
    left, right = input.split("\n").map do |line|
      line.split.map(&:to_i)
    end.transpose

    left.map { |el| el * right.count(el) }.sum
  end
end
