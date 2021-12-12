require 'graphical_editor'

RSpec.describe GraphicalEditor do

	describe "process" do
		subject(:editor) do
			described_class.new
		end

		context "when input is I" do
			let(:expected_array) do
				[
					['O', 'O', 'O'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
				]
			end

			it "generates image" do
				result = editor.process("I 3 4")
				expect(result).to match_array(expected_array)
			end
		end

		context "when input is L" do
			let(:expected_array) do
				[
					['O', 'J', 'O'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
				]
			end

			it "colors pixel in image" do
				editor.process("I 3 4")
				editor.process("L 2 1 J")
				expect(editor.image.image).to eq(expected_array)
			end
		end

		context "when input is V" do
			let(:expected_array) do
				[
					['O', 'J', 'O'],
					['O', 'J', 'O'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
				]
			end

			it "colors a vertical line" do
				editor.process("I 3 4")
				editor.process("V 2 1 2 J")
				expect(editor.image.image).to eq(expected_array)
			end
		end

		context "when input is H" do
			let(:expected_array) do
				[
					['O', 'J', 'J'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
				]
			end

			it "colors a horizontal line" do
				editor.process("I 3 4")
				editor.process("H 2 3 1 J")
				expect(editor.image.image).to eq(expected_array)
			end
		end

		context "when input is F" do
			let(:expected_array) do
				[
					['J', 'J', 'J'],
					['O', 'J', 'O'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
				]
			end

			it "colors a region" do
				editor.process("I 3 4")
				editor.process("F 2 1 J")
				expect(editor.image.image).to eq(expected_array)
			end
		end

		context "when input is C" do
			let(:expected_array) do
				[
					['O', 'O', 'O'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
					['O', 'O', 'O'],
				]
			end

			it "it colors all pixels 'O'" do
				editor.process("I 3 4")
				editor.process("C")
				expect(editor.image.image).to eq(expected_array)
			end
		end

		context "when input is S" do
			it "prints current image" do
				editor.process("I 3 4")
				result = capture_stdout { editor.process("S") }
				expect(result).to eq "OOO\nOOO\nOOO\nOOO\n"
			end
		end
	end

	def capture_stdout(&block)
		original_stdout = $stdout
		$stdout = fake = StringIO.new
		begin
			yield
		ensure
			$stdout = original_stdout
		end
		fake.string
	end

end