require("pry")
require_relative("models/album.rb")
require_relative("models/artist.rb")

Album.delete_all()
Artist.delete_all()

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

album1 = Album.new({
  "title" => "Victims of the Fury",
  "genre" => "rock",
  "artist_id" => artist1.id
  })
album1.save()

binding.pry
nil
