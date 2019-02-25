# frozen_string_literal: true

require_relative "./keyword_service_object"
require_relative "./positional_service_object"

module Hammy
  module ServiceObject
    extend self

    def positional(*args, **kargs)
      Hammy::PositionalServiceObject.build(*args, **kargs)
    end

    def keyword(*args, **kargs)
      Hammy::KeywordServiceObject.build(*args, **kargs)
    end
  end
end
