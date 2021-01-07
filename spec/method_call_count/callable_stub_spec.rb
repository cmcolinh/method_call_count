# frozen_string_literal: true

RSpec.describe MethodCallCount::CallableStub do
  describe '#call' do
    it 'keeps track of what arguments it was called with' do
      callable_stub = MethodCallCount::CallableStub::new
      callable_stub.call(arg: 'value')
      expect(callable_stub.called_with[:arg]).to eql('value')
    end

    it 'returns the value given when callable stub initialized with a value' do
      callable_stub = MethodCallCount::CallableStub::new('fixed_value')
      return_value = callable_stub.call(arg: 'value')
      expect(return_value).to eql('fixed_value')
    end

    it 'evaluates the block when passed one and not passed a value' do
      callable_stub = MethodCallCount::CallableStub::new{|options| options[:arg]}
      return_value = callable_stub.call(arg: 'value')
      expect(return_value).to eql('value')
    end

    it 'returns the value when provided a nonnull value, ignoring the provided block' do
      callable_stub = MethodCallCount::CallableStub::new('fixed_value'){|options| options[:arg]}
      return_value = callable_stub.call(arg: 'value')
      expect(return_value).to eql('fixed_value')
    end
  end
end
