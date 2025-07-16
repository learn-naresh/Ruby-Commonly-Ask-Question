### 🔄 What is the **Event Loop** in JavaScript?

The **Event Loop** is a key part of JavaScript's **concurrency model**. It allows JavaScript — a single-threaded language — to handle **asynchronous operations** (like timers, API calls, or user interactions) **without blocking** the main thread.

---

## 🧠 Simply put:

> The **event loop** continuously checks the **call stack** and **task queue** — and moves tasks from the queue to the stack when the stack is empty.

---

## 📦 Core Components

### 1. **Call Stack**

Where functions are executed — one at a time (LIFO: last in, first out).

### 2. **Web APIs / Browser APIs**

Provided by the browser for async tasks like `setTimeout`, `DOM events`, `fetch`, etc.

### 3. **Callback Queue (Task Queue)**

Where async callbacks wait once the Web API finishes its job.

### 4. **Event Loop**

Keeps checking:
👉 "Is the **call stack empty**? If yes, move the **first callback** from the task queue into the call stack and run it."

---

## 🔁 Example Step-by-Step

```javascript
console.log("Start");

setTimeout(() => {
  console.log("Inside timeout");
}, 0);

console.log("End");
```

### ✅ Output:

```
Start
End
Inside timeout
```

### ⚙️ What happened:

1. `"Start"` is logged.
2. `setTimeout` registers a callback with the **Web API**.
3. `"End"` is logged next.
4. After 0ms, the timeout callback moves to the **callback queue**.
5. Once the **call stack is empty**, the **event loop** pushes the callback onto the call stack.
6. `"Inside timeout"` is finally logged.

---

## 🧬 Visual Flow

```
Call Stack        Web APIs           Callback Queue
----------        ----------         ---------------
console.log()  →                    →
setTimeout()   →   (waits 0ms)   →  →  callback() →
console.log()  →                    →

Event Loop: keeps checking ⟳
```

---

## 💡 Important Notes

* **JavaScript is single-threaded** — only one task runs at a time.
* The **event loop** enables non-blocking behavior by deferring tasks to be handled **later**, once the stack is free.
* `setTimeout(fn, 0)` does **not** mean it runs immediately — it waits until the stack is clear.

---

## 🧪 Bonus: Microtasks vs Macrotasks

* **Microtasks**: Promises, `queueMicrotask`
* **Macrotasks**: `setTimeout`, `setInterval`, DOM events

🔄 Microtasks run **before** macrotasks in the queue.

```javascript
console.log("A");

Promise.resolve().then(() => console.log("B"));

setTimeout(() => console.log("C"), 0);

console.log("D");
```

### Output:

```
A
D
B
C
```

---

## ✅ Summary

| Concept        | Description                                 |
| -------------- | ------------------------------------------- |
| Call Stack     | Where JS runs your code line-by-line        |
| Web APIs       | Browser-provided features for async work    |
| Callback Queue | Where completed async tasks wait            |
| Event Loop     | Moves tasks from queue to stack when ready  |
| Async Model    | Enables non-blocking behavior in JavaScript |

---

Would you like an animated or interactive demo link to see this in action visually?
