Absolutely! Here’s a complete guide to **all types of ActiveRecord associations** in Ruby on Rails with examples:

---

## 🔗 **1. `belongs_to`**

### ✅ Description:

Indicates that this model holds the foreign key of another model.

### ✅ Example:

```ruby
class Post < ApplicationRecord
  belongs_to :user
end

class User < ApplicationRecord
  has_many :posts
end
```

📌 This means: each `Post` belongs to a `User`.

---

## 🔗 **2. `has_many`**

### ✅ Description:

Says that one model can have multiple records of another model.

### ✅ Example:

```ruby
class User < ApplicationRecord
  has_many :posts
end

class Post < ApplicationRecord
  belongs_to :user
end
```

📌 A `User` can have many `Posts`.

---

## 🔗 **3. `has_one`**

### ✅ Description:

Says that one model has **exactly one** associated model.

### ✅ Example:

```ruby
class User < ApplicationRecord
  has_one :profile
end

class Profile < ApplicationRecord
  belongs_to :user
end
```

📌 A `User` has one `Profile`.

---

## 🔗 **4. `has_many :through`**

### ✅ Description:

Sets up a many-to-many connection with another model **through a join model**.

### ✅ Example:

```ruby
class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
end

class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
end
```

📌 A `Doctor` has many `Patients` through `Appointments`.

---

## 🔗 **5. `has_one :through`**

### ✅ Description:

Same as `has_many :through`, but only returns **one record**.

### ✅ Example:

```ruby
class Supplier < ApplicationRecord
  has_one :account
  has_one :account_history, through: :account
end

class Account < ApplicationRecord
  belongs_to :supplier
  has_one :account_history
end

class AccountHistory < ApplicationRecord
  belongs_to :account
end
```

📌 A `Supplier` has one `AccountHistory` through its `Account`.

---

## 🔗 **6. `has_and_belongs_to_many` (HABTM)**

### ✅ Description:

Creates a **direct many-to-many** relationship **without a model** in between.

### ✅ Example:

#### Migration:

```ruby
create_table :books_users, id: false do |t|
  t.belongs_to :book
  t.belongs_to :user
end
```

#### Models:

```ruby
class Book < ApplicationRecord
  has_and_belongs_to_many :users
end

class User < ApplicationRecord
  has_and_belongs_to_many :books
end
```

📌 A `User` can have many `Books`, and a `Book` can belong to many `Users`.

---

## 🔗 **7. Self-referential Association**

### ✅ Description:

Model refers to itself for hierarchy or network relationships.

### ✅ Example:

```ruby
class Employee < ApplicationRecord
  belongs_to :manager, class_name: "Employee", optional: true
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
end
```

📌 An `Employee` can have a manager who is also an `Employee`.

---

## 🔗 **Bonus: Polymorphic Association**

### ✅ Description:

Allows a model to belong to more than one other model using a single association.

### ✅ Example:

```ruby
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end

class Post < ApplicationRecord
  has_many :comments, as: :commentable
end

class Photo < ApplicationRecord
  has_many :comments, as: :commentable
end
```

📌 A `Comment` can belong to either a `Post` or a `Photo`.

---

## 🔁 Summary Table

| Association Type          | Description                     | Example                                             |
| ------------------------- | ------------------------------- | --------------------------------------------------- |
| `belongs_to`              | Model holds foreign key         | `Post belongs_to :user`                             |
| `has_many`                | One-to-many                     | `User has_many :posts`                              |
| `has_one`                 | One-to-one                      | `User has_one :profile`                             |
| `has_many :through`       | Many-to-many through join model | `Doctor has_many :patients through appointments`    |
| `has_one :through`        | One-to-one through join model   | `Supplier has_one :account_history through account` |
| `has_and_belongs_to_many` | Direct many-to-many             | `Book has_and_belongs_to_many :users`               |
| Self-referential          | Belongs to same model           | `Employee belongs_to :manager`                      |
| Polymorphic               | Belongs to multiple model types | `Comment belongs_to :commentable`                   |

---

Let me know if you'd like a `.pdf`, `.md`, or code examples in a GitHub repo.
