require 'open-uri'
require 'nokogiri'
require 'debugger'

class Scraper
  attr_accessor :html

  def initialize(url)
    download = open(url)
    @html = Nokogiri::HTML(download)
  end

  def get_poke_names
    pokemon_array = []

    all_anchor_titles = html.search("a @title")
    # debugger
    poke_regex = /(\w*)\s(\(Pokémon\))/
    all_anchor_titles.each do |anchor|
      anchor_str = anchor.text
      m = poke_regex.match(anchor_str)
      # debugger
      if m.nil?
        #do nothing
      elsif m[2] == "(Pokémon)"
        pokemon_array << m[1]
      end
    end
    pokemon_array
  end
end





