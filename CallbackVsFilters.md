Great! Let's break down **callbacks vs filters in Ruby on Rails**, explain **execution order/chaining**, and then cover some **good interview questions**.

---

## ✅ **Callbacks vs Filters in Rails**

### 🔹 1. **Callbacks**

Callbacks are **hooks into the lifecycle** of an **ActiveRecord model**. They let you run logic *before, after, or around* specific actions like saving, creating, updating, or destroying records.

#### ✍️ Example:

```ruby
class User < ApplicationRecord
  before_save :normalize_name
  after_create :send_welcome_email

  def normalize_name
    self.name = name.strip.titleize
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end
end
```

### 🔹 2. **Filters**

Filters are used in **controllers**, and allow logic to run *before, after, or around* controller actions.

#### ✍️ Example:

```ruby
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :track_user_activity

  def authenticate_user!
    # Check login, redirect if not authenticated
  end
end
```

---

## 🔄 **Chaining and Order of Execution**

### 🔹 Model Callbacks Order

For example, saving a record goes through this callback chain:

```plaintext
before_validation
after_validation
before_save
  before_create or before_update
  (record saved to DB)
  after_create or after_update
after_save
after_commit (if no exception)
```

### 🔹 Controller Filters Order

```plaintext
before_action
  → action runs
after_action
```

Filters (and callbacks) are **chained in the order they are defined**. You can also control execution using `:only`, `:except`, or `prepend_before_action`.

#### ✍️ Example:

```ruby
class PostsController < ApplicationController
  before_action :set_post
  before_action :authorize_user
  after_action :log_action

  def show
    # your action logic
  end
end
```

### ➕ Filter Chaining Example

```ruby
class SampleController < ApplicationController
  before_action :step_one
  before_action :step_two
  around_action :wrap_action

  def index
    puts "Inside action"
  end

  def step_one
    puts "Step one"
  end

  def step_two
    puts "Step two"
  end

  def wrap_action
    puts "Before wrap"
    yield
    puts "After wrap"
  end
end
```

#### ✅ Output:

```plaintext
Step one
Step two
Before wrap
Inside action
After wrap
```

---

## 💬 **Good Interview Questions (with Explanation)**

### 🔸 Q1: What’s the difference between a callback and a filter in Rails?

> **Expected Answer**: Callbacks are tied to ActiveRecord model lifecycle events (like save, create), while filters run around controller actions (like `index`, `show`). Callbacks modify or observe model behavior, filters control request flow.

---

### 🔸 Q2: What is the order of ActiveRecord callbacks when saving a record?

> **Expected Answer**:
> `before_validation` → `after_validation` →
> `before_save` → `before_create/update` →
> (Save happens) →
> `after_create/update` → `after_save` → `after_commit`

Bonus: Knowing when `after_commit` fires only if the transaction is successful.

---

### 🔸 Q3: How can you stop a callback chain?

> **Expected Answer**:
> Return `false` in a `before_*` callback or explicitly throw `:abort`:

```ruby
before_save do
  throw :abort if something_invalid?
end
```

---

### 🔸 Q4: How does `around_action` differ from `before_action`/`after_action`?

> **Expected Answer**: `around_action` wraps the actual controller action. It gets control **before and after** the action runs by using `yield`.

---

### 🔸 Q5: How do you apply a filter to only certain actions?

> **Expected Answer**:

```ruby
before_action :authorize_admin, only: [:destroy]
```

---

### 🧠 Bonus: Custom Callback Example

```ruby
class Order < ApplicationRecord
  before_create :generate_token
  after_commit :send_notification, on: :create
end
```

You can specify `on: :create` or `on: :update` for `after_commit`.

---

## ✅ Summary Table

| Feature         | Callbacks                     | Filters                                          |
| --------------- | ----------------------------- | ------------------------------------------------ |
| Scope           | Models (`ActiveRecord`)       | Controllers (`ActionController`)                 |
| Usage           | Hook into lifecycle events    | Control before/after actions                     |
| Types           | `before_save`, `after_create` | `before_action`, `after_action`, `around_action` |
| Execution Order | Fixed lifecycle chain         | Order of declaration                             |
| Stoppable?      | Yes (`throw :abort`)          | Yes (`head :unauthorized`, `redirect_to`)        |

---

Let me know if you'd like a visual flowchart, or want to create your own custom callback system!
