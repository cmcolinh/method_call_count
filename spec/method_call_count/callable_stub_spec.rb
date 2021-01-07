# frozen_string_literal: true

RSpec.describe MethodCallCount::CallableStub do
  it 'keeps track of what arguments it was called with' do
    callable_stub = MethodCallCount::CallableStub::new
    callable_stub.call(arg: 'value')
    expect(callable_stub.called_with[:arg]).to eql('value')
  end
end
