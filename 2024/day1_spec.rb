# frozen_string_literal: true

require_relative "day1"

RSpec.describe Day1 do
  subject(:day) { described_class.new(input) }

  let(:input) do
    <<~INPUT
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
    INPUT
  end

  describe "#part1" do
    it do
      expect(day.part1).to eq(11)
    end
  end

  describe "part 2" do
    it do
      expect(day.part2).to eq(31)
    end
  end
end
