class Playlist < Jukebox

#strip back playlist class to only song_array - everything else goes in jukebox class

  attr_reader :song_array

  def initialize
    @song_array = []
  end

  def add_to_playlist(hash)
    @song_array << hash
    puts "*** " + hash[:title] + " added. Returning to MAIN MENU."
    puts "========================================"
  end

  def playlist_display
    if @song_array.size == 0
      puts "Your playlist is currently empty (What's wrong... Don't you like music?)"
      puts "========================================"
      options
    else
      puts "==================================================|"
      puts "PLAYLIST:                                         |"
      puts "#{printf("%-8s",'Order')} #{printf("%-20s",'Artist')} #{printf("%-16s",'Song Title')}    |"
      @song_array.each_with_index do |hash,index|
        puts "#{printf("%-8s",index+1)} #{printf("%-20s",hash[:artist])} #{printf("%-16s",hash[:title])}    |"
      end
    end
    puts "==================================================|"
  end

  def play_playlist
    @song_array.each do |song|
      play_file = song[:filename]
      title = song[:title]
      Player.play(play_file, title)
      sleep 7
    end
    Player.stop
    puts "Thanks for listening. Returning to MAIN MENU."
    options
  end

end
