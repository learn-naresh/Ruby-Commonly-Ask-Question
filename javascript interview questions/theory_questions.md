Perfect — I’ll structure the answers in a way that’s **interview-focused**, **clear**, and **easy to revise**, combining **brief explanations with examples**.

---

## ✅ **JavaScript L1 & L2 Interview Answers**

---

### 1. **Pass by Value vs Pass by Reference**

* **Pass by Value**: A *copy* of the value is passed. Changes don’t affect the original.

  ```js
  let a = 10;
  let b = a;
  b++;
  console.log(a); // 10
  ```
* **Pass by Reference**: Reference to the original object is passed.

  ```js
  let obj = { name: "Naresh" };
  let copy = obj;
  copy.name = "John";
  console.log(obj.name); // "John"
  ```

---

### 2. **map vs filter**

* `map()` → Transforms each element and returns a **new array**.
* `filter()` → Returns a **subset** of elements matching a condition.

  ```js
  let arr = [1, 2, 3];
  arr.map(x => x * 2); // [2, 4, 6]
  arr.filter(x => x % 2 === 0); // [2]
  ```

---

### 3. **map() vs forEach()**

* `map()` returns a **new array**.
* `forEach()` just **iterates**, doesn’t return anything.

  ```js
  let a = [1, 2, 3];
  let doubled = a.map(x => x * 2); // [2, 4, 6]
  a.forEach(x => console.log(x)); // prints 1,2,3
  ```

---

### 4. **Pure vs Impure Functions**

* **Pure**: Output depends only on input, no side effects.
* **Impure**: Causes side effects (e.g., changing global variable, console.log).

  ```js
  function pureAdd(a, b) {
    return a + b;
  }

  function impureAdd(a) {
    console.log(a); // Side effect
    return a + Math.random(); // Not deterministic
  }
  ```

---

### 5. **for-in vs for-of**

* `for-in`: Iterates over **keys (indices)**.
* `for-of`: Iterates over **values**.

  ```js
  let arr = ["a", "b"];
  for (let i in arr) console.log(i); // "0", "1"
  for (let v of arr) console.log(v); // "a", "b"
  ```

---

### 6. **call vs apply vs bind**

```js
function greet(greeting) {
  console.log(`${greeting}, ${this.name}`);
}
const person = { name: "Naresh" };
greet.call(person, "Hi");     // Hi, Naresh
greet.apply(person, ["Hello"]); // Hello, Naresh
const fn = greet.bind(person, "Hey");
fn(); // Hey, Naresh
```

---

### 7. **Key ES6 Features**

* `let` & `const`
* Arrow functions `() => {}`
* Template literals `` `Hello ${name}` ``
* Destructuring
* Spread/rest operators `...`
* Classes
* Promises
* Modules (`import`, `export`)

---

### 8. **Spread Operator `...`**

* Used to expand elements.

```js
let arr = [1, 2];
let newArr = [...arr, 3]; // [1,2,3]
```

---

### 9. **Rest Operator `...`**

* Used to collect arguments.

```js
function sum(...args) {
  return args.reduce((a, b) => a + b);
}
```

---

### 10. **DRY, KISS, YAGNI, SOLID**

* **DRY**: Don’t Repeat Yourself
* **KISS**: Keep It Simple, Stupid
* **YAGNI**: You Aren’t Gonna Need It
* **SOLID**: OOP principles like Single Responsibility, Open-Closed, etc.

---

### 11. **Temporal Dead Zone (TDZ)**

* Period between variable **declaration** and **initialization** (with `let`/`const`) where it's **inaccessible**.

```js
console.log(a); // ReferenceError
let a = 10;
```

---

I’ve covered the first **11 questions** in this batch. If this format works for you, I’ll continue with the rest (12 to 55) in similar fashion. Shall I go on?


Awesome! Let’s continue from **Question 12 to 25** in the same clear and concise style:

---

### 12. **Different Ways to Create Objects in JavaScript**

```js
// 1. Object literal
let obj1 = { name: "Naresh" };

// 2. Constructor
let obj2 = new Object();
obj2.name = "Naresh";

// 3. Class
class Person {
  constructor(name) {
    this.name = name;
  }
}
let obj3 = new Person("Naresh");

// 4. Object.create()
let obj4 = Object.create(null);
obj4.name = "Naresh";
```

---

### 13. **Object.keys vs Object.values vs Object.entries**

```js
let obj = { a: 1, b: 2 };
Object.keys(obj);    // ["a", "b"]
Object.values(obj);  // [1, 2]
Object.entries(obj); // [["a", 1], ["b", 2]]
```

---

### 14. **Object.freeze() vs Object.seal()**

* `freeze()`: No add, update, or delete.
* `seal()`: You can update, but not add/delete keys.

```js
let obj = { a: 1 };
Object.freeze(obj); obj.a = 2; // No effect
Object.seal(obj); obj.a = 3;   // Allowed
```

---

### 15. **What is a Polyfill?**

> A piece of code (usually JS) used to **replicate newer features** in **older environments** that don’t support them.
> Example:

```js
if (!Array.prototype.includes) {
  Array.prototype.includes = function(value) {
    return this.indexOf(value) !== -1;
  };
}
```

---

### 16. **What is a Generator Function?**

> A function that can **pause** execution (`yield`) and later **resume**.

```js
function* gen() {
  yield 1;
  yield 2;
}
const it = gen();
it.next(); // { value: 1, done: false }
it.next(); // { value: 2, done: false }
```

---

### 17. **What is Prototype in JavaScript?**

> All JS objects inherit from a prototype. It allows **shared methods/properties**.

```js
function Person(name) {
  this.name = name;
}
Person.prototype.sayHi = function() {
  return `Hi, I’m ${this.name}`;
};
```

---

### 18. **What is IIFE (Immediately Invoked Function Expression)?**

```js
(function () {
  console.log("IIFE runs immediately");
})();
```

> Used to create a **private scope** and **avoid polluting global namespace**.

---

### 19. **What is CORS?**

> Cross-Origin Resource Sharing — **security mechanism** that restricts API access from different domains unless allowed via headers.
> Example:

```http
Access-Control-Allow-Origin: *
```

---

### 20. **Different Data Types in JavaScript**

* **Primitive**: `string`, `number`, `boolean`, `null`, `undefined`, `symbol`, `bigint`
* **Non-Primitive**: `object`, `array`, `function`

---

### 21. **TypeScript vs JavaScript**

| Feature        | JavaScript  | TypeScript        |
| -------------- | ----------- | ----------------- |
| Typing         | Dynamic     | Static (optional) |
| Compilation    | Interpreted | Compiled to JS    |
| Error Checking | Runtime     | Compile-time      |
| Popularity     | Very High   | Growing fast      |

---

### 22. **Authentication vs Authorization**

* **Authentication**: Verifying *who* the user is (e.g., login).
* **Authorization**: What the user is *allowed* to do (e.g., roles/permissions).

---

### 23. **null vs undefined**

* `undefined`: Variable declared but **not assigned**.
* `null`: Explicitly assigned to show **no value**.

```js
let a;
console.log(a); // undefined
let b = null;
console.log(b); // null
```

---

### 24. **Output of `3 + 2 + "7"`**

```js
3 + 2 + "7" = "57"
```

> JS evaluates left to right. First `3+2 = 5`, then `"5" + "7" = "57"`

---

### 25. **slice vs splice**

```js
let arr = [1, 2, 3, 4];
arr.slice(1, 3); // [2, 3] (does NOT modify original)
arr.splice(1, 2); // removes 2 elements from index 1 → arr becomes [1, 4]
```

---

You're doing great! Shall I continue with **26–40** next?

Awesome! Let’s now continue with **Questions 26 to 40**, keeping the same interview-friendly and clear style:

---

### 26. **What is Destructuring?**

> A way to **unpack values** from arrays or properties from objects into variables.

```js
// Array
let [a, b] = [1, 2]; // a = 1, b = 2

// Object
let { name, age } = { name: "Naresh", age: 25 };
```

---

### 27. **What is `setTimeout` in JavaScript?**

> Runs a function **after a delay**.

```js
setTimeout(() => {
  console.log("Runs after 2 seconds");
}, 2000);
```

---

### 28. **What is `setInterval` in JavaScript?**

> Runs a function **repeatedly at fixed intervals**.

```js
let id = setInterval(() => {
  console.log("Repeats every second");
}, 1000);
clearInterval(id); // To stop it
```

---

### 29. **What are Promises in JavaScript?**

> Used for **asynchronous operations**. A Promise is:

* **Pending**
* **Resolved** (`.then`)
* **Rejected** (`.catch`)

```js
let promise = new Promise((resolve, reject) => {
  resolve("Success");
});
promise.then(res => console.log(res)); // "Success"
```

---

### 30. **What is a Call Stack in JavaScript?**

> Stack that keeps track of **function calls**.

```js
function a() {
  b();
}
function b() {
  console.log("Hello");
}
a(); // Stack: a -> b
```

> LIFO structure (Last In, First Out)

---

### 31. **What is a Closure?**

> A function that **remembers the variables** from its outer scope even after the outer function has finished executing.

```js
function outer() {
  let counter = 0;
  return function inner() {
    counter++;
    return counter;
  };
}
const fn = outer();
fn(); // 1
fn(); // 2
```

---

### 32. **What are Callbacks in JavaScript?**

> A function passed as an **argument to another function**, called after some task is done.

```js
function greet(name, callback) {
  callback(`Hello ${name}`);
}
greet("Naresh", msg => console.log(msg));
```

---

### 33. **What are Higher Order Functions?**

> Functions that either:

* Take another function as an argument
* Return a function

```js
function higherOrder(fn) {
  return function () {
    fn();
  };
}
```

---

### 34. **`==` vs `===` in JavaScript**

* `==` → Loose equality (type **coercion**)
* `===` → Strict equality (no type coercion)

```js
1 == "1";  // true
1 === "1"; // false
```

---

### 35. **Is JavaScript Dynamically Typed or Statically Typed?**

> **Dynamically typed**

* Type is determined at runtime.

```js
let a = 10;    // number
a = "hello";   // string (no error)
```

---

### 36. **IndexedDB vs SessionStorage**

| Feature    | IndexedDB               | SessionStorage       |
| ---------- | ----------------------- | -------------------- |
| Data Size  | Large                   | \~5MB                |
| Expiration | Persisted               | Cleared on tab close |
| Structure  | Object store (NoSQL DB) | Key-Value only       |
| Use Case   | Offline web apps        | Per-session storage  |

---

### 37. **What are Interceptors?**

> Interceptors (usually in Axios) are used to **intercept requests/responses** globally.

```js
axios.interceptors.request.use(config => {
  config.headers["Authorization"] = "Bearer token";
  return config;
});
```

---

### 38. **What is Hoisting?**

> JavaScript moves **declarations** to the **top** of scope.

```js
console.log(a); // undefined (not error)
var a = 5;
```

> Only `var` and function declarations are hoisted.

---

### 39. **let vs var vs const**

| Feature   | var             | let       | const     |
| --------- | --------------- | --------- | --------- |
| Scope     | Function        | Block     | Block     |
| Reassign  | Yes             | Yes       | No        |
| Redeclare | Yes             | No        | No        |
| Hoisted   | Yes (undefined) | Yes (TDZ) | Yes (TDZ) |

---

### 40. **Promise.all vs allSettled vs any vs race**

| Method               | Resolves When        | Rejects When    |
| -------------------- | -------------------- | --------------- |
| `Promise.all`        | All promises resolve | Any one rejects |
| `Promise.allSettled` | After all finish     | Never rejects   |
| `Promise.any`        | First resolve        | All reject      |
| `Promise.race`       | First resolve/reject | First settle    |

---

You're crushing this! Want me to finish the **final 41–55** batch next?

Great! Here’s the final batch of **JavaScript L1/L2 interview questions — 41 to 55**:

---

### 41. **Limitations of Arrow Functions**

* No `this`, `arguments`, `super`, or `new.target`
* Can’t be used as constructors (`new`)
* Not suitable for methods in classes/objects if you need dynamic `this`

```js
const obj = {
  value: 42,
  say: () => console.log(this.value) // 'this' is not obj
};
```

---

### 42. **find vs findIndex**

```js
let arr = [1, 2, 3, 4];
arr.find(x => x > 2);      // 3
arr.findIndex(x => x > 2); // 2 (index of 3)
```

---

### 43. **What is Tree Shaking?**

> Removing **dead/unreferenced code** during bundling (e.g., via Webpack + ES6 modules).

```js
// Only used functions are included in final bundle
import { usedFunc, unusedFunc } from './utils.js';
```

---

### 44. **Local Storage vs Session Storage**

| Feature            | LocalStorage           | SessionStorage   |
| ------------------ | ---------------------- | ---------------- |
| Lifespan           | Until manually cleared | Until tab closes |
| Storage limit      | \~5–10MB               | \~5MB            |
| Shared across tabs | Yes                    | No               |

---

### 45. **What is `eval()`?**

> Executes a string of JS code.

```js
eval("console.log(2 + 2)"); // 4
```

⚠️ Avoid using it — **security and performance issues**.

---

### 46. **Shallow Copy vs Deep Copy**

* **Shallow**: Copies only **top-level**.
* **Deep**: Copies **all levels** (nested too).

```js
let a = { name: "Naresh", address: { city: "Delhi" } };
let shallow = { ...a };
let deep = JSON.parse(JSON.stringify(a));
```

---

### 47. **Undeclared vs Undefined**

* **Undeclared**: Not declared anywhere — causes **ReferenceError**.
* **Undefined**: Declared but not assigned.

```js
console.log(a); // ReferenceError
let b;
console.log(b); // undefined
```

---

### 48. **What is Event Bubbling?**

> Event propagates **from child → parent**.

```js
<div onclick="alert('Parent')">
  <button onclick="alert('Child')">Click</button>
</div>
```

Clicking button triggers both alerts unless stopped.

---

### 49. **What is Event Capturing?**

> Event propagates **from parent → child** (opposite of bubbling).

```js
elem.addEventListener('click', fn, true); // third argument true = capturing
```

---

### 50. **What are Cookies?**

> Small key-value pairs stored in the browser, sent to server with every request.

```js
document.cookie = "user=Naresh; expires=Fri, 31 Dec 2025";
```

Used for **auth, preferences**, etc.

---

### 51. **typeof Operator**

```js
typeof "hello"; // "string"
typeof 123;     // "number"
typeof {};      // "object"
typeof undefined; // "undefined"
typeof null;    // "object" ❗ (quirk)
typeof [];      // "object"
```

---

### 52. **What is `this` in JavaScript?**

| Context                  | `this` refers to                  |
| ------------------------ | --------------------------------- |
| In global scope          | Global object (`window`)          |
| In function (non-strict) | Global object                     |
| In method                | The object calling the method     |
| In arrow function        | Inherits `this` from outer scope  |
| In event handler         | The element the event is bound to |

Example:

```js
const obj = {
  name: "Naresh",
  greet() {
    console.log(this.name); // "Naresh"
  }
};
```

---

### 53. **Performance Optimization Techniques**

* Use **throttling/debouncing** for heavy events
* Lazy load images/components
* Minify code (Webpack, etc.)
* Avoid memory leaks
* Use `requestAnimationFrame` for smooth rendering
* Code splitting & tree shaking

---

### 54. **Debouncing vs Throttling**

* **Debounce**: Fires **after delay**, resets if called again within delay
* **Throttle**: Fires at most **once every X ms**

```js
// Debounce
function debounce(fn, delay) {
  let timer;
  return function (...args) {
    clearTimeout(timer);
    timer = setTimeout(() => fn.apply(this, args), delay);
  };
}

// Throttle
function throttle(fn, delay) {
  let last = 0;
  return function (...args) {
    let now = Date.now();
    if (now - last >= delay) {
      last = now;
      fn.apply(this, args);
    }
  };
}
```

---

🔥 **You're all set for your JavaScript L1 & L2 interviews!**
Would you like a **PDF summary**, **flashcard deck**, or a **mock interview round** next?
