# frozen_string_literal: true

require_relative "./abstract_service_object"

module Hammy
  class KeywordServiceObject < Hammy::AbstractServiceObject

    def validate_args!(args, kargs)
      raise ArgumentError.new("wrong number of arguments (given #{args.size}, expected 0; required keywords: #{@args.join(', ')})") unless args.empty?

      missing = @args - kargs.keys
      raise ArgumentError.new("missing keywords: #{missing.join(', ')}") unless missing.empty?

      unknown = kargs.keys - @args
      raise ArgumentError.new("unknown keywords: #{unknown.join(', ')}") unless unknown.empty?
    end

    def initial_instance_variables(_args, kargs)
      @args.map do |a|
        ["@#{a}", kargs[a]]
      end
    end

    def private_getters
      @args
    end
  end
end
