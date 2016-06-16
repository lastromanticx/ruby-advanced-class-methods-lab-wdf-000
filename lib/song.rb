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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    
    if found
      found
    else
      self.create_by_name(name) 
    end
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name.downcase}
  end

  def self.new_from_filename(filename)
    arr = filename.split(/-|\.mp3/)
    song_name = arr[1].strip
    artist_name = arr[0].strip

    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)  
    arr = filename.split(/-|\.mp3/)
    song_name = arr[1].strip
    artist_name = arr[0].strip

    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
