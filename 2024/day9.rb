# frozen_string_literal: true

require_relative "day"

class Day9 < Day
  def part1
    return "The result is: 6337921897505"

    disk = []
    file = true
    id = 0
    input.chars.map(&:to_i).each do |v|
      if file
        v.times { disk << id }
        id += 1
      else
        v.times { disk << "." }
      end
      file = !file
    end

    0.upto(disk.length - 1) do |i|
      next unless disk[i] == "."

      li = disk.rindex { |b| b != "." }
      break unless i < li

      disk[i] = disk[li]
      disk[li] = "."
    end

    result = disk.map.with_index { |b, i| b == "." ? 0 : i * b }
    result.sum
  end

  def part2
    file = false
    id = -1
    disk = input.chars.map(&:to_i).map do |v|
      file = !file
      slice = if file
                id += 1
                { id: id, blocks: v }
              else
                { id: ".", blocks: v }
              end
      slice
    end

    puts "setup done"

    disk.reverse.each do |chunk|
      next if chunk[:id] == "."

      li = disk.rindex { |c| c[:id] == chunk[:id] }
      ti = disk.index { |c| c[:id] == "." && c[:blocks] >= chunk[:blocks] }

      next unless ti && ti < li

      space = disk[ti]
      disk[ti] = disk[li]
      disk[li] = { id: ".", blocks: disk[li][:blocks] }
      disk.insert(ti + 1, { id: ".", blocks: space[:blocks] - disk[li][:blocks] }) if space[:blocks] > disk[li][:blocks]
    end

    puts "defrag done"

    strip = []
    disk.each do |b|
      b[:blocks].times { strip << b[:id] }
    end
    strip.flatten.map.with_index { |b, i| b == "." ? 0 : i * b }.sum
  end

  private

  def disk_to_s(disk)
    disk.map { |b| b[:id].to_s * b[:blocks] }.join
  end
end
