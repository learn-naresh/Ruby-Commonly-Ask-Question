def palidrom(str)
  len = str.length
  n = len.even? ? len / 2 : (len - 1) / 2
  flag = true

  (1..n).each do |index|
    flag = false if str[len - index] != str[index - 1]
  end

  flag
end
a = gets.chomp
print palidrom(a)



require 'pry'
def compress_string(str)
  result = ""
  count = 1

  (1..str.length).each do |i|
    if str[i] == str[i - 1]
      count += 1
    else
      result += str[i - 1]
      result += count.to_s if count > 1
      count = 1
    end
  end

  result
end

# Test
str = "aaaabbabcddd"
puts compress_string(str)  # => "a4b2abcd3"