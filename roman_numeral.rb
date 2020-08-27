class RomanNumeral
    attr_reader :values, :roman_num_arr

    def self.calc(roman_num)
        new(roman_num).calc
    end

    def calc
        @roman_num_arr.each_with_index do |val, index|
            if @values[val.to_sym] < @values[@roman_num_arr[index + 1].to_sym]
                binding.pry
            end
        end
    end

    private
    
    def initialize(roman_num_input)
        @roman_num_arr = roman_num_input.chars
        @values = { 
            'I': 1,
            'V': 5,
            'X': 10,
            'L': 50,
            'C': 100,
            'D': 500,
            'M': 1000
        }
    end
end