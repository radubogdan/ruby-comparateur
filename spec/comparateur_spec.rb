require_relative '../lib/comparateur.rb'

describe Comparateur do
  let(:extended_class) { Class.new { extend Comparateur } }
  let(:included_class) { Class.new { include Comparateur } }

  before(:each) do
    @str1 = "<html><body><ul><li><ul><li></li></ul></li></ul></body></html"
    @str2 = "<html><body><ul><li></li></ul></body></html"
    @nok1 = Nokogiri::HTML(@str1)
    @nok2 = Nokogiri::HTML(@str2)
  end

  describe "serialize_nokogiri_html" do
    it "should return array" do
      expect(extended_class.serialize_nokogiri_html(@nok1).class).to eq Array
      expect(included_class.new.serialize_nokogiri_html(@nok1).class).to eq Array
    end

    it "should return array with value" do
      expect(extended_class.serialize_nokogiri_html(@nok1)).to eq %w(html body ul li ul li)
      expect(included_class.new.serialize_nokogiri_html(@nok1)).to eq %w(html body ul li ul li)
    end
  end

  describe "serialize_url" do
    it "should return array" do
      expect(extended_class.serialize_url("http://google.com").class).to eq Array
      expect(included_class.new.serialize_url("http://google.com").class).to eq Array
    end
  end

  describe "serialize_content" do
    it "should return array" do
      expect(extended_class.serialize_content(@str1).class).to eq Array
      expect(included_class.new.serialize_content(@str1).class).to eq Array
    end

    it "should return array with value" do
      expect(extended_class.serialize_content(@str1)).to eq %w(html body ul li ul li)
      expect(included_class.new.serialize_content(@str1)).to eq %w(html body ul li ul li)
    end
  end

  describe "compare_nokogiri_html" do
    it "should return a Float number" do
      expect(extended_class.compare_nokogiri_html(@nok1, @nok2).class).to eq Float
      expect(included_class.new.compare_nokogiri_html(@nok1, @nok2).class).to eq Float
    end

    it "should return score" do
      expect(extended_class.compare_nokogiri_html(@nok1, @nok2)).to eq 0.8
      expect(included_class.new.compare_nokogiri_html(@nok1, @nok2)).to eq 0.8
    end
  end

  describe "compare_urls" do
    it "should return a Float number" do
      expect(extended_class.compare_urls("http://google.com", "https://duckduckgo.com").class).to eq Float
      expect(included_class.new.compare_urls("http://google.com", "https://duckduckgo.com").class).to eq Float
    end
  end

  describe "compare_content" do
    it "should return a Float number" do
      expect(extended_class.compare_content(@str1, @str2).class).to eq Float
      expect(included_class.new.compare_content(@str1, @str2).class).to eq Float
    end

    it "should return score" do
      expect(extended_class.compare_content(@str1, @str2)).to eq 0.8
      expect(included_class.new.compare_content(@str1, @str2)).to eq 0.8
    end
  end
  
  describe "compare_multiple_urls" do
    my_arr = %w(http://google.com https://duckduckgo.com http://bing.com http://ask.com)
    
    it "should return Hash" do
      expect(extended_class.compare_multiple_urls(my_arr).class).to eq Hash
      expect(included_class.new.compare_multiple_urls(my_arr).class).to eq Hash
    end
  end

  describe "lcs" do
    arr1 = %w(html body h1 a)
    arr2 = %w(html body h1 ul)

    it "should return score" do
      expect(extended_class.lcs(arr1, arr2)).to eq 0.75
      expect(included_class.new.lcs(arr1, arr2)).to eq 0.75
    end

    it "should return a Float number" do
      expect(extended_class.lcs(arr1, arr2).class).to eq Float
      expect(included_class.new.lcs(arr1, arr2).class).to eq Float
    end
  end
end
