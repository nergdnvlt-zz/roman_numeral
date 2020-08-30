require './roman_numeral.rb'
require 'pry'

describe 'RomanNumeral' do
    describe 'basic validations and setup' do
        # it 'creates the model fine' do
        #     roman_numeral = RomanNumeral.new('I')

        #     expect(roman_numeral).to be_a(RomanNumeral)
        # end
    end

    describe 'beginning calculations with a basic first array' do
        it 'when we start with something basic' do
            expect(RomanNumeral.calc('MCM')).to eq(1900)
        end

        it 'when we start with something basic' do
            expect(RomanNumeral.calc('MCMII')).to eq(1902)
        end

        it 'when we start with something basic' do
            expect(RomanNumeral.calc('MCMLXL')).to eq(1990)
        end


        it 'when we start with something basic' do
            expect(RomanNumeral.calc('MCMLXLII')).to eq(1992)
        end
    end

    describe 'Example 1: test for 3' do
        it 'when we start mixing it up' do
            expect(RomanNumeral.calc('III')).to eq(3)
        end

        it 'Example 2: test for 4' do
            expect(RomanNumeral.calc('IV')).to eq(4)
        end

        it 'Example 3: test for 9' do
            expect(RomanNumeral.calc('IX')).to eq(9)
        end

        it 'Example 4: test for 58' do
            expect(RomanNumeral.calc('LVIII')).to eq(58)
        end

        # it 'Example 5: test for 1994' do
        #     expect(RomanNumeral.calc('MCMXCIV')).to eq(1994)
        # end
    end
end