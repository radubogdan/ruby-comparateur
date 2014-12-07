# Comparateur

[![Gem Version](https://badge.fury.io/rb/comparateur.svg)](http://badge.fury.io/rb/comparateur)

Calculate the structural similarity between two HTML documents.

**How it works**
It serializes strings, Nokogiri::HTML objects and URLs to arrays containing node's tag names and finds the longest common sequence between two serialized arrays.

The similarity is measured with the formula:
`2 * length(LCS Array) / (length(TreeA) + length(treeB))`

**How is done**
Classes are about objects and Modules are about functions. That's why you have to create a class and `include` or `extend` it with `Comparateur` and use it as you like. This implementation also let you built your own cache system.

## Installation

Add this line to your application's Gemfile:

    gem 'comparateur'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install comparateur

## Usage

**From Ruby**

```ruby
require 'comparateur'

class LeComparateur
  extend Comparateur
end

google_url = "http://google.com"
duckduck_url = "https://duckduckgo.com"

LeComparateur.compare_urls(google_url, duckduck_url) # 0.3815789473684211
```

Long Ruby example [here](https://raw.githubusercontent.com/radubogdan/ruby-comparateur/master/examples/a.rb)

**From terminal**
```
$ comparateur http://google.com https://duckduckgo.com
```

## Methods

`serialize_nokogiri_html(obj1)`
- `obj1`: Nokogiri::HTML object.
- `return`: Array containing node's tag names.

`serialize_url(url)`
- `url`: URL of the website.
- `return`: Array containing node's tag names.

`serialize_content(str)`
- `str`: String containing the html.
- `return`: Array containing node's tag names.

`compare_nokogiri_html(nok1, nok2)`
- `nok1, nok2`: Nokogiri::HTML objects.
- `return`: Score (0-1).

`compare_urls(url1, url2)`
- `url1, url2`: URL of two different websites.
- `return`: Score (0-1).

`compare_content(str1, str2)`
- `str1, str2`: First and second string which contain the html.
- `return`: Score (0-1).

`lcs(arr1, arr2)`
- `arr1, arr2`: First and second array which contain the node's tag names.
- `return`: Score (0-1)

## Contributing

1. Fork it ( https://github.com/radubogdan/ruby-comparateur/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
