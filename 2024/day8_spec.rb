# frozen_string_literal: true

require_relative "day8"

RSpec.describe Day8 do
  subject(:day) { described_class.new(input) }

  let(:input) do
    <<~INPUT
      ............
      ........0...
      .....0......
      .......0....
      ....0.......
      ......A.....
      ............
      ............
      ........A...
      .........A..
      ............
      ............
    INPUT
  end

  describe "#part1" do
    it do
      expect(day.part1).to eq(14)
    end
  end

  describe "part 2" do
    it do
      expect(day.part2).to eq(34)
    end
  end
end