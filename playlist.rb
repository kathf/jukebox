class Playlist

  attr_accessor :list

  def intialize
    @list = []
  end

  def add_to_playlist(hash)
    puts @list
    @list << hash
    puts @list
  end

  def playlist_display
    puts "\n==== PLAYLIST ===="
    puts "#{printf("%-8s",'Order')} #{printf("%-20s",'Artist')} #{printf("%-16s",'Song Title')}"
    @list.each_with_index do |hash,index|
      puts "#{printf("%-8s",index)} #{printf("%-20s",hash[:artist])} #{printf("%-16s",hash[:title])}"
    end
    puts "=========================="
  end

end
