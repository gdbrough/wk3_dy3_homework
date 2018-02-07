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

album2 = Album.new({
  "title" => "Stationary Traveller",
  "genre" => "rock",
  "artist_id" => artist2.id
  })
album2.save()

album3 = Album.new({
  "title" => "In The City",
  "genre" => "punk",
  "artist_id" => artist3.id
  })
album3.save()

album4 = Album.new({
  "title" => "Silver Side Up",
  "genre" => "rock",
  "artist_id" => artist4.id
  })
album4.save()

album5 = Album.new({
  "title" => "The Long Road",
  "genre" => "rock",
  "artist_id" => artist4.id
  })
album5.save()

album6 = Album.new({
  "title" => "All the Right Reasons",
  "genre" => "rock",
  "artist_id" => artist4.id
  })
album6.save()

album7 = Album.new({
  "title" => "Dark Horse",
  "genre" => "rock",
  "artist_id" => artist4.id
  })
album7.save()

album8 = Album.new({
  "title" => "Eliminator",
  "genre" => "rock",
  "artist_id" => artist5.id
  })
album8.save()

album9 = Album.new({
  "title" => "Rio Grande Mud",
  "genre" => "rock",
  "artist_id" => artist5.id
  })
album9.save()

# p Artist.all()
# p Album.all()
#
# p artist4.albums()
# p album1.artists()

artist5.artist = "ZZTop"
artist5.update()

binding.pry
nil
