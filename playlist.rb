class Playlist

#strip back playlist class to only song_array - everything else goes in jukebox class

  attr_reader :song_array

  def initialize
    @song_array = []
    @count = @song_array.size
  end

  def add_to_playlist(song)
    @song_array << song
    print song.title + " added to playlist."
  end

  def to_s
    puts "--------------------------------------------------|"
    puts "PLAYLIST:                                         |"
    puts "#{printf("%-8s",'#')} #{printf("%-20s",'Artist')} #{printf("%-16s",'Song Title')}    |"
    @song_array.each_with_index do |hash,index|
        puts hash.to_s
      # puts "#{printf("%-8s",index+1)} #{printf("%-20s",hash[:artist])} #{printf("%-16s",hash[:title])}    |"
    end
  end

end
