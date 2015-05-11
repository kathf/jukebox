class Song < Database

  def self.all
    self.connection.exec("SELECT * FROM songs ORDER BY id;")
  end

  def self.all_array
    song_array = []
    all.each do |row|
      song_array << {
        id: row['id'],
        filename: row['filename'],
        title: row['title'],
        artist: row['artist'],
        played: row['played']
        }
    end
    song_array
  end

  def self.search(search_term)
    begin
      res = self.connection.exec("SELECT * FROM songs WHERE title ~* '#{search_term}';")
      song_hash = {
        id: res[0]['id'],
        filename: res[0]['filename'],
        title: res[0]['title'],
        artist: res[0]['artist'],
        played: res[0]['played']
      }
      return song_hash
    rescue
      return nil
    end

  end

end
