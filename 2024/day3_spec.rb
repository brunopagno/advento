# frozen_string_literal: true

require_relative "day3"

RSpec.describe Day3 do
  subject(:day) { described_class.new(input) }

  describe "#part1" do
    let(:input) do
      <<~INPUT
        xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
      INPUT
    end

    it do
      expect(day.part1).to eq(161)
    end
  end

  describe "part 2" do
    let(:input) do
      <<~INPUT
        xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
      INPUT
    end

    it do
      expect(day.part2).to eq(48)
    end
  end
end
