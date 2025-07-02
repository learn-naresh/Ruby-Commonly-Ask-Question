Absolutely! Here's a **comprehensive SQL Cheat Sheet** with **syntax**, **pro tips**, and **practice questions** — ideal for interviews and daily development.

---

# ✅ **SQL Cheat Sheet** – Syntax + Tips + Questions

---

## 🧱 Basic SQL Syntax

### ▶️ SELECT

```sql
SELECT column1, column2 FROM table;
SELECT * FROM table;
```

### ▶️ WHERE

```sql
SELECT * FROM users WHERE age > 25 AND city = 'Delhi';
```

### ▶️ DISTINCT

```sql
SELECT DISTINCT country FROM users;
```

### ▶️ ORDER BY

```sql
SELECT * FROM users ORDER BY age DESC;
```

### ▶️ LIMIT / OFFSET

```sql
SELECT * FROM users LIMIT 10 OFFSET 5;
```

---

## 🧮 Aggregates + GROUP BY

```sql
SELECT department, COUNT(*) AS total
FROM employees
GROUP BY department;
```

### 🔢 Functions:

* `COUNT(column)`
* `SUM(column)`
* `AVG(column)`
* `MIN(column)`
* `MAX(column)`

---

## 🔗 Joins

### ▶️ INNER JOIN

```sql
SELECT users.name, orders.amount
FROM users
INNER JOIN orders ON users.id = orders.user_id;
```

### ▶️ LEFT JOIN

```sql
SELECT users.name, orders.amount
FROM users
LEFT JOIN orders ON users.id = orders.user_id;
```

### ▶️ SELF JOIN

```sql
SELECT a.name, b.name AS manager_name
FROM employees a
JOIN employees b ON a.manager_id = b.id;
```

---

## 🔍 Filtering with NULL

```sql
SELECT * FROM users WHERE email IS NULL;
SELECT * FROM users WHERE phone IS NOT NULL;
```

---

## 🔄 Subqueries

```sql
SELECT name
FROM users
WHERE id IN (
  SELECT user_id FROM orders WHERE total > 500
);
```

---

## 📦 Case Statements (If/Else)

```sql
SELECT name,
  CASE
    WHEN age < 18 THEN 'Minor'
    WHEN age >= 18 THEN 'Adult'
    ELSE 'Unknown'
  END AS status
FROM users;
```

---

## 🧰 Useful SQL Functions

| Function       | Purpose                                  |
| -------------- | ---------------------------------------- |
| `COALESCE()`   | Replaces NULLs                           |
| `NOW()`        | Current timestamp                        |
| `DATE()`       | Extract date from timestamp              |
| `DATEDIFF()`   | Days between two dates (MySQL)           |
| `ROW_NUMBER()` | Assign row numbers (PostgreSQL/MySQL 8+) |

---

## 🚨 Common Interview SQL Questions

1. **Find the second highest salary:**

```sql
SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);
```

2. **Find duplicate emails:**

```sql
SELECT email, COUNT(*) FROM users
GROUP BY email HAVING COUNT(*) > 1;
```

3. **Delete duplicate rows (keep one):**

```sql
DELETE FROM users
WHERE id NOT IN (
  SELECT id FROM (
    SELECT MIN(id) as id FROM users GROUP BY email
  ) AS temp
);
```

4. **Get users who never placed an order:**

```sql
SELECT u.name
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE o.id IS NULL;
```

5. **Find top 3 earning departments:**

```sql
SELECT department, SUM(salary) AS total
FROM employees
GROUP BY department
ORDER BY total DESC
LIMIT 3;
```

---

## ⚡ Pro Tips

| Tip                                                        | Why It Matters |
| ---------------------------------------------------------- | -------------- |
| `LEFT JOIN` > `INNER JOIN` when you want unmatched records |                |
| Always use `IS NULL` (never `= NULL`)                      |                |
| Use `LIMIT` while testing queries to avoid huge results    |                |
| `COALESCE(column, 'default')` for safe NULL handling       |                |
| Avoid `SELECT *` in production — be explicit               |                |
| Use indexes on columns in `JOIN`, `WHERE`, `ORDER BY`      |                |

---

## 📘 Bonus: Mini Practice Set

1. Get all users who registered in the last 7 days.
2. Find the most recent order per user.
3. Show category-wise product count.
4. Get the average salary per department.
5. List users who placed more than 2 orders.

---

Would you like this as a downloadable PDF or markdown file? I can also create a visual version if you want a printable format.
