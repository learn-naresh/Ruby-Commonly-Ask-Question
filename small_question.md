Sure! Here's a curated list of **technical interview questions** focusing on **hashes, arrays, and strings in Ruby**, ranging from basic to advanced levels, with explanations and answers where helpful.

---

## 🔢 **Array Questions**

### 🔸 Q1. How do you remove duplicates from an array?

```ruby
[1, 2, 2, 3, 3, 3].uniq # => [1, 2, 3]
```

---

### 🔸 Q2. How do you flatten a nested array?

```ruby
[1, [2, [3, 4]]].flatten # => [1, 2, 3, 4]
```

---

### 🔸 Q3. What's the difference between `map` and `each`?

> `map` returns a **new array** with transformed values.
> `each` just **iterates** (returns the original array) — used for side effects.

---

### 🔸 Q4. How do you rotate an array?

```ruby
[1, 2, 3].rotate      # => [2, 3, 1]
[1, 2, 3].rotate(-1)  # => [3, 1, 2]
```

---

### 🔸 Q5. How do you get the intersection of two arrays?

```ruby
[1, 2, 3] & [2, 3, 4] # => [2, 3]
```

---

## 🧩 **Hash Questions**

### 🔸 Q6. How do you merge two hashes? What happens with duplicate keys?

```ruby
{a: 1}.merge({a: 2, b: 3}) # => {:a=>2, :b=>3}
```

> The second hash's values override keys in the first.

---

### 🔸 Q7. How do you set a default value for a hash?

```ruby
h = Hash.new(0)
h[:missing] # => 0
```

---

### 🔸 Q8. How do you convert an array of pairs into a hash?

```ruby
[[:a, 1], [:b, 2]].to_h # => {:a=>1, :b=>2}
```

---

### 🔸 Q9. How do you invert a hash?

```ruby
{a: 1, b: 2}.invert # => {1=>:a, 2=>:b}
```

> ⚠️ Only works reliably if values are unique.

---

### 🔸 Q10. How do you deeply merge two nested hashes?

```ruby
require 'active_support/core_ext/hash/deep_merge'

h1 = {a: {x: 1}}
h2 = {a: {y: 2}}
h1.deep_merge(h2) # => {:a=>{:x=>1, :y=>2}}
```

---

## ✂️ **String Questions**

### 🔸 Q11. How do you reverse a string?

```ruby
"hello".reverse # => "olleh"
```

---

### 🔸 Q12. How do you interpolate variables into a string?

```ruby
name = "Ruby"
"Hello, #{name}" # => "Hello, Ruby"
```

---

### 🔸 Q13. How do you split a string into words?

```ruby
"this is ruby".split # => ["this", "is", "ruby"]
```

---

### 🔸 Q14. How do you check if a string contains a substring?

```ruby
"rails".include?("ai") # => true
```

---

### 🔸 Q15. How do you substitute part of a string?

```ruby
"123-456".gsub("-", "") # => "123456"
```

---

## 🧠 **Advanced Questions**

### 🔸 Q16. What's the difference between `!` and `?` methods in Ruby?

> `!` methods usually **mutate** (e.g., `map!`),
> `?` methods return **boolean** (e.g., `empty?`, `include?`).

---

### 🔸 Q17. How do you group an array of hashes by a key?

```ruby
arr = [{role: "admin"}, {role: "user"}, {role: "admin"}]
arr.group_by { |h| h[:role] }
# => {"admin"=>[{:role=>"admin"}, {:role=>"admin"}], "user"=>[{:role=>"user"}]}
```

---

### 🔸 Q18. How do you count characters in a string?

```ruby
"hello".chars.tally # => {"h"=>1, "e"=>1, "l"=>2, "o"=>1}
```

---

### 🔸 Q19. How do you convert a hash to a query string?

```ruby
{a: 1, b: 2}.to_query # => "a=1&b=2" (Rails only)
```

---

### 🔸 Q20. How do you symbolize keys of a hash?

```ruby
{"a" => 1}.transform_keys(&:to_sym) # => {:a=>1}
```

---

## 🧩 Need Practice Problems?

Would you like:

* Coding problems to solve in Ruby (e.g., anagrams, word frequency)?
* Data structure-specific problems?
* Mock interview Q\&A?

Let me know and I’ll tailor more practice sets or a mini test!
