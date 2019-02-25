# frozen_string_literal: true

require "hammy/service_object"

describe Hammy::ServiceObject do
  subject(:adder) do
    Class.new(described_class.send(arg_style, :a, :b)) do
      def add
        a + b
      end
    end
  end

  context "when using positional args" do
    let(:arg_style) do
      :positional
    end

    it do
      expect(adder.add(1, 2)).to eq(3)
    end
  end

  context "when using keyword args" do
    let(:arg_style) do
      :keyword
    end

    it do
      expect(adder.add(a: 1, b: 2)).to eq(3)
    end
  end
end
