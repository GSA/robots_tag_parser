# RobotsTagParser

A simple gem to parse X-Robots-Tag HTTP headers according to [Google X-Robots-Tag HTTP header specifications](https://developers.google.com/webmasters/control-crawl-index/docs/robots_meta_tag#using-the-x-robots-tag-http-header).

[![CircleCI](https://circleci.com/gh/MothOnMars/robots_tag_parser.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/MothOnMars/robots_tag_parser)
[![Code Climate](https://codeclimate.com/github/MothOnMars/robots_tag_parser.svg)](https://codeclimate.com/github/MothOnMars/robots_tag_parser)
[![Test Coverage](https://codeclimate.com/github/MothOnMars/robots_tag_parser/badges/coverage.svg)](https://codeclimate.com/github/MothOnMars/robots_tag_parser/coverage)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'robots_tag_parser', git: 'https://github.com/MothOnMars/robots_tag_parser'
```

And then execute:

    $ bundle

## Usage

### Basic examples
Get rules applying to all user agents:

```ruby
headers = { 'X-Robots-Tag' => ['noindex,noarchive', 'googlebot: nofollow'] }

RobotsTagParser.get_rules(headers: headers)
=> ['noindex', 'noarchive']
```

Get rules applying to specific user agents (which include generic
rules):

```ruby
headers = { 'X-Robots-Tag' => ['noindex,noarchive', 'googlebot: nofollow'] }

RobotsTagParser.get_rules(headers: headers, user_agent: 'googlebot')
=> ['noindex', 'noarchive', 'nofollow']
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/MothOnMars/robots_tag_parser).

## License

The gem is available as open source under the terms of the [CC0 License](LICENSE.md).

## Directives:
- [x] `all` - There are no restrictions for indexing or serving.
- [x] `none` - Equivalent to `noindex` and `nofollow`.
- [x] `noindex` - Do not show this page in search results and do not show a "Cached" link in search results.
- [x] `nofollow` - Do not follow the links on this page.
- [x] `noarchive` - Do not show a "Cached" link in search results.
- [x] `nosnippet` - Do not show a snippet in the search results for this page.
- [x] `notranslate` - Do not offer translation of this page in search results.
- [x] `noimageindex` - Do not index images on this page.
- [x] `unavailable_after` - Do not show this page in search results after the specified date/time.

Source: [https://developers.google.com/webmasters/control-crawl-index/docs/robots_meta_tag](https://developers.google.com/webmasters/control-crawl-index/docs/robots_meta_tag#valid-indexing--serving-directives)
