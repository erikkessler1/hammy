# frozen_string_literal: true

require_relative "./abstract_service_object"

module Hammy
  class PositionalServiceObject < Hammy::AbstractServiceObject

    def validate_args!(pargs, kargs)
      args = all_args(pargs, kargs)
      raise ArgumentError.new("wrong number of arguments (given #{args.size}, expected #{@args.size})") if args.size != @args.size
    end

    def initial_instance_variables(pargs, kargs)
      args = all_args(pargs, kargs)
      @args.zip(args).map { |a, b| ["@#{a}", b] }
    end

    def private_getters
      @args
    end

    private

    def all_args(pargs, kargs)
      return pargs unless kargs.any?

      pargs + [kargs]
    end
  end
end
