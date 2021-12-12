require 'readline'
require_relative './image'

class GraphicalEditor
  def image 
    @image ||= Image.new
  end

  def process(input)
    tmp = input.split(" ")
    case tmp[0]
    when "I"
      image.generate_image tmp[1].to_i, tmp[2].to_i
    when "L"
      image.color_pixel tmp[1].to_i, tmp[2].to_i, tmp[3]
    when "V"
      image.color_vertical_line tmp[1].to_i, tmp[2].to_i, tmp[3].to_i, tmp[4]
    when "H"
      image.color_horizontal_line tmp[1].to_i, tmp[2].to_i, tmp[3].to_i, tmp[4]
    when "F"
      image.color_region tmp[1].to_i, tmp[2].to_i, tmp[3]
    when "C"
      image.clear_image
    when "S"
      image.show_image
    else
      puts "Invalid command. Try again."  
    end
  end
end

