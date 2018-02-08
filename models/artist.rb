require('pg')
require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id, :artist
  attr_writer :artist

  def initialize(options)
    @id = options['id'].to_i
    @artist = options['artist']
  end

  def save()
    sql = "INSERT INTO artists (artist) VALUES($1) RETURNING id"
    values = [@artist]
    @id = SQLRunner.run(sql, values)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SQLRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SQLRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SQLRunner.run(sql, values)
    return albums.map { |album| Album.new(album) }
  end

  def update()
    sql = "UPDATE artists SET artist = $1 WHERE id = $2"
    values = [@artist, @id]
    SQLRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values =[@id]
    SQLRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artist = SQLRunner.run(sql, values)
    return Artist.new(artist[0])
  end

end
