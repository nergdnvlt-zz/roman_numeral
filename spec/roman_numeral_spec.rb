require './roman_numeral.rb'
require 'pry'

describe 'RomanNumeral' do
    describe 'basic validations and setup' do
        it 'creates the model fine' do
            roman_numeral = RomanNumeral.new('I')

            expect(roman_numeral).to be_a(RomanNumeral)
        end

        it 'contains a hash for value lookup' do
            roman_numeral = RomanNumeral.new('I')

            expect(roman_numeral.values[:I]).to eq(1)
            expect(roman_numeral.values[:V]).to eq(5)
            expect(roman_numeral.values[:X]).to eq(10)
            expect(roman_numeral.values[:L]).to eq(50)
            expect(roman_numeral.values[:C]).to eq(100)
            expect(roman_numeral.values[:D]).to eq(500)
            expect(roman_numeral.values[:M]).to eq(1000)
        end
    end
end