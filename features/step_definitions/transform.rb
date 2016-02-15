class String
  def to_bool
    self == 'true'
  end
end

Transform(/^(-?\d+)$/) do |number|
  number.to_i
end

Transform(/^(-?\S[a-z]*)$/) do |word|
  word.to_bool
end