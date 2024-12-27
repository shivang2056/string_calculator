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
    replace_newline_with_comma

    @string.split(',').map(&:to_i).sum
  end

  def replace_newline_with_comma
    @string.gsub!("\n", ",")
  end
end