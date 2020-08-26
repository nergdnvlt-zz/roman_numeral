require './roman_numeral.rb'

describe 'RomanNumeral' do
    describe 'basic validations and setup' do
        it 'creates the model fine' do
            roman_numeral = RomanNumeral.new

            expect(roman_numeral).to be_a(RomanNumeral)
        end
    end
end