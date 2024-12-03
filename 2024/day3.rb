# frozen_string_literal: true

require_relative "day"

class Day3 < Day
  def part1
    input.scan(/mul\(\d{1,3},\d{1,3}\)/).map do |item|
      item
        .scan(/(\d+),(\d+)/)
        .first
        .map(&:to_i)
        .reduce(:*)
    end.sum
  end

  def part2
    doing = true

    input
      .scan(/mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/)
      .map do |item|
        if item.start_with?("do(")
          doing = true
          0
        elsif item.start_with?("don")
          doing = false
          0
        elsif doing
          item
            .scan(/(\d+),(\d+)/)
            .first
            .map(&:to_i)
            .reduce(:*)
        else
          0
        end
      end.sum
  end
end
