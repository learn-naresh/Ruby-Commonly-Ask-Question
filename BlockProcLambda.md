Great question! In Ruby, **blocks**, **procs**, and **lambdas** are all ways to **encapsulate code** and pass it around like variables, but they have subtle and important differences.

---

## 🔹 1. **Block**

A **block** is an anonymous piece of code that you can pass to methods. It’s not an object on its own (unlike `Proc` and `Lambda`) and you can’t assign it to a variable directly.

### ✅ Example:

```ruby
def greet
  yield if block_given?
end

greet { puts "Hello from block" } # => Hello from block
```

---

## 🔹 2. **Proc**

A `Proc` is an object representing a block of code. It’s more flexible than a lambda in how it handles return and arguments.

### ✅ Example:

```ruby
say_hello = Proc.new { puts "Hello from Proc" }
say_hello.call  # => Hello from Proc
```

---

## 🔹 3. **Lambda**

A `lambda` is a special kind of `Proc` that behaves more strictly like a method.

### ✅ Example:

```ruby
say_hi = lambda { puts "Hello from Lambda" }
say_hi.call  # => Hello from Lambda
```

---

## 🔄 Key Differences

| Feature               | Block                     | Proc                                        | Lambda                                      |
| --------------------- | ------------------------- | ------------------------------------------- | ------------------------------------------- |
| **Object?**           | ❌ Not an object           | ✅ Yes                                       | ✅ Yes                                       |
| **Created with?**     | Passed to methods         | `Proc.new` or `proc`                        | `lambda` or `->`                            |
| **Returns?**          | Uses `return` of method   | `return` exits the method                   | `return` exits only from the lambda         |
| **Argument checking** | Loose (depends on method) | Loose (extra args ignored, missing are nil) | Strict (raises error on wrong args)         |
| **Usage**             | `yield` inside a method   | Assigned to variable, reusable              | Same as Proc, but with method-like behavior |

---

### 🔥 Return Behavior Example:

```ruby
def test_proc
  p = Proc.new { return "From Proc" }
  p.call
  return "After Proc"
end

puts test_proc
# => "From Proc" (returns from entire method)

def test_lambda
  l = lambda { return "From Lambda" }
  l.call
  return "After Lambda"
end

puts test_lambda
# => "After Lambda" (lambda returns only from itself)
```

---

### 🔥 Arity (Argument Checking):

```ruby
p = Proc.new { |a, b| puts "Proc: #{a}, #{b}" }
p.call(1)       # => Proc: 1, 

l = lambda { |a, b| puts "Lambda: #{a}, #{b}" }
l.call(1)       # => ArgumentError: wrong number of arguments
```

---

## 🧠 Summary

| Term   | Object | Return Behavior      | Arity Check | Use Case                            |
| ------ | ------ | -------------------- | ----------- | ----------------------------------- |
| Block  | No     | Uses method's return | Loose       | Quick code pass to method (`yield`) |
| Proc   | Yes    | Returns from method  | Loose       | Reusable blocks of logic            |
| Lambda | Yes    | Returns from itself  | Strict      | Safe method-like code blocks        |

---

Let me know if you'd like visual diagrams, Rails-specific use cases, or how to choose between them.
