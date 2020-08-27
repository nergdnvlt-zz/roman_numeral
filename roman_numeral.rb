class RomanNumeral
    def self.calc(roman_num)
        new(roman_num).calc
    end

    def calc
        @roman_num_arr.each_with_index do |value_1, index|       
            if index < @roman_num_arr.length - 1
                value_2 = @roman_num_arr[index + 1]
                value_3 = @roman_num_arr[index + 2]
                recursive_eval(value_1, value_2, value_3, index)
            else
               if @roman_num_arr[0] < @roman_num_arr[1]
                 return @roman_num_arr[1] - @roman_num_arr[0]
               else
                 return @roman_num_arr.sum
               end
            end
        end
        if @roman_num_arr.length == 1
            @roman_num_arr[0]
        else
            @roman_num_arr.sum
        end
    end

    private

    def recursive_eval(value_1, value_2, value_3, index)
        if value_3 && value_1 > value_2 && value_2 < value_3
            @roman_num_arr.delete_at(index)
            @roman_num_arr.delete_at(index + 1)
            @roman_num_arr[index] = value_1 + (value_3 - value_2)
        else
            if value_1 < value_2
                replace = value_2 - value_1        
                @roman_num_arr[index] = replace
                @roman_num_arr.delete_at(index + 1)
            else
                replace = value_2 + value_1        
                @roman_num_arr[index] = replace
                @roman_num_arr.delete_at(index + 1)
            end
        end
    end

    def triple_eval

    end
    
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