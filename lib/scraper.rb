require 'open-uri'
require 'nokogiri'
require 'debugger'

class Scraper
  attr_accessor :html

  def initialize(url)
    @html = Nokogiri::HTML(open(url))
  end

  def get_poke_names
    pokemon_html = html.search("#mw-content-text table tbody tr")
    pokemon_html.inspect
  end

end



poke_scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")

poke_scraper.get_poke_names