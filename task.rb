require 'readline'
require_relative './graphicaleditor'
gem 'remote_i18n'

e = InteractiveGraphicalEditor.new

def editor 
  @editor ||= InteractiveGraphicalEditor.new
end

while input = Readline.readline(">", true)
  p "Exiting..." and break if input == "X" 
  
  editor.process(input)
end  