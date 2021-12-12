require 'readline'
require_relative './graphical_editor'

e = GraphicalEditor.new

def editor 
  @editor ||= GraphicalEditor.new
end

while input = Readline.readline(">", true)
  begin
    p "Exiting..." and break if input == "X" 
  
    editor.process(input)
  rescue ArgumentError => e
    p e.message
  end
end  