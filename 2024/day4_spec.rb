# frozen_string_literal: true

require_relative "day4"

RSpec.describe Day4 do
  subject(:day) { described_class.new(input) }

  let(:input) do
    <<~INPUT
      MMMSXXMASM
      MSAMXMSMSA
      AMXSXMAAMM
      MSAMASMSMX
      XMASAMXAMM
      XXAMMXXAMA
      SMSMSASXSS
      SAXAMASAAA
      MAMMMXMMMM
      MXMXAXMASX
    INPUT
  end

  describe "#part1" do
    it do
      expect(day.part1).to eq(18)
    end
  end

  describe "part 2" do
    it do
      expect(day.part2).to eq(9)
    end
  end
end
