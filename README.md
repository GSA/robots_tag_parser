# RobotsTagParser

A simple gem to parse X-Robots-Tag HTTP headers according to [Google X-Robots-Tag HTTP header specifications](https://developers.google.com/webmasters/control-crawl-index/docs/robots_meta_tag#using-the-x-robots-tag-http-header).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'robots_tag_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install robots_tag_parser

## Usage

### Basic example
Get rules applied to all user agents:

```ruby
headers = { 'X-Robots-Tag' => ['noindex,noarchive', 'googlebot: nofollow' }

RobotsTagParser.get_rules(headers: headers)
=> ['noindex', 'noarchive']
```

Get rules applying to specific user agents (which include generic
rules):
```ruby
headers = { 'X-Robots-Tag' => ['noindex,noarchive', 'googlebot: nofollow' }

RobotsTagParser.get_rules(headers: headers, user_agent: 'googlebot')
=> ['noindex', 'noarchive', 'nofollow']



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/robots_tag_parser.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
