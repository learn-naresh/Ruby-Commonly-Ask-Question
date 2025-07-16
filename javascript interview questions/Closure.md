### 🔒 What Are **Closures** in JavaScript?

A **closure** is a feature in JavaScript where an **inner function** has access to the **variables of its outer (enclosing) function** — even after the outer function has finished executing.

---

### 📦 A Closure "Remembers" Its Surroundings

Here's a basic example:

```javascript
function outer() {
  let count = 0;

  return function inner() {
    count++;
    console.log(count);
  };
}

const counter = outer(); // outer() runs and returns inner()
counter(); // 1
counter(); // 2
counter(); // 3
```

✅ **Explanation:**

* `inner()` is a **closure**.
* It **remembers** `count` even after `outer()` has finished running.
* Every time `counter()` is called, it updates and accesses the same `count` value — that's the closure at work.

---

### 🔁 Closures in Loops (Common Use Case)

```javascript
for (var i = 0; i < 3; i++) {
  setTimeout(function() {
    console.log(i);
  }, 1000);
}
// Prints: 3, 3, 3 ❌ (because `var` doesn't create a closure per iteration)
```

Fix it with `let` (which creates a new binding each loop):

```javascript
for (let i = 0; i < 3; i++) {
  setTimeout(function() {
    console.log(i);
  }, 1000);
}
// Prints: 0, 1, 2 ✅
```

---

### 🧠 Why Closures Matter

* **Private Variables**: Create variables that can’t be accessed directly.
* **Callbacks and Event Handlers**: Closures let you keep access to variables.
* **Functional Programming**: Helps with currying, partial application, etc.

---

### 🔐 Real-World Example: Private Counter

```javascript
function createCounter() {
  let count = 0;

  return {
    increment: () => ++count,
    decrement: () => --count,
    getCount: () => count
  };
}

const myCounter = createCounter();
console.log(myCounter.increment()); // 1
console.log(myCounter.increment()); // 2
console.log(myCounter.getCount());  // 2
```

➡️ `count` is **private** — only accessible through the returned methods, thanks to closures.

---

Would you like a diagram or visual explanation of how closures work under the hood?
