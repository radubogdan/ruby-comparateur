load "./lib/comparateur.rb" # use require comparateur

# Create your own class and add
# Comparateur's functions as class methods
class LeComparateur
  extend Comparateur
end

# Create your class and include all
# functions as instance methods
class MyClass
  include Comparateur
end

# All examples use these
a = "<html><body><ul><li><ul><li></li></ul></li></ul></body></html"
b = "<html><body><ul><li></li></ul></body></html"
google_url = "http://google.com"
duckduck_url = "https://duckduckgo.com"
a_nok = Nokogiri::HTML(a)
b_nok = Nokogiri::HTML(b)
a_arr = %w(html body ul li ul li)
b_arr = %w(html body ul li)

# Serialize Nokogiri::HTML objects
# return: Array of HTML nodes
LeComparateur.serialize_nokogiri_html(a_nok) # ["html", "body", "ul", "li", "ul", "li"]

# Serialize URL
# return: Array of HTML nodes
LeComparateur.serialize_url(google_url) # Long array of nodes used in google.com

# Serialize Content
# return: Array of HTML nodes
LeComparateur.serialize_content(a) # ["html", "body", "ul", "li", "ul", "li"]
LeComparateur.serialize_content(b) # ["html", "body", "ul", "li"]

# Compare Nokogiri::HTML objects
LeComparateur.compare_nokogiri_html(a_nok, b_nok)

# Compare URLs
LeComparateur.compare_urls(google_url, duckduck_url) # 0.3815789473684211

# Compare content
LeComparateur.compare_content(a, b)

# Directly compare arrays of nodes
LeComparateur.lcs(a_arr, b_arr)
