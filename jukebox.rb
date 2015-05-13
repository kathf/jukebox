class Jukebox

  def initialize
    @playlist = Playlist.new
  end

  def welcome
    puts "\n******************* MP3 MAGIC ********************"
    puts "\n"
    options
  end

  def options
    puts "--------------------------------------------------"
    puts "MAIN MENU:"
    puts "What would you like to do?"
    puts "1. View all songs"
    puts "2. Search for song by title"
    puts "3. View and play playlists"
    puts "--------------------------------------------------"
    print "Selection:"
    pathway(gets.to_i)
  end

  def pathway (selected_option)
    case
    when selected_option == 1
      song_display                                            #working
      select_song(gets.to_i)
    when selected_option == 2
      search_by_title
    when selected_option == 3
      view_play_playlist
    else
      puts "***Invalid selection. Try again."
      puts "--------------------------------------------------"
      options
    end
  end

  def select_song(input)
    begin
      song = Song.search_id(input)
      return_song(song)
    rescue => e
      puts "***Invalid song ID. Try again."
      print "Song selection: "
      puts e.message #delete once all working
      puts e.backtrace[0]
      select_song(gets.to_i)
    end
  end

  def search_by_title
    print "Enter search term: "
    song_hash = Song.search_title(gets.chomp)
    if song_hash != nil
      return_song(song_hash)
    else
      puts "***No match found. Try again"
      search_by_title
    end
  end

  def play_song(filename, title)
    Player.play(filename, title)
    sleep 7
    Player.stop # ALLOW IT TO PLAY IN THE BACKGROUND - remove stop and sleep and go to main menu - create option in main menu to stop
    print "Thanks for listening."
    main_menu_return
  end

  def song_display
    puts "--------------------------------------------------"
    puts "AVAILABLE SONGS:"
    puts "#{printf("%-8s",'ID')} #{printf("%-20s",'Artist')} #{printf("%-16s",'Song Title')}"
    Song.all.each do |song|
      puts song.to_s
    end
    puts "--------------------------------------------------"
    print "Please select a song by ID: "
  end

  def return_song(song)
    puts "#{song.artist} - #{song.title}... Great song."
    puts "--------------------------------------------------"
    add_or_return(song)
  end

  def add_or_return(song)
    song_options
    input = gets.to_i
    if input == 1
      play_song(song.filename, song.title)
    elsif input == 2
      @playlist.add_to_playlist(song)
      main_menu_return
    elsif input == 3
      main_menu_return
    else
      print "*** Not a valid option."
      main_menu_return
    end
  end

  def song_options
    puts "\nSONG OPTIONS:"
    puts "1. Play!"
    puts "2. Add to playlist"
    puts "3. Return to the MAIN MENU"
    puts "--------------------------------------------------"
    print "Selection:"
  end

  def playlist_options
    puts "PLAYLIST OPTIONS:"
    puts "1. Play!"
    puts "2. Return to the MAIN MENU"
    # puts "3. Delete playlist"
    #shuffle option..?
    puts "--------------------------------------------------"
    print "Selection:"
  end

  def view_play_playlist
    @playlist.to_s
    playlist_options
    input = gets.to_i
    if input == 1
      play_playlist
      #@playlist.play
    elsif input == 2
      options
    else
      print "***Not a valid option."
      main_menu_return
    end
  end

  # def playlist_display
  #   p @count
  #   if @playlist.song_array.size == 0
  #     puts "Your playlist is currently empty (What's wrong... Don't you like music?)"
  #     puts "--------------------------------------------------"
  #     main_menu_return
  #   else
  #     puts "--------------------------------------------------|"
  #     puts "PLAYLIST:                                         |"
  #     puts "#{printf("%-8s",'Order')} #{printf("%-20s",'Artist')} #{printf("%-16s",'Song Title')}    |"
  #     @song_array.each_with_index do |hash,index|
  #       puts "#{printf("%-8s",index+1)} #{printf("%-20s",hash[:artist])} #{printf("%-16s",hash[:title])}    |"
  #     end
  #   end
  #   puts "--------------------------------------------------|"
  # end
  #
  # def play_playlist
  #   @playlist.song_array.each do |song|
  #     play_file = song[:filename]
  #     title = song[:title]
  #     Player.play(play_file, title)
  #     sleep 7
  #   end
  #   Player.stop
  #   print "Thanks for listening."
  #   main_menu_return
  # end

  def main_menu_return
    puts " Returning to MAIN MENU...."
    options
  end

end
