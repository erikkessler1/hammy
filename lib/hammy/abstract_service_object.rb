# frozen_string_literal: true

module Hammy
  class AbstractServiceObject

    def self.build(*args, **kargs)
      new(*args, **kargs).klass
    end

    def initialize(*args, **kargs)
      @args = args
      @kargs = kargs
    end

    def klass
      this = self

      Class.new do
        eigenclass = class << self; self; end
        eigenclass.class_eval do
          define_method(:method_missing) do |method, *args, **kargs, &block|
            return super(method, *args, **kargs, &block) unless this.valid_action?(self, method)

            new(args, kargs).send(method)
          end

          define_method(:respond_to_missing?) do |method, include_private = false|
            this.valid_action?(self, method) || super(method, include_private)
          end
        end

        define_method(:initialize) do |args, kargs|
          this.validate_args!(args, kargs)

          this.initial_instance_variables(args, kargs).each do |var, value|
            instance_variable_set(var, value)
          end
        end

        this.public_getters.each do |getter|
          attr_reader(getter)
        end

        protected

        this.protected_getters.each do |getter|
          attr_reader(getter)
        end

        private

        this.private_getters.each do |getter|
          attr_reader(getter)
        end
      end
    end

    def valid_action?(klass, method)
      klass.instance_methods(false).include?(method)
    end

    def validate_args!(args, kargs); end

    def initial_instance_variables(_args, _kargs)
      {}
    end

    def public_getters
      []
    end

    def protected_getters
      []
    end

    def private_getters
      []
    end
  end
end
