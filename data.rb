
#array of songs [name, gst_flag]
songs_array = [
  [1, 'lost_in_space.mp3', "Lost in Space", "Bruce Broughton", 0],
  [2, 'bit_adventure.mp3', '8 Bit Adventure', "Adhesive Wombat", 0],
  [3, 'Wheres_your_head_at.mp3', "Wheres your Head at", "Basement Jaxx", 0]
  ]


#number of songs in array
num = songs_array.size

#generate psql insert query to populate table
songs_array.each_with_index do |elem, index|
  puts "INSERT INTO songs (id, filename, title, artist, played) VALUES (#{index+1}, '#{elem[1]}', '#{elem[2]}', '#{elem[3]}', #{elem[4]});"
end
