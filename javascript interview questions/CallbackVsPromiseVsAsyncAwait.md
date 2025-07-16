Great! Let's compare **callbacks**, **promises**, and **async/await** — all are used for **handling asynchronous code** in JavaScript.

---

## 🔁 1. **Callback** (Old Style)

A function is passed to handle results **after an async operation**.

```javascript
function getData(callback) {
  setTimeout(() => {
    callback("Data from server");
  }, 1000);
}

getData((data) => {
  console.log(data); // "Data from server"
});
```

### ⚠️ Problem: **Callback Hell**

```javascript
login(user => {
  getUserData(user, data => {
    processData(data, result => {
      console.log(result);
    });
  });
});
```

> 🧠 Difficult to read and debug.

---

## ✅ 2. **Promises** (Better Syntax & Error Handling)

A `Promise` represents a value that will be **available in the future**.

```javascript
function getData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("Data from server");
    }, 1000);
  });
}

getData().then(data => {
  console.log(data); // "Data from server"
}).catch(error => {
  console.error(error);
});
```

### ✅ Cleaner than callbacks

But chaining too many `.then()` calls can still get messy.

---

## ✨ 3. **async/await** (Best: Looks Like Synchronous Code)

Built on top of promises, but **easier to read & write**.

```javascript
function getData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("Data from server");
    }, 1000);
  });
}

async function fetchData() {
  try {
    const data = await getData();
    console.log(data); // "Data from server"
  } catch (error) {
    console.error(error);
  }
}

fetchData();
```

### ✅ Benefits:

* Clean syntax
* Easier error handling using `try...catch`
* Looks synchronous, but is async

---

## 🔍 Comparison Table

| Feature        | Callback               | Promise            | async/await              |
| -------------- | ---------------------- | ------------------ | ------------------------ |
| Syntax         | Nested functions       | `.then()` chaining | `await` with `try/catch` |
| Readability    | 😖 Low (Callback Hell) | 🙂 Medium          | 😃 High (Clean syntax)   |
| Error Handling | Must handle manually   | `.catch()`         | `try...catch`            |
| Debugging      | Hard                   | Easier             | Easier                   |
| Modern Usage   | ❌ Avoid if possible    | ✅ Preferred        | ✅ Best                   |

---

## 💡 Final Tip

* Use **callbacks** only when dealing with **simple or legacy APIs**.
* Prefer **Promises** and **async/await** for clean, maintainable async code.

---

Would you like a small project example that uses all three to compare them in action?
