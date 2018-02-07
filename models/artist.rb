require('pg')
require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id, :artist

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

end
