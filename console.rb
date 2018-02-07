require("pry")
require_relative("models/album.rb")
require_relative("models/artist.rb")

artist1 = Artist.new({"artist" => "Robin Trower"})
artist1.save()

artist2 = Artist.new({"artist" => "Camel"})
artist2.save()

artist3 = Artist.new({"artist" => "The Jam"})
artist3.save()

artist4 = Artist.new({"artist" => "Nickelback"})
artist4.save()

artist5 = Artist.new({"artist" => "ZZ Top"})
artist5.save()

binding.pry
nil
