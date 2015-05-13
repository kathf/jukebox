class Song < Database

  attr_reader :id, :filename, :title, :artist, :played

  def initialize(hash)
    @id = hash['id']
    @filename = hash['filename']
    @title = hash['title']
    @artist = hash['artist']
    @played = hash['played']
  end

  def self.all
    res = self.connection.exec("SELECT * FROM songs ORDER BY id;")
    all_songs = []
    res.each do |hash|
      all_songs << new(hash)
    end
    all_songs
  end

  def self.search_id(id)
    res = self.connection.exec("SELECT * FROM songs WHERE id = #{id};")
    self.new(res[0])
  end

  def self.search_title(keyword)
    begin
      res = self.connection.exec("SELECT * FROM songs WHERE title ~* '#{keyword}';")
      self.new(res[0])
    rescue
      return "No matching songs found."
    end
  end

  def self.search_artist(keyword)
    begin
      res = self.connection.exec("SELECT * FROM songs WHERE artist ~* '#{keyword}';")
      self.new(res[0])
    rescue
      return nil
    end
  end

  def to_s
    "#{printf("%-8s",@id)} #{printf("%-20s",@artist)} #{printf("%-16s",@title)}"
  end

end
