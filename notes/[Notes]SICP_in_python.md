### SICP in Python
---

Adapted from Berkley [SICP in Python](http://www.composingprograms.com/)

[The Python3 Standard Library](https://docs.python.org/3/library/index.html)

[Key differences between Python 2 and 3](http://sebastianraschka.com/Articles/2014_python_2_3_key_diff.html)

[Dive into Python 3](http://getpython3.com/diveintopython3/index.html)

#### Chap1. Abstractions and functions
---

* With multiple assignment, all expressions to the right of = are evaluated before any names to the left are bound to those values:

```
    y, x = x, y # swapping numbers
```

* There are differences between `evaluate` and `execute`: evaluate is a procedure returns values (like function calls). Execute is like assignment, it changes something.

* Two types of functions: pure and non-pure. Pure functions have input and return output (they don't change anything, and any call of a pure function results in consistent results). Non-pure functions make some change to the state of the interpreter or computer (like `print` returns **None**). Pure functions are essential for writing concurrent programs, in which multiple call expressions may be evaluated simultaneously.

* Numbers and arithmetic operations are primitive built-in data values and functions.
  * Nested function application provides a means of combining operations.
  * `Binding` names to values provides a limited means of abstraction.
  * `Environment` is a piece of memory that keeps track of the names, values, and bindings

* There is a difference between `intrinsic name` and `bound name`: different bound names may refer to the same function, but that function itself has only one intrinsic name. The intrinsic name of a function does not play a role in evaluation.  A description of the formal parameters of a function is called the function's `signature`.

* An `environment` in which an expression is evaluated consists of a sequence of `frames`. Each ` frame` contains *bindings*, each of which associates a name with its corresponding value. There is a single *global* frame. Assignment and import statements *add entries* to the first frame of the current environment.  A new local frame is introduced *every time* a function is called.

* Python functions are not evaluated until they get executed.

* **Name Evaluation.** A name evaluates to the value bound to that name in the earliest frame of the current environment in which that name is found.

* Define your function helper info using:

  * ```
    my_func(args):
    	"""
    	info
    	"""
    # use help(my_func) to investigate it	
    ```

* Each `statement` describes some change to the interpreter state, and executing a statement applies that change. **They have no value**.  `statement` are `executed`.  `expression`, however, don't make any changes, and **they can be evaluated to values**, but can still be executed as statement (changes are discarded, e.g., `mult(1,2)`).

* A clause:

  * ```
    <header>:
        <statement>
        <statement>
        ...
    ## header determines when and if to execute statements
    ```



* Recursive execution:

  * > To execute a sequence of statements, execute the first statement. If that statement does not redirect control, then proceed to execute the rest of the sequence of statements, if any remain

* `a,b=b,a`: evaluate RHS first, then do binding

* Python `assert`:` assert boolean_exp, 'Output if boolean_exp evaluates to false`

* A test that applies a single function is called a `*unit test*`. Exhaustive unit testing is a hallmark of good program design.

* Python `docstring`: [Python docstring](https://www.python.org/dev/peps/pep-0257/)

* Function pointers in cpp are not strictly functors (higher order functions), but `closure`s are. Thus, locally defined functions are often called *closures*, i.e., they "enclose" information (from their parents).

* This discipline of sharing names among nested definitions is called *lexical scoping*.

* All Python functions have a closure attribute.

* Python closure:[Stackoverflow](http://stackoverflow.com/a/20898085)

* Return functions, example on Newton iteration:


*   ```
    def newton_update(f, df):
            def update(x):
                return x - f(x) / df(x)
            return update
    ```

* *Currying*: transfer a function that takes several arguments to  that only takes one. i.e., `f(x,y,z) = curr_f(x)(y)(z)`. Example:


*   ```
    def curried_pow(x):
            def h(y):
                return pow(x, y) # x is enclosed, so can be used directly
            return h
            
    def curry2(f):
            """Return a curried version of the given two-argument function."""
            def g(x):
                def h(y):
                    return f(x, y)
                return h
            return g
            
    def uncurry2(g):
            """Return a two-argument version of the given curried function."""
            def f(x, y):
                return g(x)(y)
            return f
    ```

* A `lambda expression` evaluates to a function that has a single return expression as its body. Assignment and control statements are not allowed. `lambda x:f(x)` returns a function that takes `x` and returns `f(x)`

* First class elements ( they have less restrictions, in Python, function is also first class):


* They may be bound to names.
  * They may be passed as arguments to functions.
  * They may be returned as the results of functions.
  * They may be included in data structures.

* Function decorator: apply higher-order functions as part of executing a `def` statement

* Common recursions: single recursion, mutual recursion, tree recursion (return rec(n) + rec(n-1))






---

#### Chap2. Abstractions

######Abstractions and sequences

* Native data type:
  * There are expressions that evaluate to values of native types, called *literals*.
  * There are built-in functions and operators to manipulate values of native types.

* Python native numeric types: *int*, *float*, *complex* (a+bj)

* *float* are **not** exact values, they are just approximation. [Floating point standard --IEEE754](native numeric types). (Note: int/int is *always* float)

* A *sequence* (like `list`, `range`, `str`) is an **ordered** collection of values. Addition and multiplication of a sequence are concatenation and repetition.

* Bind multiple names in `for`:*sequence unpacking*

  * ```
    for x, y in pairs:
      if x == y:
        same_count = same_count + 1
    ```

* (Convention) Use `_` for variables loop through a `for` statement if it is unused. `for _ in my_list`

* Range: `range(a,b)` = [a,...,b-1]

* List comprehension:`[<map expression> for <name> in <sequence expression> if <filter expression>]`.

  * >To evaluate a list comprehension, Python evaluates the `<sequence expression>`, which must return an iterable value. Then, for each element in order, the element value is bound to `<name>`, the filter expression is evaluated, and if it yields a true value, the map expression is evaluated. The values of the map expression are collected into a list.

* Sequence  aggregation: aggregate all values in a sequence into a single value (like `min`,`max`)

* Sequence membership: `in` and `not in`

* Sequence slicing: `[a:b]`

* `str`:

  * A character is an `str` of length 1.
  * Membership: `'here' in "Where's Waldo?"` returns `true`

* *Closure*: a method for combining data values has a closure property if the result of combination can itself be combined using the same method. 


###### Mutable data

* *Objects* are both information and processes, bundled together to represent the properties, interactions, and behaviors of complex things. *All values in Python are objects.*
* `is` to test identity. Two objects may `==` (equality of contents) but may not `is`
* *Tuples* are used implicitly in multiple assignment. An assignment of two values to two names creates a two-element tuple and then unpacks it.
* List/dict comprehension creates new list/dict.
* Difference between `global` and `nonlocal`:[stackoverflow](http://stackoverflow.com/questions/1261875/python-nonlocal-statement), or [PEP3104](https://www.python.org/dev/peps/pep-3104/)
* Only function calls can introduce new frames. Assignment statements always change bindings in existing frames.
* An expression that contains only pure function calls is *referentially transparent*; its value does not change if we substitute one of its subexpression with the value of that subexpression.

###### Object-Oriented

* Class constructor: `__init__`, `self` point to the instance

* Every instance of a class is unique. `=` only sets reference/pointer, but **doesn't** copy instances

* To allow class accepts string as attribute (members, methods), use `getattr(class,'attr')` (equals to `class.attr`)

* As an attribute of a class, a method is just a function, but as an attribute of an instance, it is a bound (bind `self`) method.

* Class attributes (defined just before `class`) are shared among **all** instances; however, instance attributes (defined in constructors `__init__`) are independent

* Instance attributes are invoked before class attributes (subclass before superclass)

* ```
  instance.attri = something # affects instance locally, even if it is a class attribute
  classname.attri = something # affects class (across all instances)
  ```


* *Favor `self.class_attr` instead of `subclass.class_attr` in case if this class is inherited by some subclasses*

* Python supports multiple inheritance: `class sub_class(superA, superB)`

* Diamond inheritance: query:`[c.__name__ for c in AsSeenOnTVAccount.mro()]`, algorithm: [C3](http://python-history.blogspot.ca/2010/06/method-resolution-order.html)

* > Comments on OO:
  >
  > Object-oriented programming is particularly well-suited to programs that model systems that have separate but interacting parts. For instance, different users interact in a social network, different characters interact in a game, and different shapes interact in a physical simulation. When representing such systems, the objects in a program often map naturally onto objects in the system being modeled, and classes represent their types and relationships.
  >
  > On the other hand, classes may not provide the best mechanism for implementing certain abstractions. Functional abstractions provide a more natural metaphor for representing relationships between inputs and outputs. One should not feel compelled to fit every bit of logic in a program within a class, especially when defining independent functions for manipulating data is more natural. Functions can also enforce a separation of concerns.
  >
  > Multi-paradigm languages such as Python allow programmers to match organizational paradigms to appropriate problems. Learning to identify when to introduce a new class, as opposed to a new function, in order to simplify or modularize a program, is an important design skill in software engineering that deserves careful attention.


######  Object abstraction and generic functions

* The `repr` function (method `__repr__()` on an object) returns a Python expression that evaluates to an equal object, but `str` (`__str__()`) produces a more human-readable representation

* Special names for an object:

  * `__bool__` (example:`Account.__bool__ = lambda self: self.balance != 0`). `__bool__` is evoked while applying `if` on this object
  * `__getitem__` invoked when using element selection. (`something[n]==something.__getitem__(n)`)
  * `__call__` invoked upon invoking this object as a function
  * This can also be used as "operator overloading" (e.g., `+` equals `__add__`)
  * More on special names:[Dive into python3](http://getpython3.com/diveintopython3/special-method-names.html)

* Use  the `@property` decorator to compute attributes on the fly from zero-argument functions.

  * e.g.

    ```
    from math import atan2
    >>> class ComplexRI(Complex):
            def __init__(self, real, imag):
                self.real = real
                self.imag = imag
            @property
            def magnitude(self):
                return (self.real ** 2 + self.imag ** 2) ** 0.5
            @property
            def angle(self):
                return atan2(self.imag, self.real)
            def __repr__(self):
                return 'ComplexRI({0:g}, {1:g})'.format(self.real, self.imag)
    ```

* Two ways to relate different types of object together: coercion (set one type to another); type dispatch (explicit "operator overloading")

* Efficiency (cache technique for tree recursive):

  * ```
    def memo(f): # f for computing fib numbers
        cache = {}
        def memoized(n):
            if n not in cache:
                cache[n] = f(n)
            return cache[n]
        return memoized
    ```


###### Recursive objects

* Dict,list,set,tuple ([this](https://en.wikiversity.org/wiki/Python_Programming/Tuples_and_Sets)):
  * Lists and tuples maintain order. Dictionaries and sets are unordered.
  * List, set and dictionary items are mutable. Tuple items are immutable (set can be changed using `add`, `remove`, `discard`, and `pop`).
  * Lists and tuples allow duplication. Dictionary and set items are unique.
  * List and tuple items may be accessed by index. Dictionary items are accessed by key. Set items cannot be accessed by index.
  * Built-in Python sets cannot contain mutable data types, such as lists, dictionaries, or other sets. (see ``frozenset` for nested set)

#### Chap3.Interpreting Computer Programs

###### Functional programming

* Many interpreters have an elegant common structure: two mutually recursive functions. The first evaluates expressions in environments; the second applies functions to arguments.


* A quick bite on Scheme
  * Expression: `(quotient 10 2)`
  * Definition: `(define pi 3.14)`
  * Procedure (function): `(define (<name> <formal parameters>) <body>)`
  * Lambda exp (anonymous function): `(lambda (<formal-parameters>) <body>)`
  * Pairs: `(define x (cons 1 2))`, use `car/cdr` to retrieve
  * Value: `x`, quotation of `x`: `'x`

###### Exceptions

```
try:
    <try suite>
except <exception class ex> as <name>: 
# handles all exceptions derived from ex raised in try
    <except suite>
```

User defined exception, example:

```
class IterImproveError(Exception):
        def __init__(self, last_guess):
            self.last_guess = last_guess
def improve(update, done, guess=1, max_updates=1000):
        k = 0
        try:
            while not done(guess) and k < max_updates:
                guess = update(guess)
                k = k + 1
            return guess
        except ValueError:
            raise IterImproveError(guess)
            
def find_zero(f, guess=1):
        def done(x):
            return f(x) == 0
        try:
            return improve(newton_update(f), done, guess)
        except IterImproveError as e:
            return e.last_guess                     
#main 
find_zero(lambda x: 2*x*x + sqrt(x))
```

###### Interpreter

* An **interpreter** for a programming language is a function that, when applied to an expression of the language, performs the actions required to evaluate that expression.
* **Parsing** is the process of generating expression trees from raw text input. A **parser** is a composition of two components: a lexical analyzer and a syntactic analyzer.
* First, the *lexical analyzer* partitions the input string into **tokens**, which are the minimal syntactic units of the language such as names and symbols. Second, the *syntactic analyzer* constructs an expression tree from this sequence of tokens. The expression tree is processed by evaluation
* Explicit evaluate: `eval` and `exec`

#### Chap4. Data processing

###### Implicit sequences and iterators

* Implicit sequences have elements computed on demand (not pre-computed and stored)

* An *iterator* is an object that provides sequential access to an underlying sequential dataset.It has two components: the ability to retrieve the next element and the ability to justify if no further elements remain

* Python iterator uses `__next__` to progress. It throws `StopIteration` while reaching the end.

* Iterators are mutable, they track where they are.

  ​	

  ```
  # An iterator example:
  class LetterIter:
          """An iterator over letters of the alphabet in ASCII order."""
          def __init__(self, start='a', end='e'):
              self.next_letter = start
              self.end = end
          def __next__(self):
              if self.next_letter == self.end:
                  raise StopIteration
              letter = self.next_letter # note: this comes first so it can return the very first element
              self.next_letter = chr(ord(letter)+1)
              return letter
  ```


* An object is iterable if it returns an iterator when its `__iter__` method (or call `iter()` on it) is invoked.

  ```
  # For example, map function is iterable:
  caps = map(lambda x: x.upper(), some_letter_set)
  # other examples including filter, zip, and reversed function
  ```

* The `for` statement in Python operates on iterators. 

  ```
  for <name> in <expression>:
      <suite>
  # expression returns an iterator. Python progess on by calling __iter__ (until raising StopIteration), which returns an iterator and then binds it to name, then suite gets executed
  ```

  * The `for` loop equals:

    ```
    item = expression.__iter__()
    try:
        while True:
            item = items.__next__()
            suite
        except StopIteration:
            pass
    ```

* Python docs suggest that an iterator have an `__iter__` method that returns the iterator itself, so that all iterators are iterable.

* A *generator* is an iterator returned by a special class of function called a *generator function*. Generator functions are distinguished from regular functions in that rather than containing `return` statements in their body, they use `yield` statement to return elements of a series.

  ```
  # example:
  def letters_generator():
      current = 'a'
      while current <= 'd':
          yield current
          current = chr(ord(current)+1)
          
  for letter in letters_generator(): # expression in for loop returns iterators, this calls __next__ (not explicitly defined) in generator repeatedly
          print(letter)
  ```

* A generator object (which is essentially an iterator) has `__iter__` and `__next__` methods, and each call to `__next__` continues execution of the generator function from wherever it left off previously until another `yield` statement is executed.

  ```
  # example on yield
  def all_pairs(s):
          for item1 in s:
              for item2 in s:
                  yield (item1, item2)
  #list(all_pairs([1, 2, 3])) produces
  #[(1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3)]
  ```



* A *stream* is a lazily computed linked list. 

  ```
  # example on stream
  class Stream:
          """A lazily computed linked list."""
          class empty:
              def __repr__(self):
                  return 'Stream.empty'
          empty = empty()
          def __init__(self, first, compute_rest=lambda: empty):
              assert callable(compute_rest), 'compute_rest must be callable.'
              self.first = first
              self._compute_rest = compute_rest
          @property
          def rest(self):
              """Return the rest of the stream, computing it if necessary."""
              if self._compute_rest is not None:
                  self._rest = self._compute_rest()
                  self._compute_rest = None
              return self._rest
          def __repr__(self):
              return 'Stream({0}, <...>)'.format(repr(self.first))
  ```

* Streams contrast with iterators in that they can be passed to pure functions multiple times and yield the same result each time. Streams provide a simple, functional, recursive data structure that implements lazy evaluation through the use of higher-order functions.

###### Declarative programming  and logic programming

* [Interpreting SQL using python](http://composingprograms.com/pages/43-declarative-programming.html)
* [Logic programming](http://composingprograms.com/pages/44-logic-programming.html)

###### Unification

* The fundamental operation performed by the query interpreter is called *unification*. Unification is a general method of matching a query to a fact, each of which may contain variables. 

* Unification is a generalization of pattern matching that attempts to find a mapping between two expressions that may both contain variables.

  ​


###### Distributed and parallel computing

* TCP handshake:
  * `A` sends a request to a *port* of `B` to establish a TCP connection, providing a *port number* to which to send the response.
  * `B` sends a response to the port specified by `A` and waits for its response to be acknowledged.
  * `A` sends an acknowledgment response, verifying that data can be transferred in both directions.
* MapReduce requires that the functions used to map and reduce the data be pure functions. In general, a program expressed only in terms of pure functions has considerable flexibility in how it is executed. Sub-expressions can be computed in arbitrary order and in parallel without affecting the final result. 
* In rare cases, shared data that is mutated may not require synchronization. However, this case may vary on different machines/interpreters.
* A *daemon* thread means that the program will not wait for that thread to complete before exiting
* 3 ways for synchronization avoiding race condition: queue, lock, and parallel barrier

---

Appendix

* [A SQL interpreter](http://composingprograms.com/examples/sql/sql_exec.py)
* [A web crawler](http://composingprograms.com/examples/parallel/crawler.py.html)
* [A particle simulator](http://composingprograms.com/examples/parallel/particle.py.html)



