# Raven.js Gem
[![Gem Version](https://badge.fury.io/rb/ravenjs-gem.svg)](http://badge.fury.io/rb/ravenjs-gem) [![Dependency Status](https://gemnasium.com/ets-berkeley-edu/ravenjs-gem.svg)](https://gemnasium.com/ets-berkeley-edu/ravenjs-gem) [![Code Climate](http://img.shields.io/codeclimate/github/ets-berkeley-edu/ravenjs-gem.svg)](https://codeclimate.com/github/ets-berkeley-edu/ravenjs-gem)

[Raven.js][ravenjs] as a Ruby gem.

## Getting Started

Add the gem to your Gemfile:

```ruby
gem "ravenjs-gem"
```

And run

```bash
bundle install
```
in the terminal to download the resources.

### Adding the files to your projects

In order for the files to load, you'll need to do add them.

`application.js`:

```javascript
//= require raven
```

and you should be good to go.

## Updating this plug-in

If you would like to update this gem you should take the following steps:

1. `rake download VERSION=X.X.X`. If you don't specify the version, it will get the latest one.
1. `rake tag VERSION=X.X.X` will tag the version you've specified as the standard version.
1. Make a Pull request

Then the maintainer of the gem will need to do the following steps:

1. Update the version [lib/ravenjs-gem/version.rb](lib/ravenjs-gem/version.rb)
1. Run `gem build ravenjs-gem.gemspec` to package the gem
1. Once satisfied, push the gem up to RubyGems.org with `gem push ravenjs-gem-<VERSION>.gem`
1. Update [the changelog](CHANGELOG.md)

[ravenjs]: https://github.com/getsentry/raven-js
