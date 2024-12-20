# frozen_string_literal: true

require_relative "day"

class Day5 < Day
  def part1
    rules, updates = rules_and_updates

    res = updates.filter do |pages|
      0.upto(pages.length - 2).map do |i|
        left = pages[i]
        right = pages[i + 1]

        next false if rules[right]&.include?(left)

        true
      end.all?
    end

    res.map { |pages| pages[pages.size / 2] }.sum
  end

  def part2
    rules, updates = rules_and_updates

    res = updates.filter do |pages|
      0.upto(pages.length - 2).map do |i|
        left = pages[i]
        right = pages[i + 1]

        next true if rules[right]&.include?(left)

        false
      end.any?
    end

    res.map do |pages|
      pages.sort! { |left, right| rules[right]&.include?(left) ? 1 : -1 }
      pages[pages.size / 2]
    end.sum
  end

  private

  def rules_and_updates
    rules, updates = input.split("\n\n")

    rr = {}
    rules.split("\n").each do |rule|
      key, value = rule.split("|").map(&:to_i)
      rr[key] ||= []
      rr[key] << value
    end

    uu = updates.split("\n").map { |line| line.split(",").map(&:to_i) }

    [rr, uu]
  end
end
