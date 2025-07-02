In Ruby, `extend` and `prepend` are used to add behavior from modules to classes or objects—but they do it in **different ways** and for **different scopes**.

Let’s break them down with **simple explanations** and **examples**:

---

## 🔷 `extend` – Adds methods as **class methods** (singleton methods)

When you `extend` a module into a class or object:

* The module's methods become **class methods** (if on a class)
* Or **singleton methods** (if on an object)

### ✅ Example:

```ruby
module Greet
  def hello
    "Hello!"
  end
end

class User
  extend Greet
end

User.hello     # => "Hello!"
User.new.hello # => NoMethodError
```

So, `extend` adds methods to the **class itself**, not to its instances.

---

## 🔶 `prepend` – Adds methods **before the class’s own methods**

When you `prepend` a module:

* The module’s methods take **precedence over the class’s own methods**
* Useful for **overriding or wrapping** existing methods (great for decorators or logging)

### ✅ Example:

```ruby
module Greet
  def hello
    "Hello from module"
  end
end

class User
  prepend Greet

  def hello
    "Hello from User"
  end
end

puts User.new.hello  # => "Hello from module"
```

Here, `Greet#hello` overrides `User#hello`.

---

## 🧠 Difference vs `include`

* `include` puts the module **after** the class in the method lookup chain.
* `prepend` puts the module **before** the class.
* `extend` adds methods to the **singleton class** (class methods).

---

## 🔍 Method Lookup Order

```ruby
module A; end
module B; end

class C
  prepend A
  include B
end
```

### Lookup chain:

```
C.ancestors
=> [A, C, B, Object, Kernel, BasicObject]
```

---

## ✅ Use Cases

| Feature   | Use When...                                  |
| --------- | -------------------------------------------- |
| `extend`  | You want to add **class-level behavior**     |
| `prepend` | You want to **override or decorate** methods |
| `include` | You want to add **instance methods**         |

---

## 👀 Real Use Case: Logging with `prepend`

```ruby
module Logger
  def save
    puts "Saving #{self.class.name}"
    super
  end
end

class User
  prepend Logger

  def save
    puts "User saved"
  end
end

User.new.save
# => Saving User
# => User saved
```

---

Would you like to see how this works with ActiveSupport concerns or Rails-specific patterns?
