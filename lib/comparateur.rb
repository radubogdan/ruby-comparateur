require "comparateur/version"
require "nokogiri"
require "diff-lcs"
require "open-uri"

module Comparateur

  def serialize_nokogiri_html nokogiri_html
    nokogiri_html.search('*').map(&:name)
  end

  def serialize_url url
    Nokogiri::HTML(open(url)).search('*').map(&:name)
  end

  def serialize_content str
    Nokogiri::HTML(str).search('*').map(&:name)
  end

  def compare_nokogiri_html nok1, nok2
    s1 = serialize_nokogiri_html(nok1)
    s2 = serialize_nokogiri_html(nok2)
    lcs(s1, s2)
  end

  def compare_urls url1, url2
    s1 = serialize_url(url1)
    s2 = serialize_url(url2)
    lcs(s1, s2)
  end

  def compare_content str1, str2
    s1 = serialize_content(str1)
    s2 = serialize_content(str2)
    lcs(s1, s2)
  end
  
  def compare_multiple_urls arr
    result = {}
    
    until arr.length == 1
      first = arr.shift
      
      arr.each do |url|
        score = compare_urls(first, url)
        result[[first, url]] = score
      end
    end
    
    result
  end

  def lcs arr1, arr2
    lcs = Diff::LCS.LCS(arr1, arr2)
    return  (2.0 * lcs.length.to_f) / (arr1.length.to_f + arr2.length.to_f)
  end

end
