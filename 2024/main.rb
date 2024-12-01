#!/usr/bin/env ruby

def main
  day = ARGV.first
  input = File.read("day#{day}_input.txt")

  return unless day && input

  require_relative "day#{day}"
  day_thing = Object.const_get("Day#{day}").new(input)
  puts "part1:"
  puts day_thing.part1

  puts ""

  puts "part2:"
  puts day_thing.part2

  puts "-----"
end

main if __FILE__ == $PROGRAM_NAME
