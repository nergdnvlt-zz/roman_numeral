class RomanNumeral
    attr_reader :values, :roman_num_arr, :final_value

    def self.calc(roman_num)
        new(roman_num).calc
    end

    def calc
        @roman_num_arr.each_with_index do |val, index|            
            if index < @roman_num_arr.length - 1
                value_1 = @values[val.to_sym]
                value_2 = @values[@roman_num_arr[index + 1].to_sym]
                
                if value_1 < value_2
                    replace = value_2 - value_1        
                    @roman_num_arr[index] = replace
                    @roman_num_arr.delete_at(index+1)
                else
                    replace = value_2 + value_1        
                    @roman_num_arr[index] = replace
                    @roman_num_arr.delete_at(index+1)
                end
            end
        end
    end

    private
    
    def initialize(roman_num_input)
        @values = { 
            'I': 1,
            'V': 5,
            'X': 10,
            'L': 50,
            'C': 100,
            'D': 500,
            'M': 1000
        }
        @roman_num_arr = convert(roman_num_input.chars)
    end

    def convert(initial_roman_numerals)
        initial_roman_numerals.map do |numeral|
            @values[numeral.to_sym]
        end
    end
end