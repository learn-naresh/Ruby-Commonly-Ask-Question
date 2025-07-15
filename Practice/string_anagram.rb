# Write a Ruby method to check if two strings are anagrams of each other.
# Intitution
# Anagrams means that a two different strings contain the same charachter
# if the string are not equal that is not anagram edge case/base case

def str_anagram?(str1, str2)
  return false if str1.length != str2.length
  return true if str1.downcase.chars.sort == str2.downcase.chars.sort
end

input1 = "naresh"
input2 = "areshn"

puts str_anagram?(input1, input2)