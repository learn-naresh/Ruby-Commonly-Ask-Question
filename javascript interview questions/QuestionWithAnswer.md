Sure! Here's a **comprehensive list of answers** to the **most commonly asked JavaScript interview questions**, organized by category. This is a great resource for reviewing key concepts quickly.

---

## 🔹 Basic JavaScript Questions

### 1. **What are the different data types in JavaScript?**

* **Primitive types:** `String`, `Number`, `Boolean`, `null`, `undefined`, `Symbol`, `BigInt`
* **Non-primitive types:** `Object`, `Array`, `Function`

---

### 2. **Difference between `var`, `let`, and `const`:**

* `var`: Function-scoped, hoisted, can be redeclared and reassigned.
* `let`: Block-scoped, not hoisted (in practice), can be reassigned but not redeclared in the same scope.
* `const`: Block-scoped, cannot be reassigned or redeclared.

---

### 3. **What is hoisting in JavaScript?**

Hoisting is JavaScript's default behavior of moving declarations to the top of the current scope. Only declarations are hoisted, not initializations.

```js
console.log(x); // undefined
var x = 5;
```

---

### 4. **`==` vs `===`:**

* `==` (loose equality): checks value only, does **type coercion**
* `===` (strict equality): checks **value and type**

```js
'5' == 5   // true
'5' === 5  // false
```

---

### 5. **Truthy and Falsy values:**

* **Falsy values:** `false`, `0`, `''`, `null`, `undefined`, `NaN`
* All other values are **truthy**.

---

### 6. **Difference between `null` and `undefined`:**

* `undefined`: a variable has been declared but not assigned.
* `null`: intentionally assigned to indicate "no value".

---

### 7. **What is a closure?**

A closure is a function that retains access to its lexical scope even after the outer function has finished executing.

```js
function outer() {
  let count = 0;
  return function inner() {
    return ++count;
  };
}
```

---

### 8. **What is scope in JavaScript?**

Scope determines the visibility/accessibility of variables:

* Global Scope
* Function Scope
* Block Scope (with `let` and `const`)

---

### 9. **Event bubbling vs capturing:**

* **Bubbling:** Events propagate from target **up** to the root.
* **Capturing:** Events propagate from root **down** to the target.

```js
element.addEventListener('click', handler, true); // capturing
element.addEventListener('click', handler, false); // bubbling
```

---

### 10. **What are template literals?**

Backtick-quoted strings allowing interpolation:

```js
const name = 'Alice';
console.log(`Hello, ${name}!`);
```

---

## 🔹 Intermediate JavaScript Questions

### 1. **Function Declaration vs Expression:**

* **Declaration** is hoisted:

  ```js
  function add() {}
  ```
* **Expression** is not:

  ```js
  const add = function() {};
  ```

---

### 2. **What is a Promise?**

An object representing the eventual completion or failure of an asynchronous operation.

```js
new Promise((resolve, reject) => {
  resolve('Success');
});
```

---

### 3. **What is the Event Loop?**

The event loop is a mechanism that allows JavaScript to perform non-blocking operations by offloading operations to the browser and executing callbacks from the queue.

---

### 4. **What is a callback function?**

A function passed as an argument to another function to be executed later.

```js
function greet(name, cb) {
  cb(`Hello, ${name}`);
}
```

---

### 5. **Explain `this` keyword:**

* In global scope: `this` refers to `window` (in browsers).
* In a method: refers to the object.
* In a function: depends on how it’s called.
* In arrow functions: lexically scoped (doesn’t bind its own `this`).

---

### 6. **Arrow functions vs regular functions:**

* No `this`, `arguments`, or `super` bindings
* Cannot be used as constructors

---

### 7. **Synchronous vs Asynchronous:**

* **Synchronous**: Code runs line-by-line.
* **Asynchronous**: Code runs independently using callbacks, promises, `async/await`.

---

### 8. **Handling async in JavaScript:**

Using:

* Callbacks
* Promises
* `async/await`

---

### 9. **What are higher-order functions?**

Functions that take other functions as arguments or return functions.

```js
const add = (x) => (y) => x + y;
```

---

### 10. **What is destructuring?**

Unpacking values from arrays/objects:

```js
const [a, b] = [1, 2];
const { name, age } = person;
```

---

## 🔹 Advanced JavaScript Questions

### 1. **`map()`, `filter()`, `reduce()` differences:**

* `map()`: transforms array elements.
* `filter()`: filters elements based on a condition.
* `reduce()`: reduces array to a single value.

---

### 2. **What are generators?**

Functions that can pause and resume execution:

```js
function* gen() {
  yield 1;
  yield 2;
}
```

---

### 3. **Modules (ES6):**

* Exporting:

  ```js
  export const x = 10;
  ```
* Importing:

  ```js
  import { x } from './file.js';
  ```

---

### 4. **Garbage collection:**

JavaScript automatically frees memory that is no longer referenced (via reference-counting or reachability).

---

### 5. **WeakMap vs Map:**

* `WeakMap` keys must be objects and are weakly held (eligible for GC).
* `Map` can have any key and maintains insertion order.

---

### 6. **Debouncing vs Throttling:**

* **Debounce:** wait until user stops triggering the event.
* **Throttle:** limit the number of times a function can run in a time frame.

---

### 7. **Shallow vs Deep Copy:**

* **Shallow copy**: only top-level copied (e.g., `Object.assign`).
* **Deep copy**: all levels are copied (e.g., `JSON.parse(JSON.stringify(obj))`).

---

### 8. **Prototypal inheritance:**

Objects inherit from other objects via the prototype chain.

---

### 9. **`async/await`:**

Syntactic sugar over promises for cleaner asynchronous code.

```js
async function fetchData() {
  const res = await fetch(url);
  return await res.json();
}
```

---

### 10. **`Object.freeze()` vs `Object.seal()`:**

* `freeze()`: makes object immutable (no changes allowed).
* `seal()`: allows modifying existing properties but not adding/removing.

---

## 🔹 DOM & Browser Questions

### 1. **What is the DOM?**

Document Object Model – a tree-like structure representing HTML elements.

---

### 2. **Manipulate the DOM:**

```js
document.getElementById('id').textContent = 'Hello';
```

---

### 3. **`getElementById()` vs `querySelector()`:**

* `getElementById()` – returns element by ID.
* `querySelector()` – returns first match using any CSS selector.

---

### 4. **Event handling:**

```js
element.addEventListener('click', function() {});
```

---

### 5. **Cookies vs localStorage vs sessionStorage:**

| Feature            | Cookie | localStorage          | sessionStorage |
| ------------------ | ------ | --------------------- | -------------- |
| Expiration         | Manual | Never (until cleared) | On tab close   |
| Storage limit      | \~4KB  | \~5MB                 | \~5MB          |
| Accessible from JS | Yes    | Yes                   | Yes            |
| Sent with HTTP     | Yes    | No                    | No             |

---

## 🔹 Bonus: Code Challenge Concepts

### 1. **Reverse a string**

```js
str.split('').reverse().join('');
```

### 2. **Find longest word in a string**

```js
str.split(' ').reduce((longest, word) => word.length > longest.length ? word : longest);
```

### 3. **Check if palindrome**

```js
str === str.split('').reverse().join('');
```

### 4. **Fibonacci**

```js
function fib(n) {
  if (n <= 1) return n;
  return fib(n - 1) + fib(n - 2);
}
```

### 5. **Flatten array**

```js
arr.flat(Infinity);
```

---

Would you like this as a downloadable PDF or formatted study sheet?
