Got it! Here are **solutions without using built-in helper methods** like `tally`, `group_by`, `count`, `sort`, `chars`, etc., as much as possible. I’ll rely mostly on loops, conditionals, and basic operations.

---

## ✅ Level 1: Easy

### 1. **Anagram Check (without `sort` or `chars`)**

```ruby
def anagram?(str1, str2)
  return false if str1.length != str2.length

  freq = {}

  # count chars in str1
  str1.each_char do |c|
    freq[c] = (freq[c] || 0) + 1
  end

  # subtract counts for str2
  str2.each_char do |c|
    return false if !freq[c] || freq[c] == 0
    freq[c] -= 1
  end

  freq.values.all? { |v| v == 0 }
end
```

---

### 2. **Count Vowels (without `count`)**

```ruby
def count_vowels(str)
  vowels = ['a', 'e', 'i', 'o', 'u']
  count = 0
  str.downcase.each_char do |c|
    count += 1 if vowels.include?(c)
  end
  count
end
```

---

### 3. **Find Duplicates in Array (without `tally` or `select`)**

```ruby
def find_duplicates(arr)
  counts = {}
  duplicates = []

  arr.each do |el|
    counts[el] = (counts[el] || 0) + 1
  end

  counts.each do |k, v|
    duplicates << k if v > 1
  end

  duplicates
end
```

---

## ✅ Level 2: Intermediate

### 4. **Group Words by Anagram (without `group_by`, `sort`)**

```ruby
def sorted_chars(word)
  chars = word.each_char.to_a
  # simple bubble sort for chars
  n = chars.length
  (0...n).each do |i|
    (0...(n - i - 1)).each do |j|
      if chars[j] > chars[j + 1]
        chars[j], chars[j + 1] = chars[j + 1], chars[j]
      end
    end
  end
  chars.join
end

def group_anagrams(words)
  groups = {}

  words.each do |word|
    key = sorted_chars(word)
    groups[key] ||= []
    groups[key] << word
  end

  groups.values
end
```

---

### 5. **Character Frequency Counter (without `tally`)**

```ruby
def char_count(str)
  counts = {}
  str.each_char do |c|
    next if c == ' '
    counts[c] = (counts[c] || 0) + 1
  end
  counts
end
```

---

### 6. **Array Chunking (without `each_slice`)**

```ruby
def chunk_array(arr, size)
  chunks = []
  i = 0

  while i < arr.length
    chunk = []
    j = 0
    while j < size && (i + j) < arr.length
      chunk << arr[i + j]
      j += 1
    end
    chunks << chunk
    i += size
  end

  chunks
end
```

---

## ✅ Level 3: Challenging

### 7. **Longest Substring Without Repeating Characters**

```ruby
def longest_unique_substring(str)
  seen = {}
  left = 0
  max_len = 0

  str.each_char.with_index do |char, right|
    if seen[char] && seen[char] >= left
      left = seen[char] + 1
    end
    seen[char] = right
    length = right - left + 1
    max_len = length if length > max_len
  end

  max_len
end
```

---

### 8. **Deep Merge Two Hashes (no built-in deep merge)**

```ruby
def deep_merge(h1, h2)
  result = {}

  keys = []
  h1.each_key { |k| keys << k }
  h2.each_key { |k| keys << k unless keys.include?(k) }

  keys.each do |k|
    v1 = h1[k]
    v2 = h2[k]

    if v1.is_a?(Hash) && v2.is_a?(Hash)
      result[k] = deep_merge(v1, v2)
    elsif v2.nil?
      result[k] = v1
    else
      result[k] = v2
    end
  end

  result
end
```

---

### 9. **Most Frequent Word**

```ruby
def most_frequent_word(text)
  words = []
  word = ''
  text.downcase.each_char do |c|
    if c >= 'a' && c <= 'z'
      word += c
    else
      unless word.empty?
        words << word
        word = ''
      end
    end
  end
  words << word unless word.empty?

  counts = {}
  words.each do |w|
    counts[w] = (counts[w] || 0) + 1
  end

  max_word = nil
  max_count = 0
  counts.each do |w, count|
    if count > max_count
      max_count = count
      max_word = w
    end
  end

  max_word
end
```

---

### 10. **Subarray Sum Equals Target**

```ruby
def subarray_sum?(arr, target)
  sum = 0
  seen_sums = {0 => true}

  arr.each do |num|
    sum += num
    return true if seen_sums[sum - target]
    seen_sums[sum] = true
  end

  false
end
```

---

If you want, I can provide **explanations for any specific solution** or help with **test cases**. Just ask!
