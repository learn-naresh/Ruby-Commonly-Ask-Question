# 2.Write a Ruby method to reverse a string without using the built-in reverse method.
# Intitution
# Iterate from back without using split
# while i >= 0 this means i values greater than 0 and after that remember to decrese by one
# Output should be reverse string

def str_reverse(str)
  result = ""
  i = str.length - 1
  while i >= 0
    result << str[i]
    i = i - 1
  end
  result 
end
str = "nan"
puts "palindrome" if str_reverse(str) == str