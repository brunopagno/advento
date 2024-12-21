# frozen_string_literal: true

require_relative "day9"

RSpec.describe Day9 do
  subject(:day) { described_class.new(input) }

  let(:input) do
    <<~INPUT
      2333133121414131402
    INPUT
  end

  describe "#part1" do
    it do
      expect(day.part1).to eq(1928)
    end
  end

  describe "part 2" do
    it do
      expect(day.part2).to eq(2858)
    end
  end
end
