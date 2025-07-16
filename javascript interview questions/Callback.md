### 🔁 What is a **Callback** in JavaScript?

A **callback** is a function passed as an **argument** to another function — to be **executed later**, often after some kind of task or event completes.

---

### 🧠 Think of it like:

> “When you’re done with that task, **call this function back**.”

---

### ✅ Basic Example:

```javascript
function greet(name, callback) {
  console.log("Hi " + name);
  callback();
}

function sayBye() {
  console.log("Goodbye!");
}

greet("Alice", sayBye);

// Output:
// Hi Alice
// Goodbye!
```

* `sayBye` is a **callback** passed to `greet`.
* It runs **after** the greeting.

---

## 🕒 Common Use Case: Asynchronous Code

### ⏳ Example with `setTimeout` (async delay):

```javascript
console.log("Start");

setTimeout(() => {
  console.log("This runs after 2 seconds");
}, 2000);

console.log("End");
```

### 📦 Using a callback function after an async task:

```javascript
function fetchData(callback) {
  setTimeout(() => {
    console.log("Data fetched");
    callback(); // Call the callback when done
  }, 1000);
}

fetchData(() => {
  console.log("Now processing data...");
});
```

---

## 📂 Types of Callbacks

1. **Synchronous callback** — runs immediately:

   ```javascript
   [1, 2, 3].forEach(function(num) {
     console.log(num); // synchronous
   });
   ```

2. **Asynchronous callback** — runs later:

   ```javascript
   setTimeout(() => {
     console.log("This is async");
   }, 1000);
   ```

---

## ⚠️ Callback Hell

When callbacks are **nested too deeply**, it becomes hard to read and maintain:

```javascript
doTask1(() => {
  doTask2(() => {
    doTask3(() => {
      console.log("All tasks done");
    });
  });
});
```

✅ This problem is solved using **Promises** and **async/await** in modern JavaScript.

---

## 🔑 Summary

| Feature       | Description                                          |
| ------------- | ---------------------------------------------------- |
| Definition    | A function passed as an argument to another function |
| Sync or Async | Can be either synchronous or asynchronous            |
| Use Case      | Event handling, API calls, animations, etc.          |
| Problem       | Can cause "callback hell" if nested too much         |
| Solution      | Use **Promises** or **async/await**                  |

---

Would you like to see how callbacks compare with promises or async/await?
