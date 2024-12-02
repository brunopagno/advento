# frozen_string_literal: true

require_relative "day"

class Day2 < Day
  def part1
    lines.count do |line|
      res = line.split.map(&:to_i).each_cons(2).map do |a, b|
        if a < b && b - a <= 3
          :up
        elsif b < a && a - b <= 3
          :down
        else
          :nop
        end
      end

      res.all?(:up) || res.all?(:down)
    end
  end

  def part2
    lines.count do |line|
      levels = line.split.map(&:to_i)

      result = levels.size.times.map do |i|
        attempt = levels.dup
        attempt.delete_at(i)

        res = attempt.each_cons(2).map do |a, b|
          if a < b && b - a <= 3
            :up
          elsif b < a && a - b <= 3
            :down
          else
            :nop
          end
        end

        res.all?(:up) || res.all?(:down)
      end

      result.any?
    end
  end
end
