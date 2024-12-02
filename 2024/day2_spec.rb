# frozen_string_literal: true

require_relative "day2"

RSpec.describe Day2 do
  subject(:day) { described_class.new(input) }

  let(:input) do
    <<~INPUT
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
    INPUT
  end

  describe "#part1" do
    it do
      expect(day.part1).to eq(2)
    end
  end

  describe "part 2" do
    it do
      expect(day.part2).to eq(4)
    end
  end
end
