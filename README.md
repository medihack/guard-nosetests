# Guard::Nosetests

Guard::Nosetests allows to automatically & intelligently launch tests with the
[nose (testing for Python)](https://nose.readthedocs.org/en/latest/) when files are modified.

## Install

Please be sure to have [Guard](http://github.com/guard/guard) installed before continue.

The simplest way to install Guard::Nosetests is to use [Bundler](http://gembundler.com/).

Add Guard::Nosetests to your `Gemfile`:

```ruby
group :development do
  gem 'guard-nosetests'
end
```

and install it by running Bundler:

```bash
$ bundle
```

Add guard definition to your Guardfile by running the following command:

```bash
guard init nosetests
```

## Usage

Please read [Guard usage doc](http://github.com/guard/guard#readme)

## Guardfile

Guard::Nosetests can be really adapated to all kind of projects.
Please read [guard doc](http://github.com/guard/guard#readme) for more info about Guardfile DSL.

### Standard Guardfile when using Nosetests

```ruby
guard 'nosetests' do
  watch(%r{^.*/test_\w+\.py$})
end
```

## Options

You can change the default location and pattern of minitest files:

```ruby
guard 'nosetests', test_paths: ['test'] do
  # ...
end
```

You can pass any of the standard nosetests CLI options using the :cli option:

```ruby
guard 'nosetests', :cli => "--nocapture" do
  # ...
end
```

### List of available options:

```ruby
:cli => '--nocapture'       # pass arbitrary nosetests CLI arguments, default: ''
:test_paths => ['test']     # specify an array of paths that contain test files, default: %w[test]
:all_on_start => false      # run all tests in group on startup, default: true
```

## Development

* Source hosted at [GitHub](https://github.com/medihack/guard-nosetests).

Pull requests are very welcome! Please try to follow these simple rules if applicable:

* Please create a topic branch for every separate change you make.
* Make sure your patches are well tested. All specs run by Travis CI must pass.
* Update the [README](https://github.com/medihack/guard-nosetests/blob/master/README.md).
* Please **do not change** the version number.

## TODO

* Write some spec.
* Provide some guard-rspec features, like focus_on_failed or all_after_pass.

## Author

[Kai Schlamp](https://github.com/medihack)
