class StringCalculator

  def self.calculate(string = nil)
    case string
    when String
      return 0 if string.strip!&.empty?

      string.split(',').map(&:to_i).sum
    else
      return nil
    end
  end
end