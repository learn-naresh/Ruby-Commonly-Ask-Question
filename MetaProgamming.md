Sure! Here's the exact content you provided, formatted clearly:

---

### 📘 Meta Programming Tool | Meaning

| **Meta Programming Tool**     | **Meaning**                             |
| ----------------------------- | --------------------------------------- |
| `define_method`               | Define methods dynamically              |
| `method_missing`              | Catch unknown method calls              |
| `send`                        | Call methods dynamically                |
| `class_eval`, `instance_eval` | Modify classes or instances dynamically |

---

### 📚 Basic Simple Examples

#### 1. `define_method`

Instead of manually writing methods:

```ruby
def hello
  puts "Hello!"
end
```

You can create methods dynamically:

```ruby
class Greeter
  define_method(:hello) do
    puts "Hello!"
  end
end

g = Greeter.new
g.hello   # => "Hello!"
```

👉 `define_method` creates a method at runtime!

---

#### 2. `method_missing`

If you call a method that doesn't exist, Ruby will automatically call `method_missing`.

You can catch that and create behavior.

**Example:**

```ruby
class DynamicGreeter
  def method_missing(method_name, *args, &block)
    if method_name.to_s.start_with?('say_')
      puts "You said: #{method_name.to_s.gsub('say_', '')}"
    else
      super
    end
  end
end

g = DynamicGreeter.new
g.say_hello     # => "You said: hello"
g.say_goodbye   # => "You said: goodbye"
g.walk          # => Error: NoMethodError (normal behavior)
```

👉 `method_missing` lets you respond to unknown methods smartly.

---

#### 3. `send`

`send` lets you call a method by name, even if you don't know it until runtime.

```ruby
class Person
  def greet
    puts "Hi!"
  end
end

p = Person.new
p.send(:greet)  # => "Hi!"
```

✅ Useful for dynamic method calls.

---

Let me know if you want examples for `class_eval` and `instance_eval` too!
