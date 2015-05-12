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
  jukebox = Playlist.new
  jukebox.welcome
  jukebox.options
rescue
  option
end
