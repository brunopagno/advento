# frozen_string_literal: true

require_relative "day7"

RSpec.describe Day7 do
  subject(:day) { described_class.new(input) }

  let(:input) do
    <<~INPUT
      190: 10 19
      3267: 81 40 27
      83: 17 5
      156: 15 6
      7290: 6 8 6 15
      161011: 16 10 13
      192: 17 8 14
      21037: 9 7 18 13
      292: 11 6 16 20
    INPUT
  end

  describe "#part1" do
    it do
      expect(day.part1).to eq(3749)
    end
  end

  describe "part 2" do
    it do
      expect(day.part2).to eq(11_387)
    end
  end
end
