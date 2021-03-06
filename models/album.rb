require('pg')
require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :title, :genre, :artist_id
  attr_writer :title, :genre, :artist_id

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"]
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SQLRunner.run(sql, values)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SQLRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SQLRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artists = SQLRunner.run(sql, values)
    return artists.map { |artist| Artist.new(artist) }
  end

  def update()
    sql = "UPDATE albums SET title = $1, genre = $2, artist_id = $3 WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SQLRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values =[@id]
    SQLRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SQLRunner.run(sql, values)
    return Album.new(album.first)
  end

end
