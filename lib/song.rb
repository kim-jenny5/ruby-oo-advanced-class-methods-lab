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
    self.all.find do |song_name|
      song_name.name == name
    end
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |a| a.name }
  end

  def self.new_from_filename(filename)
    arr = filename.split(/ - |[.]/)
    arr.pop
    song = self.new
    song.name = arr[1]
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end
end