[7:37 pm, 26/4/2025] ...: 

Post.joins(:user).where(users: { name: "John" })
remember this


[7:38 pm, 26/4/2025] ...:


⚡ In short:
joins = fast, efficient SQL JOIN.

includes = fetch related objects fully.

left_outer_joins = fetch all, even if no relation.

Always be careful with table names in where.


[7:39 pm, 26/4/2025] ...: 


1. What is the difference between joins and includes?
joins:
→ Creates SQL JOIN.
→ Does not load associated objects into memory.

includes:
→ Runs extra queries (sometimes uses JOIN under the hood).
→ Eager loads associated objects.



[7:39 pm, 26/4/2025] ...:

Lets say you have an Employee model:

class Employee < ApplicationRecord
  belongs_to :manager, class_name: "Employee", optional: true
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
end

And your table (employees) would have a manager_id column to store the reference.

So now:

An employee can belong to another employee as their manager

boss = Employee.create(name: "Big Boss")
employee = Employee.create(name: "Worker Bee", manager: boss)

boss.subordinates # => [#<Employee id: ..., name: "Worker Bee", manager_id: ...>]
employee.manager  # => #<Employee id: ..., name: "Big Boss", manager_id: nil>


[7:42 pm, 26/4/2025] ...: 

🌟 What is includes in Rails?

includes is used for Eager Loading.

It loads associated records to avoid N+1 query problem.

Rails automatically decides whether to use JOIN or two queries based on what you ask.

🎯 Real-world Example
Suppose you have two models:


class User < ApplicationRecord
  has_many :posts
end

class Post < ApplicationRecord
  belongs_to :user
end
🚨 N+1 Problem (Without includes)
If you do:


users = User.all

users.each do |user|
  puts user.posts.count
end
🔴 Rails will first load all users.
Then for each user, Rails will run a separate SQL query to fetch their posts!

This is bad if you have 100 users — you will have 101 queries! 😱

✅ Using includes to fix it

users = User.includes(:posts)

users.each do |user|
  puts user.posts.count
end
Now what happens:

Rails runs one query to get all users.

Rails runs one query to get all posts for all users.

No more extra queries!

🛠 Example Code:

users = User.includes(:posts)

users.each do |user|
  puts "User: #{user.name}"
  user.posts.each do |post|
    puts "  - #{post.title}"
  end
end
Generated SQL:

SELECT * FROM users;
SELECT * FROM posts WHERE posts.user_id IN (1, 2, 3, 4);
✅ Only 2 queries no matter how many users!

🤔 Difference between joins and includes

joins                                                       	includes
Just join tables.                             	    Fetch related records separately.
Does not load associated objects automatically.	    Loads associated objects into memory.
Faster for simple matching.	                        Better for accessing associated objects without extra queries.



Employee second highest salary:- 

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
OFFSET 1 LIMIT 1;


Employee.select(:salary).distinct.order(salary: :desc).offset(1).limit(1)


Employees whose salary is higher than their managers salary.

SELECT employees.*
FROM employees
INNER JOIN employees AS m ON employees.manager_id = m.id
WHERE employees.salary > m.salary;


Employee.joins(:manager).where('employees.salary > managers_employees.salary')