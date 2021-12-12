require 'readline'
require_relative './image'
require_relative './commands'

class GraphicalEditor
  def image 
    @image ||= Image.new
  end

  def commands 
    @commands ||= Commands.new(image)
  end

  def process(input)
    tmp = input.split(" ")
    case tmp[0]
    when "I"
      image.generate_image(tmp[1].to_i, tmp[2].to_i)
    when "L"
      commands.color_pixel(tmp[1].to_i, tmp[2].to_i, tmp[3], image)
    when "V"
      commands.color_vertical_line(tmp[1].to_i, tmp[2].to_i, tmp[3].to_i, tmp[4], image)
    when "H"
      commands.color_horizontal_line(tmp[1].to_i, tmp[2].to_i, tmp[3].to_i, tmp[4], image)
    when "F"
      commands.color_region(tmp[1].to_i, tmp[2].to_i, tmp[3], image)
    when "C"
      image.clear_image
    when "S"
      image.show_image
    else
      puts "Invalid command. Try again."  
    end
  end
end

