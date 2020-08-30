class RomanNumeral
    def self.calc(roman_num)
        new(roman_num).calc
    end

    def calc
        binding.pry        
        if @romans[0].class == Integer && @romans.length == 2
            eval_two_digit
        else
            @romans.map do |sub_array|
                convert_negatives(sub_array)
            end.sum
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
        @romans = convert(roman_num_input.chars)
        binding.pry
        # combine_arrays(seperate_arrays)
    end

    def eval_two_digit
        return convert_negatives(@romans.reverse) if @romans[0] < @romans[1]
    end

    def combine_arrays(duplicate_array)
        @romans.delete_if { |x| duplicate_array.flatten.include?(x) }
        duplicate_array.each do |sub|
            @romans << sub
        end
    end


    def seperate_arrays
        pull_first(find_dupes).zip(pull_last(find_dupes)).map do |selection|
            @romans.slice(selection[0]...(selection[1] + 1))
        end
    end

    def pull_first(duplicate_array)
        duplicate_array.map do |dupe|
            @romans.index(dupe)
        end
    end

    def pull_last(duplicate_array)
        duplicate_array.map do |dupe|
            @romans.rindex(dupe)
        end
    end

    def find_dupes
        binding.pry
        @romans.group_by{ |e| e }.select { |k, v| v.size > 1 }.map(&:first)
    end

    def convert_negatives(sub_group)
        return sub_group if sub_group.class == Integer

        sub_group.map do |num|
            if num == sub_group[0]
                num
            else
                num * -1
            end
        end.sum
    end

    def convert(initial_roman_numerals)
        initial_roman_numerals.map do |numeral|
            @values[numeral.to_sym]
        end
    end
end