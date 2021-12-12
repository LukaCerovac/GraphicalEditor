require_relative './Errors/editor_error'

class Image
	attr_accessor(:image, :m, :n)

	def generate_image(m, n)
		valid_dimensions(m, n)
    @m = m
    @n = n
    @image = Array.new(n) {Array.new(m, "O")}
	end

  def show_image
		return if image == nil
		puts image.map { |x| x.join }
	end

	def clear_image
		return if image == nil
	  generate_image(image[0].length, image.length)
	end

  private

  def valid_dimensions(m, n)
    if m<1 || n<1 || m>250 || n>250
      raise EditorError, "Image should be greater than 0 x 0 and less than 251 x 251."
    end 
  end

end