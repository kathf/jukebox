class Playlist < Jukebox

  attr_reader :song_array

  def intialize
    @song_array = []
  end

  def add_to_playlist(hash)
    puts @song_array
    puts hash
    @song_array << hash
    puts @song_array
  end

  def playlist_display
    # puts "\n==== PLAYLIST ===="
    # puts "#{printf("%-8s",'Order')} #{printf("%-20s",'Artist')} #{printf("%-16s",'Song Title')}"
    # @song_array.each_with_index do |hash,index|
    #   puts "#{printf("%-8s",index+1)} #{printf("%-20s",hash[:artist])} #{printf("%-16s",hash[:title])}"
    # end
    # puts "=========================="
    puts "playlist display"
  end

end

#
#
#   def self.all
#     song_array = []
#   end
#
#   def self.add_to_playlist(hash)
#     song_array = self.all
#     song_array << hash
#     return song_array
#   end
#
#   def self.playlist_display(song_array)
#     puts "\n==== PLAYLIST ===="
#     puts "#{printf("%-8s",'Order')} #{printf("%-20s",'Artist')} #{printf("%-16s",'Song Title')}"
#     song_array.each_with_index do |hash,index|
#       puts "#{printf("%-8s",index+1)} #{printf("%-20s",hash[:artist])} #{printf("%-16s",hash[:title])}"
#     end
#     puts "=========================="
#   end
#
# end
