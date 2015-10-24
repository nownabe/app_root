# AppRoot
[![Gem Version](https://badge.fury.io/rb/app_root.svg)](https://badge.fury.io/rb/app_root)

Detect the application's root directory.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'app_root'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app_root

## Usage
### Basic Usage
```ruby
require "app_root"

puts AppRoot.path("config.ru")
#=> /path/to/your/application/root
```

### Integrate Your App
Using AppRoot.path:

```ruby
class MyApp
  def self.root
    AppRoot.path("config.ru")
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/nownabe/app_root/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
