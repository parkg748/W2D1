require_relative 'board'
require 'colorize'
require 'colorized_string'
require_relative 'cursor'

class Display 
  def initialize
    @cursor = Cursor.new([0,0], Board.new)
    
    
  end 
  
  def handle_key(key)
    case key
    when key == :return || key == :space 
      return @cursor.cursor_pos
    when key == :left || key == :right || key == :up || key == :down 
      # Ask about this 
      return @cursor.call_update_pos(key)
    when key == :ctrl_c 
      Process.exit(0)
    end
  end 
end 
