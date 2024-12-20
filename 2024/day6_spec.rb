# frozen_string_literal: true

require_relative "day6"

RSpec.describe Day6 do
  subject(:day) { described_class.new(input) }

  let(:input) do
    <<~INPUT
      ....#.....
      .........#
      ..........
      ..#.......
      .......#..
      ..........
      .#..^.....
      ........#.
      #.........
      ......#...
    INPUT
  end

  describe "#part1" do
    it do
      expect(day.part1).to eq(41)
    end
  end

  describe "part 2" do
    it do
      expect(day.part2).to eq(6)
    end
  end
end
