require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song=self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #binding.pry
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      #binding.pry
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    #binding.pry
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    #binding.pry
    new_song = self.new
    new_song.name = data[1].delete_suffix(".mp3")
    new_song.artist_name = data[0]
    #binding.pry
    new_song.save

  end

  def self.destroy_all
    self.all.clear
  end



end

song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
binding.pry
p song.name
