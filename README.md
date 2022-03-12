# Bloomerang

This is an unofficial Ruby gem to interact with the v2 [bloomerang.co REST API](https://bloomerang.co/product/integrations-data-management/api/rest-api/).

Not all methods available in the API are currently implemented in this gem. If you find one missing that you need, feel free to add it!

## Implemented Methods

* Constituent
* Fund
* Transaction

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bloomerang'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bloomerang

## Usage

Set your Bloomerang API Key in ENV `BLOOMERANG_API_KEY`

Then, perform a request.

Sample GET: `Bloomerang::Constituent.new.all`

Sample POST: `Bloomerang::Constituent.new.merge(body)`

For POST requests and others requiring a body, refer to the [Bloomerang API documentation](https://bloomerang.co/product/integrations-data-management/api/rest-api) for the format required.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mcsweeneys/bloomerang. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mcsweeneys/bloomerang/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bloomerang project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mcsweeneys/bloomerang/blob/main/CODE_OF_CONDUCT.md).
