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
					EditorError,
					"Image should be greater than 0 x 0 and less than 251 x 251."
				)
		end
	end

	context 'Clearing image' do
		before do
			image.generate_image(5, 5)
		end

		it 'colors all pixels O' do
			image.clear_image
			expect(image.image). to eq [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
		end	
	end

end