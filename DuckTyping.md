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


Absolutely! Here's a practical **Duck Typing** example using **Rails models and controllers**:

---

## 🦆 Duck Typing Example in Rails — Models and Controller

### 👨‍👩‍👧 Scenario:

You have two different models that can be "notified" — say `User` and `Admin`. Both implement a `notify` method, but they're **not** subclasses of each other and do **not** share a module.

---

### ✅ Models:

```ruby
# app/models/user.rb
class User < ApplicationRecord
  def notify(message)
    puts "User notified with: #{message}"
  end
end

# app/models/admin.rb
class Admin < ApplicationRecord
  def notify(message)
    puts "Admin notified with: #{message}"
  end
end
```

---

### ✅ Controller or Service Layer:

```ruby
# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
  def send_notification
    recipient = find_recipient(params[:type], params[:id])
    message = params[:message]

    if recipient.respond_to?(:notify)
      recipient.notify(message)
      render plain: "Notification sent!"
    else
      render plain: "Recipient can't be notified", status: :unprocessable_entity
    end
  end

  private

  def find_recipient(type, id)
    case type
    when "User"
      User.find(id)
    when "Admin"
      Admin.find(id)
    else
      raise "Unknown recipient type"
    end
  end
end
```

---

### ✅ Sample Request:

```
POST /notifications/send_notification
Params: { type: "User", id: 1, message: "Your report is ready!" }
```

---

### 💡 What's happening:

* The controller doesn’t care whether the object is a `User` or `Admin`.
* It only assumes that the object **responds to `notify`**.
* This is **Duck Typing** — treating different objects the same if they respond to a common method.

---

### ✅ You can extend easily:

Add a `Manager` model tomorrow — just make sure it implements a `notify` method and no other part of the code needs to change. No inheritance, no interfaces — just behavior.

---

Would you like to see a **polymorphic notification system** using modules for comparison?
