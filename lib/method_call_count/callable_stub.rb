# frozen_string_literal: true

class MethodCallCount
  class CallableStub
    def initialize(value = nil, &block)
      @block = value.nil? ? block : ->(options){value}
      @called_with = {}
    end
    def call(options={})
      @called_with = options
      @block&.call(options)
    end
    def called_with
      @called_with.dup
    end
  end
end

