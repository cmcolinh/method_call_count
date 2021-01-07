# frozen_string_literal: true

RSpec.describe MethodCallCount do
  class SomeStub
    def some_method
      'do something'
    end

    def a_different_method
      'do something different'
    end
  end

  it 'has a version number' do
    expect(MethodCallCount::VERSION).not_to be nil
  end

  it 'will add ability to count how many times a method was called' do
    some_stub = SomeStub::new
    expect(some_stub).not_to respond_to(:times_called)
    MethodCallCount.enable(SomeStub)
    expect(some_stub).to respond_to(:times_called)
  end

  it 'keep a proper count of how many times the methods were called' do
    MethodCallCount.enable(SomeStub)
    some_stub = SomeStub::new
    expect(some_stub.times_called[:some_method]).to eql(0)
    some_stub.some_method
    expect(some_stub.times_called[:some_method]).to eql(1)
    expect(some_stub.times_called[:a_different_method]).to eql(0)
  end
end
