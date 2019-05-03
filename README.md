# Стерлядь!!!

Another Yandex Translate API client.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sterlet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sterlet

## Usage

```ruby
> require 'sterlet'
=> true
> client = Sterlet::Client.new(ENV['STERLET_API_KEY'])
> client.langs
=> {:af=>"Afrikaans", :am=>"Amharic", ... }
> client.dirs
=> [[:az, :ru], [:be, :bg], ...]
> client.detect('Любить жмыхнуло братан')
=> :ru
irb(main):007:0> client.translate('Любить жмыхнуло братан', to: :en)
=> "Love smahnula bro"
> client.translate('Любить жмыхнуло братан', to: :en, from: 'bg')
=> "Love smahnula love"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RGBD/sterlet-rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
