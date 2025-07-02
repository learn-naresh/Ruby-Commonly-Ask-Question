**Duck typing** in Ruby (and thus Ruby on Rails) is a programming concept where the type or class of an object is less important than the methods it responds to. The name comes from the saying:

> *"If it walks like a duck and quacks like a duck, it must be a duck."*

In other words, if an object behaves like a certain type (by responding to expected methods), it *is* treated as that type — regardless of its actual class.

### 🔧 Why It Matters in Ruby/RoR

Ruby is a dynamically typed language, so it doesn't enforce strict type checks. Duck typing allows you to write more flexible and reusable code by focusing on behavior instead of inheritance hierarchies or types.

---

### ✅ Simple Example of Duck Typing

```ruby
class Dog
  def speak
    "Woof!"
  end
end

class Human
  def speak
    "Hello!"
  end
end

def say_something(entity)
  puts entity.speak
end

say_something(Dog.new)    # => "Woof!"
say_something(Human.new)  # => "Hello!"
```

In the example above, `say_something` does **not care** if the argument is a `Dog` or a `Human` — as long as it responds to `speak`.

---

### 🛠 Duck Typing in a Ruby on Rails Context

Imagine you have different payment processors:

```ruby
class Paypal
  def charge(amount)
    "Charging $#{amount} using PayPal"
  end
end

class Stripe
  def charge(amount)
    "Charging $#{amount} using Stripe"
  end
end

# Controller or service
def process_payment(processor, amount)
  processor.charge(amount)
end

process_payment(Paypal.new, 100)  # => "Charging $100 using PayPal"
process_payment(Stripe.new, 50)   # => "Charging $50 using Stripe"
```

Rails doesn't care whether it's a `Paypal` or `Stripe` object, as long as it responds to `charge`.

---

### ✅ Checking with `respond_to?`

You can even safely check behavior:

```ruby
def process_payment(processor, amount)
  if processor.respond_to?(:charge)
    processor.charge(amount)
  else
    raise "Object can't process payments"
  end
end
```

---

### 🔚 Summary

* **Duck typing** focuses on what an object *can do* rather than what it *is*.
* It allows **flexible, polymorphic code** without inheritance.
* Very natural in Ruby/Rails due to dynamic typing.

Would you like an example related to Rails models or controllers?
