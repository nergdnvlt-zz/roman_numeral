class RomanNumeral
    def self.calc(roman_num)
        new(roman_num).calc.sum
    end

    def calc
        @converted.each_with_index do |digit, index|
            prior = @new_result[-1] if !@new_result.empty?
            next_digit = @converted[index + 1] if @converted[index + 1]
            if start?(index)
                @new_result << digit
            elsif subtract?(digit, prior)
                @new_result.pop
                @new_result << (digit - prior)
            elsif eval_deeper?(digit, prior)
                dive_deeper(digit, prior, next_digit)
            end
        end
        @new_result
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
        @converted = convert(roman_num_input.chars)
        @new_result = []
    end

    def convert(initial_roman_numerals)
        initial_roman_numerals.map do |numeral|
            @values[numeral.to_sym]
        end
    end

    def start?(index)
        index == 0
    end

    def subtract?(digit, prior)
        digit > prior
    end

    def eval_deeper?(digit, prior)
        digit <= prior
    end

    def dive_deeper(digit, prior, next_digit)
        if same_digit?(next_digit, digit, prior)
            @new_result.pop
            @new_result << digit + prior
        elsif add_to_stack?(next_digit, digit)
            @new_result << digit
        else
            @new_result.pop
            @new_result << digit + prior
        end
    end

    def same_digit?(next_digit, digit, prior)
        next_digit && digit < next_digit && digit == prior
    end

    def add_to_stack?(next_digit, digit)
        next_digit && digit < next_digit
    end
end
