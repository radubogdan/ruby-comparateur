require "comparateur/version"
require "nokogiri"
require "diff-lcs"

module Le
  class Comparateur

    def calculate_similarity site1, site2
      nok_site1 = Nokogiri::HTML(site1)
      nok_site2 = Nokogiri::HTML(site2)

      arr_site1 = nok_site1.search('*').map(&:name)
      arr_site2 = nok_site2.search('*').map(&:name)
      lcs = Diff::LCS.LCS(arr_site1, arr_site2)

      return  (2.0 * lcs.length.to_f) / (arr_site1.length.to_f + arr_site2.length.to_f)
    end

  end
end
