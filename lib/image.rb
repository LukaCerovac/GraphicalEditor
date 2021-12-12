class Image
	attr_accessor(:image, :m, :n)
	
	def generate_image(m, n)
		valid_dimensions(m,n)
    @m = m
    @n = n
    @image = Array.new(n) {Array.new(m, "O")}
	end

	def color_pixel(x, y, color)
		valid_input([x], [y], color)
		image[y-1][x-1] = color
	end

	def show_image
		return if image == nil
		puts image.map { |x| x.join }
	end

  def clear_image
		return if image == nil
		generate_image(image[0].length, image.length)
	end

	def color_vertical_line(x, y1, y2, color)
    valid_input([x], [y1, y2], color)
    image.each_with_index do |el, i|
      next if i<y1-1 || i>y2-1
      el[x-1] = color
    end      
  end

  def color_horizontal_line(x1, x2, y, color)
    valid_input([x1, x2], [y], color)
    image[y-1][x1-1..x2-1] = Array.new((x2-x1+1), color)
  end

  def color_region(x, y, color)
    valid_input([x], [y], color)
    org_color = String.new(image[y-1][x-1])
    image[y-1][x-1] = color
    image[y][x-1] = color if image[y][x-1] = org_color
    image[y-1][x] = color if image[y-1][x] = org_color
    image[y-1][x-2] = color if image[y-1][x-2] = org_color and x>=2
    image[y-2][x-1] = color if image[y-2][x-1] = org_color and y>=2 
  end

  def raise_error(msg)
    raise ArgumentError.new(msg)
  end

  def valid_dimensions(m, n)
    raise ArgumentError, ERROR_MSG[:invalid_dimensions] if m<1 || n<1 || m>250 || n>250
  end

  def valid_input(x_input, y_input, color_input)
    raise_error(ERROR_MSG[:no_image]) if image == nil
    raise ArgumentError, ERROR_MSG[:invalid_x_input] if x_input.any? {|x| x<1 || x>m}
    raise ArgumentError, ERROR_MSG[:invalid_y_input] if y_input.any? {|y| y<1 || y>n}
    raise ArgumentError, ERROR_MSG[:invalid_color_input] unless color_input =~ /[A-Z]/ && !color_input.nil?
    raise ArgumentError, ERROR_MSG[:wrong_order_x_input] if x_input.first > x_input.last
    raise ArgumentError, ERROR_MSG[:wrong_order_y_input] if y_input.first > y_input.last
  end

  ERROR_MSG = {
    :no_image => "First run I to create image!",
    :invalid_command => "Invalid input/command. Please try again.",
    :invalid_dimensions => "Image should be greater than 0 x 0 and less than 251 x 251.",
    :invalid_x_input => "X wrong input. Pixel out of image.",  
    :invalid_y_input => "Y wrong input. Pixel out of image.",  
    :invalid_color_input => "Color must be a capital letter A-Z",
    :wrong_order_x_input => "Input is in wrong order. First write X1 than X2.",
    :wrong_order_y_input => "Input is in wrong order. First write Y1 than Y2."
  }

end