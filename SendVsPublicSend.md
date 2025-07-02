Here’s **how to use `send` and `public_send`** in Ruby/Rails, with examples for both simple Ruby objects and Rails models.

---

### ✅ **Basic Syntax**

```ruby
object.send(:method_name, *arguments)
object.public_send(:method_name, *arguments)
```

---

## 🔹 1. Simple Ruby Object Example

```ruby
class User
  def greet(name)
    "Hello, #{name}"
  end

  private

  def secret_code
    "XYZ123"
  end
end

user = User.new

# ✅ Call public method
puts user.send(:greet, "Alice")       # => "Hello, Alice"
puts user.public_send(:greet, "Bob")  # => "Hello, Bob"

# ✅ Call private method
puts user.send(:secret_code)          # => "XYZ123"
puts user.public_send(:secret_code)   # => NoMethodError
```

---

## 🔹 2. In a Rails Model

Suppose you have a `User` model with attributes and methods:

```ruby
class User < ApplicationRecord
  def full_name
    "#{first_name} #{last_name}"
  end
end

user = User.first

# Dynamically call method name stored in a string or symbol
method_name = :full_name

user.send(method_name)        # => "Jane Doe"
user.public_send(method_name) # => "Jane Doe"
```

---

## 🔹 3. Use Case: Dynamic Field Access

If you want to display various fields based on configuration:

```ruby
fields = [:email, :phone_number, :full_name]

fields.each do |field|
  puts user.public_send(field)
end
```

---

## 🔹 4. ⚠️ Dangerous Example (When to Avoid)

Let’s say you take method names from user input:

```ruby
method = params[:method_name]  # User input

# BAD: Allows calling dangerous or private methods!
user.send(method.to_sym)

# SAFER: Only allows public methods
user.public_send(method.to_sym)
```

---

## Summary

| Use Case                  | Method        | Notes                        |
| ------------------------- | ------------- | ---------------------------- |
| Any method (even private) | `send`        | Power tool, use with caution |
| Only public methods       | `public_send` | Safe, respects encapsulation |

Let me know if you want to see this applied in a controller, view, or ActiveAdmin!
