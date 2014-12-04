require "comparateur/version"
require "nokogiri"
require "diff-lcs"

module Le
  class Comparateur

    def calculate_similarity site1, site2
      site1 = Nokogiri::HTML(site1) unless site1.is_a?(Nokogiri::HTML::Document)
      site2 = Nokogiri::HTML(site2) unless site2.is_a?(Nokogiri::HTML::Document)

      arr_site1 = site1.search('*').map(&:name)
      arr_site2 = site2.search('*').map(&:name)
      lcs = Diff::LCS.LCS(arr_site1, arr_site2)

      return  (2.0 * lcs.length.to_f) / (arr_site1.length.to_f + arr_site2.length.to_f)
    end

  end
end
