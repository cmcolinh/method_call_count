# MethodCallCount

This gem is a helper for Rspec or other testing frameworks, in particular in situations where you are using dependency injection, and you want to verify whether a certain input will result in that dependency being called.This will mixin a method into your class #times_called which is a hash that will be incremented each time a method is invoked on an object.  This count is enabled on a class.

There is also separately a class, MethodCallCount::CallableStub, which can be aused as a stub for classes that implement #call with kwargs or an option hash to capture the kwargs that were sent.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'method_call_count'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install method_call_count

## Usage

For MethodCallCount

```
class MyClass
  def some_method
    'do_something'
  end
end

MethodCallCount.enable(MyClass)

my_object = MyClass::new
my_object.some_method
my_object.times_called[:some_method] # returns 1
```

For MethodCallCount::CallableStub

```
my_stub = MethodCallCount::CallableStub::new
my_stub.call(arg: 'value')
my_stub.called_with[:arg] # returns 'value'
```

You can stub the return by providing the value you want returned as an argument in the constructor

```
my_stub = MethodCallCount::CallableStub::new('return_value')
my_stub.call(arg: 'value') # returns 'return_value'
```

You could also pass a block, which CallableStub will yield the input kwargs to

```
my_stub = MethodCallCount::CallableStub::new{|options| options[:arg]}
my_stub.call(arg: 'value') # returns 'value'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/method_call_count.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
