# frozen_string_literal: true

class MethodCallCount
  class CallableStub
    def initialize
      @called_with = {}
    end
    def call(options={})
      @called_with = options
      options[:change_orders]
    end
    def called_with
      @called_with.dup
    end
  end
end

