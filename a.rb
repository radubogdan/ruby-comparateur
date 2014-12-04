load "lib/comparateur.rb"

exp = Le::Comparateur.new

#site1 = Nokogiri::HTML("<html><body><h1></h1><h2></h2></body></html>")


site1 = ["html", "body"]
site2 = Nokogiri::HTML("<html><body></body></html>")

p exp.calculate_similarity(site1, site2)
