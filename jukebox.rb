require 'rubygems'
require 'pg'
require './database.rb'
require './player'
require './song.rb'
require './playlist.rb'


class Jukebox

  def options
    puts "==========================="
    puts "What would you like to do?"
    puts "1. View all songs"
    puts "2. Search for song by title"
    puts "3. View and play playlists"
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
      playlist1 = Playlist.new
      playlist1.playlist_display
    else
      puts "============= Try again ============"
      options
    end
  end

  def select_song(input)
    begin
      selection = Song.all_array.select { |hash| hash[:id] == input.to_s}
      return_song(selection[0])
    rescue => e
      puts e.message
      # puts "Invalid song ID. Try again."
      print "Selected song ID:"
      select_song(gets.to_i)
    end
  end

  def search_by_title
    print "Enter search term: "
    song_hash = Song.search(gets.chomp)
    if song_hash != nil
      return_song(song_hash)
    else
      puts "No match found. Try again"
      search_by_title
    end
  end

  def play(filename)
    Player.play(filename)
    sleep 20
    Player.stop
  end

  def play_playlist
    #possibly better to put as method of playlist
  end

  def song_display
    puts "\n==== AVAILABLE SONGS ===="
    puts "#{printf("%-8s",'ID')} #{printf("%-20s",'Artist')} #{printf("%-16s",'Song Title')}"
    Song.all_array.each do |hash|
      puts "#{printf("%-8s",hash[:id])} #{printf("%-20s",hash[:artist])} #{printf("%-16s",hash[:title])}"
    end
    puts "=========================="
    print "Select song: "
  end

  def return_song(selection)
    puts "#{selection[:artist]} - #{selection[:title]}. Great song."
    puts "=========================="
    add_or_return(selection)
  end

  def add_or_return(hash)
    puts "Would you like to:"
    puts "1. Play this song now"
    puts "2. Add this song to playlist"
    puts "3. Return to the main menu"
    print "\nSelection:"
    input = gets.to_i
    if input == 1
      play(hash[:filename])
    elsif input == 2
      playlist2 = Playlist.new
      playlist2.add_to_playlist(hash)

      puts "error with adding song to playlist"
    elsif input == 3
      options
    else
      puts "Not a valid option. Returning to main menu."
      options
    end
  end

end


################################################################

Database.connection(dbname: 'jukebox')

begin

  jukebox = Jukebox.new
  #display user options
  jukebox.options



rescue PG::Error => e
  puts e.message
end
