require './roman_numeral.rb'
require 'pry'

describe 'RomanNumeral' do
    describe 'basic validations and setup' do
        it 'creates the model fine' do
            roman_numeral = RomanNumeral.new('I')

            expect(roman_numeral).to be_a(RomanNumeral)
        end

        # REMOVED THE ATTR_READERS AS UNNECCESSARY
        # it 'contains a hash for value lookup' do
        #     roman_numeral = RomanNumeral.new('I')

        #     expect(roman_numeral.values[:I]).to eq(1)
        #     expect(roman_numeral.values[:V]).to eq(5)
        #     expect(roman_numeral.values[:X]).to eq(10)
        #     expect(roman_numeral.values[:L]).to eq(50)
        #     expect(roman_numeral.values[:C]).to eq(100)
        #     expect(roman_numeral.values[:D]).to eq(500)
        #     expect(roman_numeral.values[:M]).to eq(1000)
        # end

        # it 'splits the roman numeral correctly' do
        #     roman_numeral = RomanNumeral.new('II')

        #     expect(roman_numeral.roman_num_arr).to eq([1, 1])
        # end

        # it 'splits a different roman numeral correctly' do
        #     roman_numeral = RomanNumeral.new('MVCII')

        #     expect(roman_numeral.roman_num_arr).to eq([1000, 5, 100, 1, 1])
        # end
    end

    describe 'beginning calculations with two digits' do
        it 'when we start with something basic' do
            expect(RomanNumeral.calc('IV')).to eq(4)
        end

        it 'when we alternate a simple subtraction' do
            expect(RomanNumeral.calc('VX')).to eq(5)
        end

        it 'when we start with something basic that adds up' do
            expect(RomanNumeral.calc('VI')).to eq(6)
        end

        it 'adds alternate set of two digits that add up' do
            expect(RomanNumeral.calc('MD')).to eq(1500)
        end

        it 'adds additional alternate set of two digits that add up again' do
            expect(RomanNumeral.calc('DL')).to eq(550)
        end

        it 'adds two of the same consecutive numbers fine' do
            expect(RomanNumeral.calc('DD')).to eq(1000)
        end

        it 'adds alternate two of the same consecutive numbers fine' do
            expect(RomanNumeral.calc('CC')).to eq(200)
        end
    end

    describe 'start testing 3 digit calculations' do
        it 'when we start with something basic subtraction' do
            expect(RomanNumeral.calc('IIV')).to eq(3)
        end

        it 'when we start with another basic subtraction' do
            expect(RomanNumeral.calc('IIC')).to eq(98)
        end

        it 'when we start with another basic subtraction' do
            expect(RomanNumeral.calc('VVC')).to eq(90)
        end

        it 'when we start with a basic addition' do
            expect(RomanNumeral.calc('CVV')).to eq(110)
        end

        it 'when we start with another basic addition' do
            expect(RomanNumeral.calc('MDD')).to eq(2000)
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

        it 'Example 5: test for 1994' do
            expect(RomanNumeral.calc('MCMXCIV')).to eq(1994)
        end
    end
end