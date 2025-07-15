# 4.Write a Ruby method to find the factorial of a given number.

# Iterative Way
def factorial_of_number(num)
  result = 1
  (2..num).each do |i|
    result = result * i
  end
  result
end
num = 5
puts factorial_of_number(num)


# Recursive Way

def factorial(n)
  return 1 if n <= 1
  n * factorial(n - 1)
end
num = 5
puts factorial(num)