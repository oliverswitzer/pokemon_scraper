require './lib/pokemon'
require './lib/scraper'
require 'debugger'



pokemon_scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")

poke_array = pokemon_scraper.get_poke_names

poke_objects = poke_array.collect {|pokemon_name| Pokemon.new(pokemon_name)}

poke_names = poke_objects.collect {|poke_obj| poke_obj.name}


puts "Options: "
puts "  Type a Pokémon's name to send it to battle and have it say its name"
puts "  Type 'l' to see a list of all the Pokémon"

inp = gets.chomp.capitalize

# while inp != 'L' || not poke_names.include?(inp)
#   puts "Either that's not a valid input or you're entering a Pokémon's name that doesn't exist!"
#   inp = gets.chomp.capitalize
# end
if inp == 'L'
  poke_names.each do |pokemon|
    puts "** #{pokemon}"
  end
elsif poke_names.include?(inp)
  selected_pokemon = poke_objects.select {|pokemon| pokemon.name == inp}
  i = 0
  50.times do
    sleep(0.09)
    puts " "*i + "*"
    i += 1
  end
  puts " "*49 + "***"
  puts " "*49 + "*O*"
  puts " "*49 + "***"

  selected_pokemon[0].say_name
end


