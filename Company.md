Perfect! Here's the **brief definition with an example** for each of the Builder.ai interview questions you've shared so far:

---

### **1. Rails Caching**

**Definition:**
Caching in Rails improves performance by storing the result of expensive operations and reusing them in future requests.

**Example:**

```ruby
# Low-level cache example
Rails.cache.fetch("user_#{user.id}_profile", expires_in: 12.hours) do
  user.profile_data
end
```

---

### **2. Asset Pipeline**

**Definition:**
The Asset Pipeline in Rails compiles, minifies, and serves assets (JS, CSS, images). It allows assets to be written in higher-level languages like SCSS or CoffeeScript.

**Example (app/assets/stylesheets/application.scss):**

```scss
/*
 *= require_tree .
 *= require_self
 */
```

**Manifest file:** `app/assets/config/manifest.js`

---

### **3. Sidekiq**

**Definition:**
Sidekiq is a background job processor using Redis. It allows you to run time-consuming tasks asynchronously.

**Example:**

```ruby
class HardWorker
  include Sidekiq::Worker

  def perform(name)
    puts "Working on #{name}"
  end
end

# Enqueue job
HardWorker.perform_async('task1')
```

---

### **4. Includes vs Joins**

**Definition:**

* `includes`: Prevents N+1 queries (eager loads associated records).
* `joins`: Used to write SQL joins, but doesn’t load associations.

**Example:**

```ruby
# Eager load posts for each user
User.includes(:posts).each { |user| user.posts }

# Inner join
User.joins(:posts).where(posts: { published: true })
```

---

### **5. Frequency Count**

**Definition:**
Counting how often each element appears in a collection (string or array).

**Example:**

```ruby
str = "aabbcc"
freq = str.chars.each_with_object(Hash.new(0)) { |char, h| h[char] += 1 }
# => {"a"=>2, "b"=>2, "c"=>2}
```

---

### **6. Class vs Module**

**Definition:**

* **Class**: Used to instantiate objects.
* **Module**: Used for namespacing or mixing in functionality.

**Example:**

```ruby
module Greet
  def hello
    "Hello!"
  end
end

class User
  include Greet
end

User.new.hello # => "Hello!"
```

---

### **7. Mixin**

**Definition:**
A way to add reusable functionality to classes using modules.

**Example:**

```ruby
module Printable
  def print
    puts "Printed"
  end
end

class Document
  include Printable
end
```

---

### **8. Polymorphic Association**

**Definition:**
Allows a model to belong to more than one other model using a single association.

**Example:**

```ruby
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end

class Post < ApplicationRecord
  has_many :comments, as: :commentable
end

class Video < ApplicationRecord
  has_many :comments, as: :commentable
end
```

---

### **9. Debugging in Rails**

**Definition:**
Rails supports debugging using tools like `byebug`, `pry`, and `logger`.

**Example:**

```ruby
def show
  byebug
  @user = User.find(params[:id])
end
```

---

### **10. WebSocket**

**Definition:**
WebSocket allows two-way communication between the server and client. Rails uses **Action Cable** for this.

**Example (Channel):**

```ruby
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end
end
```

---

### **11. Fingerprinting**

**Definition:**
Fingerprinting adds a unique hash to asset filenames for cache busting in production.

**Example:**
`application-908e25f4bf641868d8683022a5b62f54.css`

---

### **12. Monkey Patching**

**Definition:**
Modifying or extending built-in classes at runtime.

**Example:**

```ruby
class String
  def shout
    self.upcase + "!"
  end
end

"hello".shout # => "HELLO!"
```

---

### **13. SQL Injection**

**Definition:**
A vulnerability that allows attackers to execute arbitrary SQL code.

**Unsafe Example:**

```ruby
User.where("name = '#{params[:name]}'") # vulnerable
```

**Safe Example:**

```ruby
User.where(name: params[:name])
```

---

### **14. Callbacks in Rails**

**Definition:**
Methods that get called at certain points in an object’s lifecycle.

**Example:**

```ruby
class User < ApplicationRecord
  before_save :normalize_name

  def normalize_name
    self.name = name.downcase
  end
end
```

---

### **15. (Repeated) Monkey Patching**

*Already covered above in #12*

---

### **16. Eager Loading vs Lazy Loading**

**Definition:**

* **Eager Loading**: Loads associated records upfront (`includes`).
* **Lazy Loading**: Loads associated records only when accessed.

**Example:**

```ruby
# Eager
User.includes(:profile).find(1)

# Lazy
user = User.find(1)
user.profile # triggers separate query
```

---

### **17. SQL Queries**

**Definition:**
SQL (Structured Query Language) is used to query data from a database.

**Example:**

```sql
SELECT name FROM users WHERE age > 25;
```

---

### **18. attr\_accessor**

**Definition:**
Creates getter and setter methods for Ruby class attributes.

**Example:**

```ruby
class User
  attr_accessor :name
end

user = User.new
user.name = "Alice"
puts user.name
```

---

### **19. Upgrading Rails Versions**

**Definition:**
Rails upgrade involves updating gems, config files, syntax, and deprecations.

**Steps (from Rails 6 to 7):**

* Update `Gemfile` and run `bundle update rails`
* Use `rails app:update`
* Run test suite
* Check changelogs and fix deprecated features

---

### **20. manifest.js Tree Structure**

**Definition:**
Controls which assets are included in the compiled output.

**Example (manifest.js):**

```js
//= link_tree ../images
//= link_directory ../stylesheets .css
```

---

### **21. Autoloading in Rails**

**Definition:**
Rails auto-loads constants (classes/modules) based on file name and path using Zeitwerk.

**Example:**

```ruby
# app/models/user.rb
class User < ApplicationRecord
end
```

Referencing `User` automatically loads `user.rb`.

---

### **22. Active Storage**

**Definition:**
Rails' built-in library for file uploads. Supports services like S3, Azure, etc.

**Example:**

```ruby
class User < ApplicationRecord
  has_one_attached :avatar
end

user.avatar.attach(io: File.open("/path/pic.jpg"), filename: "pic.jpg")
```

---

### **23. Redis**

**Definition:**
An in-memory key-value store used for caching, session storage, and job queues (e.g. Sidekiq).

**Example:**

```ruby
Redis.current.set("greeting", "hello")
Redis.current.get("greeting") # => "hello"
```

---


