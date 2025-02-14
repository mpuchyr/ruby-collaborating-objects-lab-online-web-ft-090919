class Artist
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_or_create_by_name(name)
    this_artist = nil
    self.all.each do |artist|
      if artist.name == name
        this_artist = artist
      end
    end
    
    if this_artist == nil
      this_artist = Artist.new(name)
    end
    this_artist
  end
  
  def print_songs
    self.songs.each {|song| puts song.name}
  end
  

end