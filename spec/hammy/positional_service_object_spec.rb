# frozen_string_literal: true

require "hammy/positional_service_object"

describe Hammy::PositionalServiceObject do
  subject(:adder) do
    Class.new(described_class.build(:a, :b)) do
      def add
        a + b
      end
    end
  end

  it "takes positional args" do
    expect(adder.add(1, 2)).to eq(3)
  end

  it "verifies argument count" do
    expect { adder.add(1) }.to raise_error(ArgumentError)
    expect { adder.add(1, 2, 3) }.to raise_error(ArgumentError)
  end
end
