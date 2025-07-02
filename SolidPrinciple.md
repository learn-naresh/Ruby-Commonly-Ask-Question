The **SOLID** principles are five design principles intended to make object-oriented software more understandable, flexible, and maintainable. While they originate from general OOP practices, they are highly relevant in **Ruby on Rails (RoR)** applications too.

---

### 🔹 S — Single Responsibility Principle (SRP)

**Each class should have only one reason to change.**

#### 🔸 Example (Bad):

```ruby
class User
  def create_user(params)
    # logic to create user
  end

  def send_welcome_email
    # logic to send email
  end
end
```

#### ✅ Example (Good):

```ruby
class UserCreator
  def create(params)
    user = User.create(params)
    WelcomeMailer.send_welcome_email(user).deliver_later
  end
end

class WelcomeMailer < ApplicationMailer
  def send_welcome_email(user)
    # send email logic
  end
end
```

**Why it’s better:** `UserCreator` handles creation, and `WelcomeMailer` handles communication—each class does one job.

---

### 🔹 O — Open/Closed Principle

**Software entities should be open for extension but closed for modification.**

#### 🔸 Example (Bad):

```ruby
class PaymentProcessor
  def process(payment)
    if payment.type == 'credit_card'
      process_credit_card(payment)
    elsif payment.type == 'paypal'
      process_paypal(payment)
    end
  end
end
```

#### ✅ Example (Good):

```ruby
class PaymentProcessor
  def process(payment)
    handler = "Payment::#{payment.type.camelize}Handler".constantize.new
    handler.process(payment)
  end
end

module Payment
  class CreditCardHandler
    def process(payment)
      # Credit card processing
    end
  end

  class PaypalHandler
    def process(payment)
      # PayPal processing
    end
  end
end
```

**Why it’s better:** You can add a new handler without modifying `PaymentProcessor`.

---

### 🔹 L — Liskov Substitution Principle

**Subclasses should be replaceable for their base class without breaking the application.**

#### 🔸 Example (Bad):

```ruby
class Bird
  def fly
    # flying logic
  end
end

class Penguin < Bird
  def fly
    raise "Penguins can't fly"
  end
end
```

#### ✅ Example (Good):

```ruby
class Bird
end

class FlyingBird < Bird
  def fly
    # flying logic
  end
end

class Penguin < Bird
end

class Eagle < FlyingBird
end
```

**Why it’s better:** You avoid unexpected errors when substituting subclasses.

---

### 🔹 I — Interface Segregation Principle

**Clients should not be forced to depend on interfaces they do not use.**

Ruby doesn't have interfaces like Java, but the idea still applies to duck typing.

#### 🔸 Example (Bad):

```ruby
class Report
  def generate_pdf; end
  def generate_csv; end
  def generate_xml; end
end

class CSVReport < Report
  def generate_pdf
    raise NotImplementedError
  end
end
```

#### ✅ Example (Good):

```ruby
class CSVReport
  def generate_csv
    # CSV logic
  end
end

class PDFReport
  def generate_pdf
    # PDF logic
  end
end
```

**Why it’s better:** Each class supports only the needed methods.

---

### 🔹 D — Dependency Inversion Principle

**High-level modules should not depend on low-level modules. Both should depend on abstractions.**

#### 🔸 Example (Bad):

```ruby
class NotificationService
  def send_notification(user, message)
    EmailSender.new.send_email(user.email, message)
  end
end
```

#### ✅ Example (Good):

```ruby
class NotificationService
  def initialize(sender)
    @sender = sender
  end

  def send_notification(user, message)
    @sender.send(user, message)
  end
end

class EmailSender
  def send(user, message)
    # email logic
  end
end

# Usage
NotificationService.new(EmailSender.new).send_notification(user, "Hello")
```

**Why it’s better:** You can inject any sender (SMS, Push, etc.), making the system more flexible and testable.

---

### Summary (Quick Reference):

| Principle | Meaning                                   | Rails Tip                                      |
| --------- | ----------------------------------------- | ---------------------------------------------- |
| **S**     | One class = one responsibility            | Use service objects, mailers, and concerns     |
| **O**     | Extend without modifying existing code    | Use polymorphism, modules, and metaprogramming |
| **L**     | Subclasses must not break parent behavior | Use proper class hierarchies                   |
| **I**     | Don’t force unused methods                | Keep objects focused, don’t over-engineer      |
| **D**     | Depend on abstractions                    | Use dependency injection, service classes      |

---

Would you like me to turn this into a cheat sheet PDF or markdown?
