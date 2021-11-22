class InteractiveGraphicalEditor
  attr_reader(:image, :m, :n)

  def process(args)
    command, arguments = parse_command(args)
    execute_command(command, arguments)
  end

  private
  
  def parse_command(input)
    [input[0],input[1..-1].strip]
  end
  
  def execute_command(command, args = nil)
    if command == "I"
      tmp = args.split(" ")
      generate_image(tmp[0].to_i, tmp[1].to_i)
    elsif command == "S"
      return if image == nil  
      puts image.map { |x| x.join }
    elsif command == "C"
      return if image == nil  
      generate_image(image[0].length, image.length)
    elsif command == "L"
      if image == nil
        puts "First run I"
        return
      end
      tmp = args.split(" ")
      color_pixel(tmp[0].to_i, tmp[1].to_i, tmp[2])
    elsif command == "V"
      if image == nil
        puts "First run I"
        return
      end
      tmp = args.split(" ")
      color_vertical_line(tmp[0].to_i, tmp[1].to_i, tmp[2].to_i, tmp[3])
    elsif command == "H"
      if image == nil
        puts "First run I"
        return
      end
      tmp = args.split(" ")
      color_horizontal_line(tmp[0].to_i, tmp[1].to_i, tmp[2].to_i, tmp[3])
    elsif command == "F"
      if image == nil
        puts "First run I"
        return 
      end  
      tmp = args.split(" ")
      color_region(tmp[0].to_i, tmp[1].to_i, tmp[2].to_s)
    else
      puts "Invalid input"
    end
  end

  def color_pixel(x, y, color)
    if x < m and y < n
     image[y-1][x-1] = color
    else
      puts "Pixel is not part of image."
    end 
  end  

  def color_vertical_line(x, y1, y2, color)
    image.each_with_index do |el, i|
      next if i<y1 || i>y2

      el[x] = color
    end      
  end

  def color_horizontal_line(x1, x2, y, color)
    image[y][x1..x2] = Array.new((x2-x1+1), color)
  end

  def color_region(x, y, color)
    org_color = String.new(image[y][x])
    image[y-1][x-1] = color
    image.each do |row|
      row.each do |column|
    if x-1 < m and y-1 < n
      if x < m
        if image[y-1][x].to_s == org_color
          image[y-1][x] = color
        end
      end
      if x-2 >= 0
        if image[y-1][x-2].to_s == org_color
          image[y-1][x-2] = color
        end
      end
      if y-2 >= 0
        if image[y-2][x-1].to_s == org_color
          image[y-2][x-1] = color
        end
      end
      if y < n
        if image[y][x-1].to_s == org_color
          image[y][x-1] = color
        end
      end
      column = color
    else
      puts "Region is not part of image."
    end
      end
    end
  end

  def generate_image(m, n)
    if m >= 1 and n <= 250
      @m = m
      @n = n
     @image = Array.new(n) {Array.new(m,"O")}
    else
      puts "M >= 1, N <= 250, M and N must be in shown range."
    end
  end

end