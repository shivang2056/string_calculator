class StringCalculator
  class << self
    def add(string)
      case string
      when String
        string.strip!

        return 0 if string.empty?

        process_string(string)
      else
        return nil
      end
    end

    private

    def process_string(string)
      if string.start_with?("//")
        delimiter = extract_delimiter(string)
        numbers_string = extract_numbers_with_delimiter(string)
      else
        delimiter = ','
        numbers_string = string
      end

      numbers_string = replace_newline_with_delimiter(numbers_string, delimiter)

      numbers_string.split(delimiter).map(&:to_i).sum
    end

    def extract_delimiter(string)
      string.match(/\/\/(.)\n/)[1]
    end

    def extract_numbers_with_delimiter(string)
      string.split(/\/\/.\n/)[1]
    end

    def replace_newline_with_delimiter(numbers_string, delimiter)
      numbers_string.gsub("\n", delimiter)
    end
  end
end