class RomanNumeral
    attr_reader :values, :roman_num_arr, :final_value

    def self.calc(roman_num)
        new(roman_num).calc
    end

    def calc
        sum = 0
        @roman_num_arr.each_with_index do |val, index|            
            if index < @roman_num_arr.length - 1
                value_1 = @values[val.to_sym]
                value_2 = @values[@roman_num_arr[index + 1].to_sym]

                if value_1 < value_2
                    sum += (value_2 - value_1 )
                else
                    sum += (value_1 + value_2)
                end
            end
        end
        @final_value = sum
    end

    private
    
    def initialize(roman_num_input)
        @final_value = 0
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