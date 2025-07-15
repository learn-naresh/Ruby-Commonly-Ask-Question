# 1.Write a Ruby method to check if a given number is prime.
# Intitution
# num = 3
# num % i == 0
# prime = false

def check_prime?(num)
  return false if num < 2

  prime = true
  (2...num).each do |i|
    if num % i == 0
      prime = false
      break;
    end
  end
  prime
end
num = 14
puts check_prime?(num)