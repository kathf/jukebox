require 'rubygems'
require 'pg'
require './database.rb'
require './player'
require './song.rb'
require './jukebox.rb'
require './playlist.rb'

Database.connection(dbname: 'jukebox')

begin
  # jukebox = Jukebox.new
  playlist = Playlist.new
  jukebox = Jukebox.new
  jukebox.welcome
rescue => e
  puts e.backtrace[0]
  puts e.message
end
