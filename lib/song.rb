require 'pry'
class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  

  
  def self.new_by_filename(filename)
    name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    binding.pry
    song = self.new(song_name)
    binding.pry
    song.artist_name=(name)
    binding.pry

  end

  
  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  

  
end