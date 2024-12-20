# frozen_string_literal: true

require_relative "day"

class Day4 < Day
  def part1
    count = 0

    j = 0
    lines.each do |line|
      0.upto(line.length) do |i|
        next unless line[i] == "X"

        # horizontal and vertical
        count += 1 if i < line.length - 3 && line[i + 1] == "M" && line[i + 2] == "A" && line[i + 3] == "S"
        count += 1 if i >= 3 && line[i - 1] == "M" && line[i - 2] == "A" && line[i - 3] == "S"
        count += 1 if j < lines.length - 3 && lines[j + 1][i] == "M" && lines[j + 2][i] == "A" && lines[j + 3][i] == "S"
        count += 1 if j >= 3 && lines[j - 1][i] == "M" && lines[j - 2][i] == "A" && lines[j - 3][i] == "S"

        # diagonals
        count += 1 if i >= 3 && j >= 3 && lines[j - 1][i - 1] == "M" && lines[j - 2][i - 2] == "A" && lines[j - 3][i - 3] == "S"
        count += 1 if i < line.length - 3 && j >= 3 && lines[j - 1][i + 1] == "M" && lines[j - 2][i + 2] == "A" && lines[j - 3][i + 3] == "S"
        count += 1 if i < line.length - 3 && j < lines.length - 3 && lines[j + 1][i + 1] == "M" && lines[j + 2][i + 2] == "A" && lines[j + 3][i + 3] == "S"
        count += 1 if i >= 3 && j < lines.length - 3 && lines[j + 1][i - 1] == "M" && lines[j + 2][i - 2] == "A" && lines[j + 3][i - 3] == "S"
      end
      j += 1
    end

    count
  end

  def part2
    count = 0

    1.upto(lines.length - 2) do |j|
      line = lines[j]
      1.upto(line.length - 2) do |i|
        next unless line[i] == "A"

        count += 1 if lines[j - 1][i - 1] == "M" && lines[j + 1][i - 1] == "M" && lines[j + 1][i + 1] == "S" && lines[j - 1][i + 1] == "S"
        count += 1 if lines[j - 1][i - 1] == "S" && lines[j + 1][i - 1] == "M" && lines[j + 1][i + 1] == "M" && lines[j - 1][i + 1] == "S"
        count += 1 if lines[j - 1][i - 1] == "S" && lines[j + 1][i - 1] == "S" && lines[j + 1][i + 1] == "M" && lines[j - 1][i + 1] == "M"
        count += 1 if lines[j - 1][i - 1] == "M" && lines[j + 1][i - 1] == "S" && lines[j + 1][i + 1] == "S" && lines[j - 1][i + 1] == "M"
      end
      j += 1
    end

    count
  end
end
