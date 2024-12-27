class StringCalculator

  def self.calculate(string = nil)
    return unless string.is_a?(String)

    return 0 if string.strip.empty?
  end
end