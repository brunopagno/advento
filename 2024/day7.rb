# frozen_string_literal: true

require_relative "day"

class Day7 < Day
  def part1
    lines.map do |equation|
      result, values = equation.split(":")
      result = result.to_i
      values = values.split.map(&:to_i)

      outputs = values.drop(1).reduce([values.first]) do |acc, n|
        acc.flat_map { |e| [e + n, e * n] }
      end

      outputs.include?(result) ? result : 0
    end.sum
  end

  def part2
    lines.map do |equation|
      result, values = equation.split(":")
      result = result.to_i
      values = values.split.map(&:to_i)

      outputs = values.drop(1).reduce([values.first]) do |acc, n|
        acc.flat_map { |e| [e + n, e * n, "#{e}#{n}".to_i] }
      end

      outputs.include?(result) ? result : 0
    end.sum
  end
end
