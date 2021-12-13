require 'readline'
require_relative './lib/graphical_editor'
require_relative'./lib/errors/editor_error'

def editor 
  @editor ||= GraphicalEditor.new
end

while input = Readline.readline(">", true)
  begin
    p "Exiting..." and break if input == "X" 
  
    editor.process(input)
  rescue EditorError => e
    p e.message
  end
end  