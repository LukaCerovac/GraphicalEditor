require 'image'

def image 
@image ||= Image.new
end

RSpec.describe Image do

	context 'Image size' do
		it 'can be 5 pixels by 5 pixels' do
			image.generate_image(5, 5)
			expect(image.m).to eq 5
			expect(image.n).to eq 5
		end

		it 'cannot be 0 pixels by 5 pixels' do
			expect { image.generate_image(0, 5) }.to \
				raise_error(
					ArgumentError,
					"Image should be greater than 0 x 0 and less than 251 x 251."
				)
		end
	end

	context 'Coloring pixel on image' do
		before do
			image.generate_image(5,5)
		end

		it 'colors [2,3] pixel with color J' do
			image.color_pixel(2, 3, "J")
			expect(image.image).to eq [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'J', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
		end

		it 'cannot color pixel outside image' do
			expect { image.color_pixel(7, 8, "J") }.to raise_error(
				ArgumentError, "X wrong input. Pixel out of image."
			)
		end

		it 'cannot color pixel with downsize letter' do
			expect {image.color_pixel(2, 3, "j") }.to raise_error(
				ArgumentError, "Color must be a capital letter A-Z"
			)
		end
	end

	context 'Coloring horizontal line on image' do
		before do
			image.generate_image(5,5)
		end

		it 'colors a horizontal line from left to right' do
			image.color_horizontal_line(2, 4, 3, "F")
			expect(image.image).to eq [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'F', 'F', 'F', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
		end

		it 'cannot color a horizontal line from right to left' do
			expect { image.color_horizontal_line(4, 2, 3, "F") }.to raise_error(
				ArgumentError, "Input is in wrong order. First write X1 than X2."
			)
		end
	end

	context 'Coloring vertical line on image' do
		before do
			image.generate_image(5, 5)
		end

		it 'colors a vertical line from top to bottom' do
			image.color_vertical_line(4, 1, 2, "F")
			expect(image.image).to eq [['O', 'O', 'O', 'F', 'O'], ['O', 'O', 'O', 'F', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
		end

		it 'cannot color a vertical line from bottom to top' do
			expect { image.color_vertical_line(4, 2, 1, "F") }.to raise_error(
				ArgumentError, "Input is in wrong order. First write Y1 than Y2."
			)
		end
	end

	context 'Coloring a region' do
		before do
			image.generate_image(5, 5)
		end

		it 'colors a region around specific pixel' do
			image.color_region(3, 3, "J")
			expect(image.image).to eq [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'J', 'O', 'O'], ['O', 'J', 'J', 'J', 'O'], ['O', 'O', 'J', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
		end
	end

	context 'Clearing image' do
		before do
			image.generate_image(5, 5)
			image.color_pixel(1, 1, "J")
		end

		it 'colors all pixels O' do
			image.clear_image
			expect(image.image). to eq [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
		end	
	end

end