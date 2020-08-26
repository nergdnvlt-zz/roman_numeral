class RomanNumeral
    attr_reader :values, :roman_num_arr
    
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