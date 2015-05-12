# To use this class first do:
#
# brew install mpg123

class Player
  def self.play(filename, title)
    base = File.dirname(__FILE__)
    file = File.join(base, 'music', filename)
    @current_pid = fork do
      puts "Now playing: #{title}."
      exec "mpg123 -q \"#{file}\""
    end
  end

  def self.stop
    Process.kill('KILL', @current_pid) if @current_pid
  end
end
