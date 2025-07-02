1.Write a Ruby method to check if a given number is prime.
2.Write a Ruby method to reverse a string without using the built-in reverse method.
3.Write a Ruby method to check if two strings are anagrams of each other.
4.Write a Ruby method to find the factorial of a given number.
5.Write a Ruby method to find the Fibonacci sequence up to a specified number of terms.
6.Write a Ruby method to check if a string is a palindrome.
7.Write a Ruby method to remove duplicate elements from an array
8.Write a Ruby method to remove duplicate elements from an array.
9.Write a Ruby method to check if a given array is sorted in ascending order.
10.Write a Ruby method to find the largest and smallest numbers in an array.
11.Write a Ruby method to count the occurrence of each element in an array and return a hash with the results.
12.Write a Ruby method to find the sum of all even numbers in an array.
13.Write a Ruby method to find the common elements between two arrays.
14.Write a Ruby method to sort an array of strings based on their lengths, from shortest to longest.
15.Write a Ruby method to find the average of all numbers in an array.
16.Write a Ruby method to rotate an array by a given number of positions to the left.
17.Write a Ruby method to find the longest word in a string.
18.Write a Ruby method to generate all possible permutations of a given string.
19.Write a Ruby method to find the second-largest number in an array.

             ============Ruby Hash Questions================
1. Write a program that counts the frequency of each word in a given string.
2. Write a program that takes two hashes and returns a new hash containing only the key/value pairs that are common to both hashes.
3. Write a program that takes a hash and returns a new hash with the keys and values swapped.
4. Write a program that takes a hash and returns a new hash with only the key/value pairs where the value is a number.
5. Write a program that takes a hash and returns a new hash with only the key/value pairs where the key is a string.
6. Write a program that takes a hash and returns a new hash with the keys sorted alphabetically.
7. Write a program that takes a hash and returns a new hash with the values sorted numerically.
8. Write a program that takes a hash and returns a new hash with the keys and values reversed.
9. Write a program that takes a hash and returns a new hash with the keys and values converted to strings.
10. Write a program that takes a hash and returns a new hash with the values converted to booleans.
11. Write a program that takes a hash and returns a new hash with the values converted to symbols.
12. Write a program that takes a hash and returns a new hash with the keys converted to symbols.
13. Write a program that takes a hash and returns a new hash with the keys and values converted to arrays.
14. Write a program that takes a hash and returns a new hash with the values converted to uppercase.
15. Write a program that takes a hash and returns a new hash with the values converted to lowercase.
             =========================solutions ============
# # find the two no of an array which is the sum of 14

arr = [9,8,6,9,2,12,3,5,3,2,1]
target = 14
arr1 = []
for i in 0...arr.length
  for j in (i + 1)...arr.length
   if arr[i] + arr[j] == target
     arr1 << arr[i] << arr[j]
   end
  end
end

print arr1

# 1.Write a Ruby method to check if a given number is prime.

num = gets.chomp.to_i
prime = true

for i in 2...num
  if num % i == 0
    prime = false
    break;
  end
end

if prime == true
 print num, "is prime number"
else
  print "not a prime number "
end


# 2.Write a Ruby method to reverse a string without using the built-in reverse method.

str = "Hellow world"
str1 = ''
for i in (str.length - 1).downto(0)
   str1 << str[i]
end
print str1

==================================

str = "hello"
str1 = ""

i = str.length - 1
while i >= 0
  str1 << str[i]
  i -= 1
end

puts str1  # Output: "olleh"

# 3.Write a Ruby method to check if two strings are anagrams of each other.

def anagram?(str1, str2)
  return false if str1.length != str2.length

  # Convert to lowercase, split to characters, sort and compare
  str1.downcase.chars.sort == str2.downcase.chars.sort
end

puts anagram?("listen", "silent")     # => true
puts anagram?("Hello", "Olelh")       # => true
puts anagram?("test", "tost")         # => false
puts anagram?("rail safety", "fairy tales".gsub(" ", "")) # => true
puts anagram?("foo", "bar")           # => false

#3. Write a Ruby method to find the factorial of a given number.

num = 5
z = 1
for i in 1..num
  z *= i # z = z * i 
end
print z


# 5.Write a Ruby method to find the Fibonacci sequence up to a specified number of terms.

def fib(n)
 if n == 0
   return 0
 elsif n == 1
   return 1
 else
  fib(n - 1) + fib(n - 2)
 end
 end

for n in 0..7
end
print fib(n)

=================================

def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  fib(n - 1) + fib(n - 2)
end


# 6. Write a Ruby method to check if a string is a palindrome.

str = "naman"
str1 = ''
for i in (str.length - 1).downto(0)
     str1 << str[i]

end

if str1 == str
 print "palindrome"
else
  print "not a palindrome"
end


================================

str = "hello"
reverse = ""

i = str.length - 1
while i >= 0
  reverse << str[i]
  i -= 1
end

if reverse == str
 print "palindrome"
else
  print "not a palindrome"
end

#7.Write a Ruby method to remove duplicate elements from an array

arr = [3,4,5,5,5,9,10,8,10,9,8,12]
arr1 = []
for i in 0...arr.length
  flag = true
  for j in (i + 1)...arr.length
     if arr[i] == arr[j]
     flag = false
  end
end
if flag == true
  arr1 << arr[i]
end
end

print arr1


=======================

def remove_duplicates(array)
  result = []
  seen = {}

  array.each do |element|
    unless seen[element]
      result << element
      seen[element] = true
    end
  end

  result
end


#  9.Write a Ruby method to check if a given array is sorted in ascending order.

arr = [3,4,4,5,5,9,11,9,4]

for i in 0...arr.length
  for j in (i + 1)...arr.length
     if arr[i] > arr[j]
      temp = 0
      temp = arr[i]
      arr[i]= arr[j]
      arr[j] = temp
     end
    end
  end

  print arr

===========================

def sorted_ascending?(array)
  for i in 0...(array.length - 1)
    return false if array[i] > array[i + 1]
  end
  true
end


# 10.Write a Ruby method to find the largest and smallest numbers in an array.

arr = [3,4,4,5,5,9,11,9,4]

for i in 0...arr.length
  for j in (i + 1)...arr.length
    if arr[i] > arr[j]
      temp = 0
       temp = arr[i]
       arr[i] = arr[j]
       arr[j] = temp
  end
end
end
print arr[i]

===========================================

def find_min_max(array)
  return nil if array.empty?

  min = max = array[0]

  array.each do |num|
    min = num if num < min
    max = num if num > max
  end

  { min: min, max: max }
end

puts find_min_max([3, 5, 1, 9, 2]).inspect
# => {:min=>1, :max=>9}

puts find_min_max([7, 7, 7]).inspect
# => {:min=>7, :max=>7}

puts find_min_max([-10, 0, 100, 50]).inspect
# => {:min=>-10, :max=>100}

puts find_min_max([]).inspect
# => nil


# 11.Write a Ruby method to count the occurrence of each element in an array and return a hash with the results.

arr = [3,4,4,5,5,9,11,9,4]
hash = {}
for i in 0...arr.length
  count = 0
  for j in 0...arr.length
   if arr[i] == arr[j]
        count += 1
        hash[arr[i]] = count
   end
  end
end
print hash


==================

def count_occurrences(array)
  count_hash = {}

  array.each do |element|
    if count_hash[element]
      count_hash[element] += 1
    else
      count_hash[element] = 1
    end
  end

  count_hash
end

puts count_occurrences([1, 2, 2, 3, 3, 3]).inspect
# => {1=>1, 2=>2, 3=>3}

puts count_occurrences(["a", "b", "a", "c", "b", "a"]).inspect
# => {"a"=>3, "b"=>2, "c"=>1}



# 12.Write a Ruby method to find the sum of all even numbers in an array.

arr = [2,4,2,2,9,7,3,7,]
sum = 0
for i in 0...arr.length
  if arr[i] % 2 == 0
    sum += arr[i]
  end
end
print sum

==========================

def sum_of_evens(array)
  sum = 0

  array.each do |num|
    sum += num if num % 2 == 0
  end

  sum
end

puts sum_of_evens([1, 2, 3, 4, 5, 6])     # => 12 (2+4+6)
puts sum_of_evens([7, 9, 11])            # => 0
puts sum_of_evens([0, -2, -4, 5])        # => -6
puts sum_of_evens([])                    # => 0


# 13.Write a Ruby method to find the common elements between two arrays.

arr = [2,4,2,2,9,7,3,7,]
arr1 = [3,2,8,9,3]
arr2 = []

for i in 0...arr.length
  for j in 0...arr1.length
      if arr[i] == arr1[j]
         arr2 << arr[i]
  end
end

end
print "common elements #{arr2}"

==========================
def common_elements(array1, array2)
  result = []
  seen = {}

  # Mark elements of array1 in a hash
  array1.each do |element|
    seen[element] = true
  end

  # Check which elements in array2 exist in array1
  array2.each do |element|
    result << element if seen[element]
  end

  result
end

puts common_elements([1, 2, 3, 4], [3, 4, 5]).inspect
# => [3, 4]

puts common_elements(["a", "b", "c"], ["c", "d", "e"]).inspect
# => ["c"]

puts common_elements([10, 20], [30, 40]).inspect
# => []

puts common_elements([], [1, 2, 3]).inspect
# => []


# armstrong number

n = gets.chomp.to_i
num = n.to_s
sum = 0
for i in 0...num.length
   z = num[i].to_i
   sum += z**num.length
end
if sum == n
 print "armstrong number "
else
  print "not a armstrong number "
end


===============================

number = 153

puts "It is an Number is Armstrong Number" if number == number.digits.map{ |digit| digit ** number.digits.size}.sum


===============================

number = 153
num = number
digits = []
while num > 0
  digits << num % 10
  num /= 10
end
sum = 0
digits.each do |digit|
  power = 1
  digits.size.times { power *= digit }
  sum += power
end
puts "It is an Armstrong Number" if number == sum


#  left even right odd try this one

  arr = [1,2,3,4,5,6,7,8,9]
  sum = 12
  result = nil
left = 0
right = arr.length - 1

while left < right
  curr_sum = arr[left] + arr[right]

if curr_sum == sum
  result =  [arr[left], arr[right]]
 break

elsif curr_sum < sum
  left +=1
else
  right -=1
end

end

if result

  puts result

else
  puts "nothing"
end

# 14.Write a Ruby method to sort an array of strings based on their lengths, from shortest to longest.

arr = ["ankit", "vipin", "yogi", "yogendra", "shivendra"]

for i in 0...arr.length
  for j in (i + 1)...arr.length
    temp = 0
    if arr[i].length > arr[j].length
      temp = arr[i]
      arr[i] = arr[j]
      arr[j] = temp
    end
  end
end
print arr



========================

def sort_by_length(array)
  n = array.length

  (0...n).each do |i|
    (0...(n - i - 1)).each do |j|
      if array[j].length > array[j + 1].length
        array[j], array[j + 1] = array[j + 1], array[j]
      end
    end
  end

  array
end



# max occurence ruby program to find out the word which contain max number of char

# output = bhavesh
str = "naresh gourav priyal diksha bhavesh"
char_1 = 'h'
c = ''

def max_chars(str, char_1)
  # result = ""
  count = 0
  max = 0
  word = ""
  max_word = ""
  
  str.each_char do |char|
    if char != " "
      word += char
      count +=1 if char == char_1
    else
      if count > max
        max = count
        max_word = word
      end
      word = ""
      count = 0
    end
  end
  
  if count > max
    max_word = word
  end
  
  max_word
end

puts max_chars(str, char_1)


