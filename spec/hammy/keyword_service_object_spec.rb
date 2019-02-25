# frozen_string_literal: true

require "hammy/keyword_service_object"

describe Hammy::KeywordServiceObject do
  subject(:adder) do
    Class.new(described_class.build(:a, :b)) do
      def add
        a + b
      end
    end
  end

  it "takes keyword args" do
    expect(adder.add(a: 1, b: 2)).to eq(3)
  end

  it "verifies arguments" do
    expect { adder.add(a: 1) }.to raise_error(ArgumentError)
    expect { adder.add(1, 2) }.to raise_error(ArgumentError)
    expect { adder.add(a: 1, c: 2) }.to raise_error(ArgumentError)
  end
end
