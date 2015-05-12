class Jukebox

  def welcome
    puts "\n************** MP3 MAGIC ***************"
    puts "\n"
  end

  def options
    puts "What would you like to do?"
    puts "1. View all songs"
    puts "2. Search for song by title"
    puts "3. View and play playlists"
    puts "========================================"
    print "Selection:"
    pathway(gets.to_i)
  end

  def pathway (selected_option)
    case
    when selected_option == 1
      song_display
      select_song(gets.to_i)
    when selected_option == 2
      search_by_title
    when selected_option == 3
      view_play_playlist
    else
      puts "***Invalid selection. Try again."
      puts "========================================"
      options
    end
  end

#make the database do this
  def select_song(input)
    begin
      selection = Song.all_array.select { |hash| hash[:id] == input.to_s}
      return_song(selection[0])
    rescue => e
      puts "***Invalid song ID. Try again."
      print "Song selection: "
      select_song(gets.to_i)
    end
  end

  def search_by_title
    print "Enter search term: "
    song_hash = Song.search(gets.chomp)
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
    Player.stop #remove stop and sleep and go to main menu - create option in main menu to stop
    puts "Thanks for listening. Returning to MAIN MENU."
    puts "========================================"
    options
  end

  def song_display
    puts "========================================"
    puts "AVAILABLE SONGS:"
    puts "#{printf("%-8s",'ID')} #{printf("%-20s",'Artist')} #{printf("%-16s",'Song Title')}"
    Song.all_array.each do |hash|
      puts "#{printf("%-8s",hash[:id])} #{printf("%-20s",hash[:artist])} #{printf("%-16s",hash[:title])}"
    end
    puts "========================================"
    print "Song selection: "
  end

  def return_song(selection)
    puts "========================================"
    puts "#{selection[:artist]} - #{selection[:title]} \n... Great song."
    puts "========================================"
    add_or_return(selection)
  end

  def add_or_return(hash)
    song_options
    input = gets.to_i
    if input == 1
      play_song(hash[:filename], hash[:title])
    elsif input == 2
      add_to_playlist(hash)
      options
    elsif input == 3
      options
    else
      puts "***Not a valid option. Returning to MAIN MENU."
      options
    end
  end

  def song_options
    puts "SONG OPTIONS:"
    puts "1. Play!"
    puts "2. Add to playlist"
    puts "3. Return to the MAIN MENU"
    puts "========================================"
    print "Selection:"
  end

  def playlist_options
    puts "PLAYLIST OPTIONS:"
    puts "1. Play!"
    puts "2. Return to the MAIN MENU"
    # puts "3. Delete playlist"
    #shuffle option..?
    puts "========================================"
    print "Selection:"
  end

  def view_play_playlist
    playlist_display
    playlist_options
    input = gets.to_i
    if input == 1
      play_playlist
    elsif input == 2
      options
    else
      puts "***Not a valid option. Returning to MAIN MENU."
      options
    end
  end

end
