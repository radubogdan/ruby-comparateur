# Comparateur

Calculate the structural similarity between two HTML documents

## Installation

Add this line to your application's Gemfile:

    gem 'comparateur'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install comparateur

## Usage

```ruby
require 'comparateur'

exp = Le::Comparateur.new

a = "<html><body></body></html>"
b = "<html><body><h1></h1></body></html>"

c = Nokogiri::HTML("<html><body></body></html>")
d = a

p exp.calculate_similarity(a, b) * 100 # in %
p exp.calculate_similarity(c, d)
```

## Contributing

1. Fork it ( https://github.com/radubogdan/ruby-comparateur/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
