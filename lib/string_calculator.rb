class StringCalculator

  def initialize(string = nil)
    @string = string
  end

  def calculate
    case @string
    when String
      remove_whitespaces

      return 0 if empty_string?

      process_string
    else
      return nil
    end
  end

  private

  def remove_whitespaces
    @string.strip!
  end

  def empty_string?
    @string.empty?
  end

  def process_string
    if @string.start_with?("//")
      delimiter = extract_delimiter
      numbers_string = extract_numbers_with_delimiter
    else
      delimiter = ','
      numbers_string = @string
    end

    numbers_string = replace_newline_with_delimiter(numbers_string, delimiter)

    numbers_string.split(delimiter).map(&:to_i).sum
  end

  def extract_delimiter
    @string.match(/\/\/(.)\n/)[1]
  end

  def extract_numbers_with_delimiter
    @string.split(/\/\/.\n/)[1]
  end

  def replace_newline_with_delimiter(numbers_string, delimiter)
    numbers_string.gsub("\n", delimiter)
  end
end