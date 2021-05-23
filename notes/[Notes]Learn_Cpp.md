Random notes from :[LearnCpp](learncpp.com)

Note: the chapter numbers may not coincide with the website due to website updates.

* [CH1.10 Preprocessing](#ch110-preprocessing)
* [CH2.1 Fundamental variable definition, initialization, and assignment](#ch21-fundamental-variable-definition-initialization-and-assignment)
* [CH2.4 Integers](#ch24-integers)
* [CH2.4a Fixed-width integers](#ch24a-fixed-width-integers)
* [CH2.5 Floating point numbers](#ch25-floating-point-numbers)
* [CH2.7 Chars](#ch27-chars)
* [CH2.9         Const, constexpr, and symbolic constants](#ch29-const-constexpr-and-symbolic-constants)
* [CH3.2 Arithmetic operators](#ch32-arithmetic-operators)
* [CH3.3 Increment/decrement operators, and side effects](#ch33-incrementdecrement-operators-and-side-effects)
* [CH3.4 Sizeof, comma, and conditional operators](#ch34-sizeof-comma-and-conditional-operators)
* [CH3.5 Relational operators (comparisons)](#ch35-relational-operators-comparisons)
* [CH3.6         Logical operators](#ch36-logical-operators)
* [CH3.8         Bitwise operators](#ch38-bitwise-operators)
* [CH4.1 Blocks (compound statements)](#ch41-blocks-compound-statements)
* [CH4.2 Global variables and linkage](#ch42-global-variables-and-linkage)
* [CH4.3         Static duration variables](#ch43-static-duration-variables)
* [CH4.4 Implicit type conversion (coercion)](#ch44-implicit-type-conversion-coercion)
* [CH4.5         Enumerated types](#ch45-enumerated-types)
* [CH4.6 Typedefs](#ch46-typedefs)
* [CH4.7 Struct](#ch47-struct)
* [CH5.1-5.7 Control Flow](#ch51-57-control-flow)
* [CH5.10 std::in](#ch510-stdin)
* [CH6.1 Size of](#ch61-size-of)
* [CH6.7 Pointers (1)](#ch67-pointers-1)
   * [Pointers and arrays](#pointers-and-arrays)
   * [Pointer arithmetic](#pointer-arithmetic)
* [CH6.8 Symbolic constant for strings](#ch68-symbolic-constant-for-strings)
* [CH6.9 Dynamic memory allocation](#ch69-dynamic-memory-allocation)
* [CH6.10 Pointers (2)](#ch610-pointers-2)
   * [Pointers and const](#pointers-and-const)
   * [Reference variables](#reference-variables)
   * [For-each loop](#for-each-loop)                  * [Void (generic) pointers](#void-generic-pointers)
   * [Pointers to pointers](#pointers-to-pointers)
* [CH6.15 std::array and std::vector](#ch615-stdarray-and-stdvector)
* [CH7.1 Function parameters and arguments](#ch71-function-parameters-and-arguments)
* [CH7.5 Inline functions](#ch75-inline-functions)
* [CH7.6 Function overloading and default parameters](#ch76-function-overloading-and-default-parameters)
* [CH7.8 Function pointers](#ch78-function-pointers)
* [CH7.9 Stack, heap, recursion and vector](#ch79-stack-heap-recursion-and-vector)
* [CH7.11 Assert and NODEBUG](#ch711-assert-and-nodebug)
* [CH7.13 Command line arguments](#ch713-command-line-arguments)
* [CH8.1 Classes](#ch81-classes)
* [CH8.4 Constructors, destructors and this](#ch84-constructors-destructors-and-this)
   * [Member initializer lists](#member-initializer-lists)
   * [Delegating constructors](#delegating-constructors)
* [CH8.6 Member functions and friend](#ch86-member-functions-and-friend)
* [CH9.1 Operator overloading](#ch91-operator-overloading)
* [CH9.11 Copy initialization, shallow and deep copying](#ch911-copy-initialization-shallow-and-deep-copying)
* [CH10 Composition, aggregation and association](#ch10-composition-aggregation-and-association)
* [CH11 Inheritance](#ch11-inheritance)
* [CH12 Polymorphism, virtual functions and casting](#ch12-polymorphism-virtual-functions-and-casting)
   * [Function binding and virtual table:](#function-binding-and-virtual-table)
   * [Pure virtual functions, abstract base classes, and interface classes](#pure-virtual-functions-abstract-base-classes-and-interface-classes)
   * [Virtual base classes (virtual inheritance)](#virtual-base-classes-virtual-inheritance)
   * [Object slicing and dynamic casting](#object-slicing-and-dynamic-casting)
* [CH13 Templates](#ch13-templates)
   * [Function templates](#function-templates)
   * [Templates Class](#templates-class)
   * [Expression parameters](#expression-parameters)
   * [Function/class template specialization](#functionclass-template-specialization)
* [CH14 Exceptions](#ch14-exceptions)
* [CH15 Move sematics and smart pointers](#ch15-move-semantics-and-smart-pointers)
* [CH16 An intro to STL](#ch16-an-intro-to-stl)
   * [Containers](#containers)
   * [Iterators](#iterators)
   * [Algorithms](#algorithms)
* [CH17 std::string](#ch17-stdstring)
* [CH18 I/O](#ch18-io)
   * [iostream](#iostream)
   * [File I/O](#file-io)
* [Something more...](#something-more)

----------
##### CH1.10 Preprocessing

Directives are resolved before compilation, from top to bottom on a file-by-file basis. Once the preprocessor has finished, all directives from that file are discarded （directives are only valid from the point of definition to the end of the file in which they are defined）.

The preprocessor copies the contents of the included file into the including file at the point of the #include directive

Conditional Compilation:

	#ifndef SOME_UNIQUE_NAME_HERE
	#define SOME_UNIQUE_NAME_HERE
	#endif

----------
##### CH2.1 Fundamental variable definition, initialization, and assignment

Favor implicit initialization over explicit initialization

	int nValue = 5; // explicit initialization
	int nValue(5); // implicit initialization

Uniform(list) initialization in C++11

	int value{}; // default initialization to 0
	int value{4.5}; // error: an integer variable can not hold a non-integer value

If you’re using a C++11 compatible compiler, favor uniform initialization

----------
##### CH2.4 Integers

While short int, long int, and long long int are valid, the shorthand versions short, long, and long long should be preferred. In addition to being less typing, adding the prefix int makes the type harder to distinguish from variables of type int. This can lead to mistakes if the short or long modifier is inadvertently missed.

	long long int lli; // valid
	long long ll; // preferred

All integer variables except char are signed by default. Char can be either signed or unsigned by default (but is usually signed for conformity).

Generally, the signed keyword is not used (since it’s redundant), except on chars (when necessary to ensure they are signed).
Favor signed integers over unsigned integers

----------
##### CH2.4a Fixed-width integers

	<cstdint>:fixed width integers: int8_t/uint8_t/...uint64_t
Until this is clarified by a future draft of C++, you should assume that int8_t and uint8_t may or may not behave like char types.


int can be used when the integer size doesn’t matter and isn’t going to be large.
Fixed-width integers should be used in all other cases.
Only use unsigned types if you have a compelling reason.

----------
##### CH2.5 Floating point numbers

Summation precision: Kahan summation algorithm

	#include <iomanip> // for std::setprecision()

Float values have between 6 and 9 digits of precision, with most float values having at least 7 significant digits. Double values have between 15 and 18 digits of precision, with most double values having at least 16 significant digits. Long double has a minimum precision of 15, 18, or 33 significant digits depending on how many bytes it occupies.

Favor double over float unless space is at a premium, as the lack of precision in a float will often lead to challenges.

Rounding Error matters 0.1+...+0.1 \neq 1.0. Ref. CH3.5 -- Relational operators

----------
##### CH2.7 Chars
Note that even though `cin` will let you enter multiple characters, ch will only hold 1 character. Consequently, only the first input character is placed in ch. The rest of the user input is left in the input buffer that cin uses, and can be accessed with subsequent calls to cin.

`\n and endl:`
Use std::endl when you need to ensure your output is output immediately (e.g. when writing a record to a file, or when updating a progress bar). Note that this may have a performance cost, particularly if writing to the output device is slow (e.g. when writing a file to a disk).
Use `\n` in other cases.

wchar_t should be avoided in almost all cases (except when interfacing with the Windows API). Its size is implementation defined, and is not reliable. It has largely been deprecated.

You won’t need to use char16_t(UTF-16) or char32_t(UTF-32) unless you’re planning on making your program Unicode compatible and you are using 16-bit or 32-bit Unicode characters.

----------
##### CH2.9 	Const, constexpr, and symbolic constants

Making a function parameter const does two things. First, it tells the person calling the function that the function will not change the value of myValue. Second, it ensures that the function doesn’t change the value of myValue.

Any variable that should not change values after initialization should be declared as const (or constexpr in C++11).

Avoid using #define to create symbolic constants, but use const variables to provide a name and context for your magic numbers.

A recommended way:

1. Create a header file to hold these constants
2. Inside this header file, declare a namespace
3. Add all your constants inside the namespace (make sure they’re const)
4. \#include the header file wherever you need it

Use the scope resolution operator (::) to access your constants in .cpp files

----------
##### CH3.2 Arithmetic operators

Prior to C++11, if either of the operands of integer division are negative, the compiler is free to round up or down! For example, -5 / 2 can evaluate to either -3 or -2, depending on which way the compiler rounds. However, most modern compilers truncate towards 0 (so -5 / 2 would equal -2). The C++11 specification changed this to explicitly define that integer division should always truncate towards 0 (or put more simply, the fractional component is dropped).

Also prior to C++11, if either operand of the modulus operator is negative, the results of the modulus can be either negative or positive! For example, -5 % 2 can evaluate to either 1 or -1. The C++11 specification tightens this up so that a % b always resolves to the sign of a.

----------
##### CH3.3 Increment/decrement operators, and side effects

Be aware of undefined expressions like:`x = x++;`
Don’t use a variable that has a side effect (if it modifies some states) applied to it more than once in a given statement.

----------
##### CH3.4 Sizeof, comma, and conditional operators

Avoid using the comma operator, except within `for` loops.

Only use the conditional operator for simple conditionals where it enhances readability.
It’s worth noting that the conditional operator evaluates as an expression, whereas if/else evaluates as statements. This means the conditional operator can be used in some places where if/else can not.
For example, when initializing a const variable:

    bool inBigClassroom = false;
    const int classSize = inBigClassroom ? 30 : 20;

There’s no satisfactory if/else statement for this, since const variables must be initialized when defined, and the initializer can’t be a statement.

----------
##### CH3.5 Relational operators (comparisons)

Directly comparing floating point values using any of these operators is dangerous. This is because small rounding errors in the floating point operands may cause unexpected results.

Knuth suggested the following method in his book “The Art of Computer Programming, Volume II: Seminumerical Algorithms (Addison-Wesley, 1969)”:

     #include <cmath>
    // return true if the difference between a and b is within epsilon percent of the larger of a and b
    bool approximatelyEqual(double a, double b, double epsilon)
    {
    return fabs(a - b) <= ( (fabs(a) < fabs(b) ? fabs(b) : fabs(a)) * epsilon);	
    }

The author suggests the following approach
     // return true if the difference between a and b is less than absEpsilon, or within relEpsilon percent of the larger of a and b
        bool approximatelyEqualAbsRel(double a, double b, double absEpsilon, double relEpsilon)
        {
        // Check if the numbers are really close -- needed when comparing numbers near zero.
        double diff = fabs(a - b);
        if (diff <= absEpsilon)
        return true;
        
    // Otherwise fall back to Knuth's algorithm
    return diff <= ( (fabs(a) < fabs(b) ? fabs(b) : fabs(a)) * relEpsilon);
    }


Comparison of floating point numbers is a difficult topic, and there’s no “one size fits all” algorithm that works for every case.

----------
##### CH3.6 	Logical operators

Any non-zero integer value evaluates to true when used in a boolean context. Mixing integer and boolean operations can be very confusing, and should be avoided!

Short circuit evaluation presents another opportunity to show why operators that cause side effects should not be used.

----------
##### CH3.8 	Bitwise operators

When dealing with bit operators, use unsigned integers.
Note that the results of applying the bitwise shift operators to a signed integer are compiler dependent.

Bit mask and bit flags:

Bit flags are typically used in two cases:

1. When you have many sets of identical bitflags.
2. Set options easily especially there are a lot of options (consider f(arg1,arg2...arg100))

manage bitflags:`std::bitset`

Bit mask: one application: color channel

----------
##### CH4.1 Blocks (compound statements)

Note that variables inside nested blocks can have the same name as variable inside outer blocks. When this happens, the nested variable “hides” the outer variable. This is called name hiding or shadowing.

----------
##### CH4.2 Global variables and linkage

By convention, many developers prefix global variable names with “g_” to indicate that they are global. This both helps identify global variables as well as avoids naming conflicts with local variables.

By default, non-const variables declared outside of a block are assumed to be external. However, const variables declared outside of a block are assumed to be internal.

Encapsulate the global variable.

> An identifier’s **scope** determines where it is accessible. An identifier that is out of scope can not be accessed.
>
> A variable’s **duration** determines when it is created and destroyed.
>
> An identifier’s **linkage** determines whether multiple instances of an identifier refer to the same identifier or not.



- Identifiers with **no linkage** mean the identifier only refers to itself. This includes:
  - Normal local variables
  - User-defined types, such as enums, typedefs, and classes declared inside a block (we’ll cover these in later lessons).
- Identifiers with **internal linkage** can be accessed anywhere within the file it is declared. This includes:
  - Static global variables (initialized or uninitialized)
  - Const global variables
  - Static functions (we’ll cover these in chapter 7)
    - Functions are external by default and can be modified to internal by using `static`
- Identifiers with **external linkage** can be accessed anywhere within the file it is declared, or other files (via a forward declaration). This includes:
  - Normal functions
  - Non-const global variables (initialized or uninitialized)
  - Extern const global variables
  - User-defined types, such as enums, typedefs, and classes declared in the global scope (we’ll cover these in later lessons).



| Type                               | Example                  | Scope       | Duration           | Linkage          | Notes                        |
| ---------------------------------- | ------------------------ | ----------- | ------------------ | ---------------- | ---------------------------- |
| Local variable                     | int x;                   | Block scope | Automatic duration | No linkage       |                              |
| Static local variable              | static int s_x;          | Block scope | Static duration    | No linkage       |                              |
| Dynamic variable                   | int *x = new int;        | Block scope | Dynamic duration   | No linkage       |                              |
| Function parameter                 | void foo(int x)          | Block scope | Automatic duration | No linkage       |                              |
| External non-const global variable | int g_x;                 | File scope  | Static duration    | External linkage | Initialized or uninitialized |
| Internal non-const global variable | static int g_x;          | File scope  | Static duration    | Internal linkage | Initialized or uninitialized |
| Internal const global variable     | const int g_x(1);        | File scope  | Static duration    | Internal linkage | Must be initialized          |
| External const global variable     | extern const int g_x(1); | File scope  | Static duration    | External linkage | Must be initialized          |

----------
##### CH4.3 	Static duration variables

Static variables offer some of the benefit of global variables (they don’t get destroyed until the end of the program) while limiting their visibility to block scope. This makes them much safer for use than global variables.

When applied to a global variable, the static keyword defines the global variable as having internal linkage, meaning the variable cannot be exported to other files.

When applied to a local variable, the static keyword defines the local variable as having static duration, meaning the variable will only be created once, and will not be destroyed until the end of the program.

Don’t use the “using” keyword in the global scope. This includes header files!

 

----------

##### CH4.4 Implicit type conversion (coercion)

Implicit Conversion: Numeric Promotion (no data loss) and Numeric Conversion (might lose data)

Conversion in the compiler:

1. If the operand is an integer, it undergoes integral promotion (as described above).
2. If the operands still do not match, then the compiler finds the highest priority operand and converts the other operand to match.

Const casts and reinterpret casts should generally be avoided because they are only useful in rare cases and can be harmful if used incorrectly.

Because C-style casts are not checked by the compiler at compile time, C-style casts can be inherently misused, thus: Avoid C-style casts

The main advantage of `static_cast` is that it provides compile-time type checking, making it harder to make an inadvertent error. `Static_cast` is also (intentionally) less powerful than C-style casts, so you can’t inadvertently remove `const` or do other things you may not have intended to do.

Using casts to make implicit type conversions clear

Use `std::getline()` to input text of a whole line
To read a full line of input into a string, you’re better off using the `std::getline()` function instead.

If reading numeric values with `std::cin`, it’s a good idea to remove the extraneous newline using `std::cin.ignore(). (std::cin.ignore(32767, '\n');)`

 

----------

##### CH4.5 	Enumerated types

Best practice: Don’t assign specific values to your enumerators.
Rule: Don’t assign the same value to two enumerators in the same enumeration unless there’s a very good reason.

C++11 defines a new concept, the enum class (also called a scoped enumeration), which makes enumerations both strongly typed and strongly scoped.

----------

##### CH4.6 Typedefs


Typedefs allow you to change the underlying type of an object without having to change lots of code.

One big advantage of typedefs is that they can be used to hide platform specific details. On some platforms, an integer is 2 bytes, and on others, it is 4. Thus, using `int` to store more than 2 bytes of information can be potentially dangerous when writing platform independent code.

----------
##### CH4.7 Struct


> Warning: One of the easiest mistakes to make in C++ is to forget the semicolon at the end of a struct declaration. This will cause a compiler error on the next line of code. Modern compilers like Visual Studio 2010 will give you an indication that you may have forgotten a semicolon, but older or less sophisticated compilers may not, which can make the actual error hard to find.


C++ supports a faster way to initialize structs using an **initializer list**    
    
    Employee joe = { 1, 32, 60000.0 }; // joe.id = 1, joe.age = 32, joe.wage = 60000.0
    Employee frank = { 2, 28 }; // frank.id = 2, frank.age = 28, frank.wage = 0.0 (default initialization)

Uniform initialization:

    Employee joe { 1, 32, 60000.0 }; // joe.id = 1, joe.age = 32, joe.wage = 60000.0
    Employee frank { 2, 28 }; // frank.id = 2, frank.age = 28, frank.wage = 0.0 (default initialization)

A function can also return a struct, which is one of the few ways to have a function return multiple variables.

>It turns out, we can only say that the size of a struct will be at least as large as the size of all the variables it contains. But it could be larger! For performance reasons, the compiler will sometimes add gaps into structures (this is called padding).

----------
##### CH5.1-5.7 Control Flow

>Rule: If defining variables used in a case statement, do so in a block inside the case (or before the switch if appropriate)


>Rule: Avoid use of goto statements unless necessary


The easiest way to understand a for loop 

    	for (init-statement; condition-expression; end-expression)
       	statement;

is to convert it into an equivalent while loop:

    { // **note the block here**
    init-statement;
    while (condition-expression)
    {
    statement;
    end-expression;
    }
    } // variables defined inside the loop go out of scope here


This is the only place in C++ where the comma operator typically gets used.

	 int iii, jjj;
	 for (iii=0, jjj=9; iii < 10; ++iii, --jjj)
	 cout << iii << " " << jjj << endl;

For loops in old code

In older versions of C++, variables defined as part of the init-statement did not get destroyed at the end of the loop. This meant that you could have something like this:


    for (int count=0; count < 10; ++count)
    std::cout << count << " ";
     
    // count is not destroyed in older compilers
     
    std::cout << "\n";
    std::cout << "I counted to: " << count << "\n"; // so you can still use it here
    This use has been disallowed, but you may still see it in older code.

----------

##### CH5.10 std::in
The following code will test for and fix failed extractions:


    if (std::cin.fail()) // has a previous extraction failed?
    {
    // yep, so let's handle the failure
    std::cin.clear(); // put us back in 'normal' operation mode
    std::cin.ignore(32767,'\n'); // and remove the bad input
    }

The following will also clear any extraneous input:

    std::cin.ignore(32767,'\n'); // and remove the bad input
A correct way to generate random numbers:

```
// Generate a random number between min and max (inclusive)
srand(static_cast<unsigned int>(time(0)));
// Assumes max - min <= RAND_MAX
int getRandomNumber(int min, int max)
{
    static const double fraction = 1.0 / (RAND_MAX + 1.0);  // static used for efficiency, so we only calculate this value once
    // evenly distribute the random number across our range
    return min + static_cast<int>((max - min + 1) * (rand() * fraction));
}
```



----------

##### CH6.1 Size of

The `sizeof` operator can be used on arrays, and it will return the total size of the array (array length multiplied by element size). Note that due to the way C++ passes arrays to functions, this will **not** work properly for arrays that have been passed to functions!
    
    void printSize(int array[])
    {
    std::cout << sizeof(array) << '\n'; // prints the size of a pointer, not the size of the array!
    }
     
    int main()
    {
    int array[] = { 1, 1, 2, 3, 5, 8, 13, 21 };
    std::cout << sizeof(array) << '\n'; // will print the size of the array
    printSize(array);
     
    return 0;
    }



----------

##### CH6.7 Pointers (1)

> **A pointer** is a variable that holds a *memory address* as its value.

`*`  is part of the pointer declaration syntax

Dereferencing a null pointer can cause bad things to happen. Deleting a null pointer is okay. 

Syntactically, C++ will accept the asterisk next to the data type, next to the variable name, or even in the middle.

However, when declaring multiple pointer variables, the asterisk has to be included with each variable. It’s easy to forget to do this if you get used to attaching the asterisk to the type instead of the variable name!
​  ​    

    int* iPtr6, iPtr7; // iPtr6 is a pointer to an int, but iPtr7 is just a plain int!
Initialize your pointers to a null value if you’re not giving them another value by:

    int *ptr(0);  // ptr is now a null pointer
or     

	int *ptr2; // ptr2 is uninitialized
	ptr2 = 0; // ptr2 is now a null pointer

Starting with C++11, this should be favored instead of 0 when we want a null pointer:
    int *ptr = nullptr; // note: ptr is still an integer pointer, just set to a null value (0)

C++11 also introduces a new type called `std::nullptr_t`(in header `<cstddef>`). `std::nullptr_t` can only hold one value: nullptr! While this may seem kind of silly, it’s useful in one situation. If we want to write a function that accepts a nullptr argument, what type do we make the parameter? The answer is `std::nullptr_t`.

###### Pointers and arrays

>It’s a common fallacy in C++ to believe an array and a pointer to the array are identical. They’re not. Although both point to the first element of the array. The confusion is primary caused by the fact that in many cases, when evaluated, a fixed array will “decay” (be implicitly converted) into a pointer to the first element of the array (essentially, losing its type information).
>Differences: 1. While using the `sizeof()` operator. When used on a fixed array, sizeof returns the size of the entire array (array length * element size). When used on a pointer, sizeof returns the size of a memory address (in bytes). 2. While using the address-of operator (&). Taking the address of a pointer yields the memory address of the pointer variable. Taking the address of the array returns a pointer to the entire array. This pointer also points to the first element of the array, but the type information is different.

In most cases, because the pointer doesn’t know how large the array is, you’ll need to pass in the array size as a separate parameter.

*Favor the pointer syntax (\*) over the array syntax ([]) for array function parameters.*

*Arrays in structs and classes don’t decay*.

###### Pointer arithmetic

Pointer arithmetic returns address of next element *of the same type*.

----------

##### CH6.8 Symbolic constant for strings

Feel free to use C-style string symbolic constants if you need read-only strings in your program, but always make them const!
​    
    #include <iostream>

```c++
int main()
{
char myName[] = "Alex";
std::cout << myName;
 
return 0;
}
```

The memory for example above is editable. This array will be deleted when it goes out of scope.


    #include <iostream>

```c++
int main()
{
const char *myName = "Alex";
std::cout << myName;
 
return 0;
}
```

​    

In the symbolic constant case, what usually happens is that this memory is read-only, and it will not go out of scope (can be returned).

*Feel free to use C-style string symbolic constants if you need read-only strings in your program, but always make them const!*

Side note for `std::cout`:

`std::cout` makes some assumptions about your intent. If you pass it a non-char pointer, it will simply print the contents of that pointer (the address that the pointer is holding). However, if you pass it an object of type `char*` or `const char*`, it will assume you’re intending to print a string.
​    
    #include <iostream>

    int main()
    {
    char c = 'Q';
    std::cout << &c;
     
    return 0;
    }

In this case, the programmer is intending to print the address of variable c. However, &c has type char*, so `std::cout` tries to print this as a string. Use `cout << (void *) c;` instead.

---

##### CH6.9 Dynamic memory allocation

C++ memory allocations:

- **Static memory allocation** happens for static and global variables. Memory for these types of variables is allocated once when your program is run and persists throughout the life of your program.
- **Automatic memory allocation** happens for function parameters and local variables. Memory for these types of variables is allocated when the relevant block is entered, and freed when the block is exited, as many times as necessary.
- **Dynamic memory allocation** allocate as user's request.


​    Assign memory size of type `int` and return a pointer.

```
int *ptr = new int
```

```
int *ptr1 = new int (5); // use direct initialization
int *ptr2 = new int { 6 }; // use uniform initialization, C++ 11
```

The user is responsible for dynamically allocated memory:

```
delete ptr; // return the memory pointed to by ptr to the operating system
ptr = 0; // set ptr to be a null pointer (use nullptr instead of 0 in C++11)
```

**Do not delete a pointer that is not pointing to dynamically allocated memory.**

**To avoid dangling pointers, after deleting memory, set all pointers pointing to the deleted memory to 0 (or nullptr in C++11)**

```
int *value = new (std::nothrow) int; // value will be set to a null pointer if the integer allocation fails
```

To check if above memory was successfully allocated, use `if (!value)`.

Dynamically allocated memory **effectively has no scope** (but will be released after program terminates). However, the pointers used to hold dynamically allocated memory addresses **follow the scoping rules of normal variables**.  This will cause potentially memory leaks. Memory leaks also happen when alter pointer pointing to dynamically allocated memory to another piece of memory without freeing previous memory.

`int *prt = new int[n]` essentially called `new []`, that's why deleting this array should use `delete []`

`sizeof` cannot be used to dynamically allocated array or pointer to a fixed array. `For-each` also doesn't work in this case.

```
int fixedArray[5] = { 9, 7, 5, 3, 1 }; // initialize a fixed array in C++03
int *array = new int[5] { 9, 7, 5, 3, 1 }; // initialize a dynamic array **in C++11**
char *array = new char[14] { "Hello, world!" }; // doesn't work in C++11, works in C++14
```

---

##### CH6.10 Pointers (2)

###### Pointers and const

A **pointer to a constant variable** can point to a non-constant variable, but if the variable is accessed using this pointer, it cannot be modified. But this pointer can still point to another variable.

```
int value1 = 5;
const int *ptr = &value1; // ptr points to a const int
```

A **const pointer** is a pointer whose value can not be changed after initialization. (The address it points to is fixed)

```
int value = 5;
int *const ptr = &value;
```

###### Reference variables

A **reference** (&) is a type of C++ variable that acts as an *alias* to another variable.

```
int value = 5; // normal integer
int &ref = value; // reference to variable value
```

In this context, the ampersand does not mean “address of”, it means “reference to”.

*References are treated as const*, meaning that they must be initialized (cannot be initialized with const variable, unless using const reference `const type&`) and once initialized can not be reassigned.

References are used as function parameters to pass references and modify variables directly.

*Rule: Pass non-pointer, non-fundamental data type variables by (const) reference*.

A secondary use of references is to provide easier access to nested data. Consider the following struct.

```
// Define struct first
int &ref = other.something.value1;
// ref can now be used in place of other.something.value1
```

A reference acts like a const pointer that is implicitly dereferenced when accessed(ref and ptr are identical). 

```
int value = 5;
int *const ptr = &value;
int &ref = value;
```

*The reference should generally be preferred over pointers unless pointers are the only solution.*

*Rule: When using a pointer to access the value of a member, use operator `->`instead of operator`. `*

###### For-each loop

Copy array values:

```
for (type var : array_or_any_list_structures)
   statement;
```
or
```
for (auto var : array_or_any_list_structures)
   statement;
```

Using references(preferred)

```
for (auto &var : array_or_any_list_structures)
	statement;
```

*Use references or const references for your element declaration in for-each loops for performance reasons.*

Note: `For-each` doesn't work with pointers (array size unknown).

###### Void (generic) pointers

A void pointer can point to objects of any data type. Henceforth, the void pointer **must** first be explicitly cast to another pointer type (`static_cast<type_to_dereference*>`) before it is dereferenced.

Undefined behaviors for void pointers: delete, pointer arithmetic.	

###### Pointers to pointers

Example:

```
int value = 5;
 
int *ptr = &value;
std::cout << *ptr; // dereference pointer to int to get int value
 
int **ptrptr = &ptr;
std::cout << **ptrptr; // first dereference to get pointer to int, second dereference to get int value
```

The address of operator (operator&) requires an lvalue, but &value is an rvalue：

```
int value = 5;
int **ptrptr = &&value; // not valid
```

However, following is valid:

```
int **ptrptr = nullptr; // use 0 instead prior to C++11
```

A common use for pointers to pointers is to facilitate dynamically allocated multidimensional arrays:

1. Compile-time constant:

   `int (*array)[5] = new int[10][5];` or `auto array = new int[10][5]; // C++11`

2. Variable size:

   ```
   int **array = new int*[n]; // allocate an array of n int pointers — rows
   for (int count = 0; count < n; ++count)
       array[count] = new int[m]; // columns
   ```

   De-allocate:

   ```
   for (int count = 0; count < n; ++count)
       delete[] array[count];
   delete[] array; // **this needs to be done last**
   ```

   *If the array is regular, use one dimensional array and playing with indices*.

---

##### CH6.15 std::array and std::vector

*Always pass std::array by reference or const reference* (to prevent the compiler from making a copy of the array when the array was passed to the function (for performance reasons))

`std::array.size()`:array length; `sizeof()` size of an element multiplied by the array length

`std::vector/array.at(index)`: does bound checking

·`std::vector` has a special implementation: can compact 8 booleans into a byte.

---

##### CH7.1 Function parameters and arguments 

This [chapter](https://www.learncpp.com/cpp-tutorial/74a-returning-values-by-value-reference-and-address/) is important.

1. *Passing by value*: used when passing fundamental data type and enumerators, do not use when passing arrays, structs, or classes.

2. *Passing by reference*: *when passing an argument by reference, always use a `const` references unless you need to change the value of the argument*. Advantages: can be used to return multiple values from a function; must be initialized, so there’s no worry about null values. Disadvantages:  An argument passed by value and passed by reference looks the same in function declaration. (It is hard to tell if the passed value will be changed)

3. *Passing by address*:  **Remember to check null pointers before dereference**. Passing by address is **COPYING** address, i.e., the pointer *will not be modified in the function*. To change the address being passed, use `type func(type *&ptr_to_change)`, `&ptr_to_change` is a reference to the pointer being passed. (Copying address of pointer being passed. Then any modification to `ptr_to_change` will apply to the original pointer.) 

4. So, to sum up: **There is only pass by value** (either value of a variable, or value of address, etc.)

*Prefer pass by reference to pass by address whenever applicable.* (as the later one is slower, i.e., needs dereference)

3 ways of return: value, address, reference.

Do NOT return by address if:

- When returning variables that were declared inside the function (use return by value), otherwise might produce dangling pointers. (This rule also applies to return by reference)
- When returning a large struct or class (use return by reference)

An interesting example:

```
int returnByValue()
{
    return 5;
}
 
int& returnByReference()
{
     static int x = 5; // static ensures x isn't destroyed when it goes out of scope
     return x;
}
 
int main()
{
    int value = returnByReference(); // case A -- ok, treated as return by value
    int &ref = returnByValue(); // case B -- compile error, the return is an r-value
    const int &cref = returnByValue(); // case C -- ok, the lifetime of return value is extended to the lifetime of cref
}
```

---

##### CH7.5 Inline functions

`Inline` is only a recommendation for compiler, the compiler may choose to ignore it for a lengthy function.

`inline` usually applies to small functions that are typically called inside loops and do not branch. 

---

##### CH7.6 Function overloading and default parameters

**Function overloading** is a feature of C++ that allows us to create multiple functions with the same name, so long as they have different parameters.

*The function’s return type is NOT considered when overloading functions; typedefs are not distinct*

Function overloading works in the following way:

1. Try to find exact match (by function arguments, NOT return type)
2. If `1.` failed, do promotion (internal type conversion)
   1. Char, unsigned char, and short -> int.
   2. Unsigned short -> int or unsigned int, depending on the size of an int
   3. Float -> double
   4. Enum ->  int
3. If `2.` failed, do standard conversion
   1. Any numeric type -> any other numeric type, including unsigned (eg. int to float)
   2. Enum ->  the formal type of a numeric type (eg. enum to float)
   3. Zero ->  pointer type and numeric type (eg. 0 to char*, or 0 to float)
   4. A pointer -> a void pointer

4. If `3.` failed, find a match through user-defined conversion

Note: all standard conversions and user-defined conversions are considered **equal**, i.e., no priority. Default parameters do NOT count towards the parameters that make the function unique.

Another trick: floating numbers always follow with an "f". So `print(3.14159);` is `print (double)` NOT `print(float)`.

To eliminate ambiguous function calls, either create a new function that accepts exactly the arguments or  do explicit type conversion, e.g., `static_cast`.

All default parameters must be the rightmost parameters.

*If the function has a forward declaration, put the default parameters there.*



---

##### CH7.8 Function pointers

`reinterpret_cast<void*>func` force convert function to function address. `func` is a *pointer* to the function `func` and `func()` lets program jump to function's address.

Declare: `Type (* pointer_name)(args)`. 

Assign: `pointer_name = func`, or `type (*pointer_name) (args) = func` (return type, args should be exactly matching).

Call: `(*pointer_name)(args)`(explicit dereference). or `pointer_name(args)` (implicit dereference).

*Pass default arguments to functions when using function parameters*. This is because default parameters are resolved at compile-time but function pointers are dereferenced at run-time.

Typedef:

```
typedef bool (*validateFcn)(int, int);
bool validate(int x, int y, bool (*fcnPtr)(int, int)); // ugly
bool validate(int nX, int nY, validateFcn pfcn) // clean
```

Type alias (C++11)

```
using validateFcn = bool(*)(int, int); // type alias
bool validate(int nX, int nY, validateFcn pfcn) // clean
```

std::function (C++11)

```
#include <functional>
bool validate(int x, int y, std::function<bool(int, int)> fcn);
// std::function method that returns a bool and takes two int parameters
```

---

##### CH7.9 Stack, heap, recursion and vector

Program in the memory:

- The code segment (also called a text segment), where the compiled program sits in memory, is typically read-only.
- The bss segment (also called the uninitialized data segment), where zero-initialized global and static variables are stored.
- The data segment (also called the initialized data segment), where initialized global and static variables are stored.
- The heap, where dynamically allocated variables are allocated from.
- The call stack, where function parameters, local variables, and other function-related information are stored.

The heap segment (also known as the “free store”) keeps track of memory used for dynamic memory allocation.

- Allocated memory stays allocated until it is specifically deallocated (beware memory leaks) or the application ends (at which point the OS should clean it up).
- Dynamically allocated memory must be accessed through a pointer. Dereferencing a pointer is slower than accessing a variable directly.

CPU register stores pointer to top of stack. Accessing stack is faster than heap.

`std::vector`: **length** is how many elements are being used in the array, whereas **capacity** is how many elements were allocated in memory. (length <= capacity). `resize()`changes both length and capacity.

**Array subscripts "[]" and "at()" are based on length, not capacity**.

Vector stack operations:

- push_back() pushes an element on the stack.
- back() returns the value of the top element on the stack.
- pop_back() pops an element off the stack.

*Rule: Generally favor iteration over recursion (for performance and potential stack overflow)*

---

##### CH7.11 Assert and NODEBUG

An **assert statement** is a preprocessor macro that evaluates a conditional expression. It lies in `<cassert>`. Error output contains the conditional expression that failed, along with line number of broken piece.

A trick:

```
assert(statement && "Informative error output");
```

Remember to check release option in your IDE before setting up preprocessor macros.


```
#define NDEBUG
 
// all assert() calls will now be ignored to the end of the file
```
*Deactivate assert/exit in release model as this terminates program without doing clean-ups.*



---

##### CH7.13 Command line arguments

```
int main(int argc, char *argv[]) // preferred
or
int main(int argc, char** argv)
```

`argv[0]` is (on most OS) the path and name of the current program. So `argc`>=1.

Use `std::stringstream` to parse string to int.

```
std::stringstream convert(argv[1]); // set up a stringstream variable named convert, initialized with the input from argv[1]
 
int myint;
if (!(convert >> myint)) // do the conversion
	myint = 0; // if conversion fails, set myint to a default value
```


#####  CH8.1 Classes

*Use the struct keyword for data-only structures. Use the class keyword for objects that have both data and functions.* (`struct` will cause potential memory leaks)

Data in `struct` are public by default. As an opposite, data in `class` are private by default. Member functions in `class` are public by default.

*Make member variables private, and member functions public, unless you have a good reason not to*.

Access control works on a per-class basis, not a per-object basis: when a function has access to the private members of a class, it can access the private members of **any** object of that class type that it can see.

See the following example:

```
#include <iostream>
 
class DateClass // members are private by default
{
	int m_month; // private by default, can only be accessed by other members
	int m_day; // private by default, can only be accessed by other members
	int m_year; // private by default, can only be accessed by other members
 
public:
	void setDate(int month, int day, int year)
	{
		m_month = month;
		m_day = day;
		m_year = year;
	}
 
	void print()
	{
		std::cout << m_month << "/" << m_day << "/" << m_year;
	}
 
	// Note the addition of this function
	void copyFrom(const DateClass &d)
	{
		// Note that we can access the private members of d directly
		m_month = d.m_month;
		m_day = d.m_day;
		m_year = d.m_year;
	}
};
 
int main()
{
	DateClass date;
	date.setDate(10, 14, 2020); // okay, because setDate() is public
	
	DateClass copy;
	copy.copyFrom(date); // okay, because copyFrom() is public
	copy.print();
 
	return 0;
}
```



*Only provide access functions when it makes sense for the user to be able to get or set a value directly.*

*Getters should usually return by value or **const reference**, not non-const reference*

---

##### CH8.4 Constructors, destructors and this

Direct initialization and uniform initialization (C++11)

```
int x(5); // Direct initialize an integer
Fraction fiveThirds(5, 3); // Direct initialize a Fraction, calls Fraction(int, int) constructor

int x { 5 }; // Uniform initialization of an integer
Fraction fiveThirds {5, 3}; // Uniform initialization of a Fraction, calls Fraction(int, int) constructor
```

*Avoid copy initializing your classes, because it is not efficient.*

Default constructor is only created automatically if no DEFAULT constructor exists.

###### Member initializer lists



```
class Something
{
private:
    int m_value1;
    double m_value2;
    char m_value3;
// If you assign values to them, in C++11, this will become default initialization for all constructors.

public:
    Something() : m_value1(1), m_value2(2.2), m_value3('c') // directly initialize our member variables
    {
    // No need for assignment here
    }
    
or
    public:
    Something(int value1, double value2, char value3='c')
        : m_value1(value1), m_value2(value2), m_value3(value3) // directly initialize our member variables
    {
    // No need for assignment here
    }
    
 
    void print()
    {
         std::cout << "Something(" << m_value1 << ", " << m_value2 << ", " << m_value3 << ")\n";
    }
};
 
int main()
{
    Something something;
    something.print();
    return 0;
}
```

Initialize at class construction.

In C++11, use uniform initialization.

```
class Something
{
private:
    const int m_value;
 
public:
    Something(): m_value { 5 } // Uniformly initialize our member variables
    {
    } 
};
```

*Favor uniform initialization over direct initialization if you compiler is C++11 compatible*

*Favor use of non-static member initialization to give default values for your member variables*.

###### Delegating constructors

```
#include <string>
#include <iostream>
 
class Employee
{
private:
    int m_id;
    std::string m_name;
 
public:
    Employee(int id=0, std::string name=""):
        m_id(id), m_name(name)
    {
        std::cout << "Employee " << m_name << " created.\n";
    }
 
    // Use a delegating constructors to minimize redundant code
    Employee(std::string name) : Employee(0, name) { }
};
```



**`exit()` doesn't call destructors**.

`this` can be used to chain objects together:

```
class Calc
{
private:
    int m_value;
 
public:
    Calc() { m_value = 0; }
 
    Calc& add(int value) { m_value += value; return *this; }
    Calc& sub(int value) { m_value -= value; return *this; }
    Calc& mult(int value) { m_value *= value; return *this; }
 
    int getValue() { return m_value; }
};
```



Then, do 

```
#include <iostream>
int main()
{
    Calc calc;
    calc.add(5).sub(3).mult(4);
 
    std::cout << calc.getValue() << '\n';
    return 0;
}
```

A side note: `this` is actually not a real "pointer". Unlike `*__vptr` that takes space of a pointer size, `this` doesn't take space.

---

#####  CH8.6 Member functions and friend

*Make any member function that does not modify the state of the class object `const`*

```
class Something // If const this class, then getValue has to be set to const
{
public:
    int m_value;
 
    Something() { m_value= 0; } // Constructor cannot be const!
 
    void resetValue() { m_value = 0; }
    void setValue(int value) { m_value = value; }
 
    int getValue() const; // note addition of const keyword here
};
 
int Something::getValue() const // and here
{
    return m_value;
}
```

Because passing objects by const reference is common, your classes should be const-friendly. That means making any member function that does not modify the state of the class object const!

`static` member variables are shared by all instantiations of the class. The static member variables are initialized BEFORE any instantiation of the class (they get initialized when the program starts):

```
class Something
{
public:
    static int s_value; // declares the static member variable. 
};
 
int Something::s_value = 1; // defines the static member variable, MUST BE DONE BEFORE ANY ATTEMPT TO INSTANTIATE THE CLASS (or C++ will do for you, set to default values), except for the case where object is const.
 
int main()
{
    // note: we're not instantiating any objects of type Something
 
    Something::s_value = 2;
    std::cout << Something::s_value << '\n';
    return 0;
}
```

Note: The static object DEFINITION doesn't subject to private/protected access control. (You can still initialize protected/private static object outside the class)

Put static object in `.cpp` file not header file will prevent potential multiple definitions (if the header file is included multiple times).

Static functions can be used to manipulate static variables without instantiating the class.

C++ doesn't have **static constructor**, this is a way to do that:

```
class MyClass
{
private:
	static std::vector<char> s_mychars;
 
public:
 
	class _init // we're defining a nested class named _init
	{
	public:
		_init() // the _init constructor will initialize our static variable
		{
			s_mychars.push_back('a');
			s_mychars.push_back('e');
			s_mychars.push_back('i');
			s_mychars.push_back('o');
			s_mychars.push_back('u');
		}
	} ;
 
private:
	static _init s_initializer; // we'll use this static object to ensure the _init constructor is called
};
 
std::vector<char> MyClass::s_mychars; // define our static member variable
MyClass::_init MyClass::s_initializer; // define our static initializer, which will call the _init constructor, which will initialize s_mychars
```

Because friend functions do not have this pointer (it is not a member function), you should pass by reference:

```
class Value
{
private:
    int m_value;
public:
    Value(int value) { m_value = value; }
    friend bool isEqual(const Value &value1, const Value &value2);
};
 
bool isEqual(const Value &value1, const Value &value2)
{
    return (value1.m_value == value2.m_value);
}
```

Declare class prototype in advance if needed.

Making a class a friend only requires as forward declaration that the class exists. However, making a specific member function a friend requires the full declaration for the class of the member function to have been seen first.

Friend classes do not have access to friend's this pointer. Friendship is also not "transferrable".

---

##### CH9.1 Operator overloading

1. Overloading cannot be defined if operands are all fundamental types.
2. Overloaded operator has same precedence as its un-overloaded counterpart.

3 ways of overloading: friend function, member function, normal function.

The reverse order of overloading can be defined by calling previously defined overloading.

*Prefer overloading operators as normal functions instead of friends if it’s possible to do so without adding additional functions*.

Overload `<<`:

```
std::ostream& operator<< (std::ostream &out, const Class &_class);
```

The reason for using `&`: returned value must still exist when the called function returns.

An example for overloading `<<` and `>>`:

```
#include <iostream>
 
class Point
{
private:
    double m_x, m_y, m_z;
 
public:
    Point(double x=0.0, double y=0.0, double z=0.0): m_x(x), m_y(y), m_z(z)
    {
    }
 
    friend std::ostream& operator<< (std::ostream &out, const Point &point);
    friend std::istream& operator>> (std::istream &in, Point &point);
};
 
std::ostream& operator<< (std::ostream &out, const Point &point)
{
    // Since operator<< is a friend of the Point class, we can access Point's members directly.
    out << "Point(" << point.m_x << ", " << point.m_y << ", " << point.m_z << ")";
 	// must return reference so it still exists after function call ends.
    return out;
}
 
std::istream& operator>> (std::istream &in, Point &point)
{
    // Since operator>> is a friend of the Point class, we can access Point's members directly.
    // note that parameter point must be non-const so we can modify the class members with the input values
    in >> point.m_x;
    in >> point.m_y;
    in >> point.m_z;
 
    return in;
}
```

Overloading as member functions or friend functions only differ slightly (the "leftmost" parameter in overloading member function now is replaced with `this`, thus could be omitted).  However:

*The assignment (=), subscript ([]), function call (()), and member selection (->) operators **must be** overloaded as **member functions**, because the language requires them to be.*

Because overloading as member function, the overloaded operator must be added as a member of the left operand, so overload `<<` as **member function** would **fail**. (friend functions are NOT member functions. The compiler translates this to left_operand.operator_overloaded(right_operand))

- If you’re overloading assignment (=), subscript ([]), function call (()), or member selection (->), do so as a member function.
- If you’re overloading a unary operator (!,+,-), do so as a member function.
- If you’re overloading a binary operator that modifies its left operand (e.g. operator+=), do so as a member function if you can. (Make the leftmost operand as class object, and the rightmost operand becomes an explicit parameter, the left operand, which is essentially `this`, is always omitted.)
- If you’re overloading a binary operator that does not modify its left operand (e.g. operator+), do so as a normal function or friend function. (Because the left operand can be not a class or not modifiable)

1. Overload `++/--`:

Distinguish from post/prefix operator:

```
int& operator++()         // Prefix Increment
{
	return (*this)+1;
}

int operator++(int)
{
	int temp;
	*this = (*this)+ 1;
	return temp;
}
//Postfix Increment, that's the reason: ++, then return PREVIOUS value

// SO POSTFIX IS GENERALLY INEFFICIENT THAN PREFIX COUNTERPART
```



2. Overload `[]`:

```
class IntList
{
private:
    int m_list[10];
 
public:
    int& operator[] (const int index);
};
 
int& IntList::operator[] (const int index)
{
    return m_list[index];
} // int& is lvalue. But if int is returned, it will evaluate to numa=numb, error
```

3. Overload `()`:

```
#include <cassert> // for assert()
class Matrix
{
private:
    double data[4][4];
public:
    Matrix()
    {
        // Set all elements of the matrix to 0.0
        for (int row=0; row < 4; ++row)
            for (int col=0; col < 4; ++col)
                data[row][col] = 0.0;
    }
 
    double& operator()(int row, int col);
    const double& operator()(int row, int col) const; // for const objects
};
 
double& Matrix::operator()(int row, int col)
{
    assert(col >= 0 && col < 4);
    assert(row >= 0 && row < 4);
 
    return data[row][col];
}
 
const double& Matrix::operator()(int row, int col) const
{
    assert(col >= 0 && col < 4);
    assert(row >= 0 && row < 4);
 
    return data[row][col];
}
```

`()` can also be used to create **functors** that are essentially classes but can storage values and have multiple instances. An example:

```
class Accumulator
{
private:
    int m_counter = 0;
 
public:
    Accumulator()
    {
    }
 
    int operator() (int i) { return (m_counter += i); }
};
 
int main()
{
    Accumulator acc;
    std::cout << acc(10) << std::endl; // prints 10
    std::cout << acc(20) << std::endl; // prints 30
 
    return 0;
}
```

4. Overload typecasts:

```
class Cents
{
private:
    int m_cents;
public:
    Cents(int cents=0)
    {
        m_cents = cents;
    }
 
    // Overloaded int cast
    operator int() { return m_cents; }
 // Cast Cents to int, C++ assumes you return the right value.
    int getCents() { return m_cents; }
    void setCents(int cents) { m_cents = cents; }
};

void printInt(int value)
{
    cout << value;
}

int main()
{
    Cents cents(7);
    printInt(cents); // print 7
// or just std::cout<<cents;
    return 0;
}
```

5. Overload `=` (assignment operator):

Difference between copy and assign:

- If a new object has to be created before the copying can occur, the copy constructor is used (note: this includes passing or returning objects by value).
- If a new object does not have to be created before the copying can occur, the assignment operator is used.



##### CH9.11 Copy initialization, shallow and deep copying

Recap:

```
int x(5); // Direct initialize an integer
Fraction fiveThirds(5, 3); // Direct initialize a Fraction, calls Fraction(int, int) constructor

int x { 5 }; // Uniform initialization of an integer
Fraction fiveThirds {5, 3}; // Uniform initialization of a Fraction, calls Fraction(int, int) constructor

int x = 6; // Copy initialize an integer
Fraction six = Fraction(6); // Copy initialize a Fraction, will call Fraction(6, 1)
Fraction seven = 7; // Copy initialize a Fraction.  The compiler will try to find a way to convert 7 to a Fraction, which will invoke the Fraction(7, 1) constructor.
```

1. Copy constructor:

```
class Fraction
{
private:
    int m_numerator;
    int m_denominator;
 
public:
    // Default constructor
    Fraction(int numerator=0, int denominator=1) :
        m_numerator(numerator), m_denominator(denominator)
    {
        assert(denominator != 0);
    }
 
    // Copy constructor
    Fraction(const Fraction &fraction) :
        m_numerator(fraction.m_numerator), m_denominator(fraction.m_denominator)
        // Note: We can access the members of parameter fraction directly, because we're inside the Fraction class
    {
        // no need to check for a denominator of 0 here since fraction must already be a valid Fraction
    }
};
```

Remember,  **In C++ access control works on *per-class* basis, not on per-object basis.**

Make the copy constructor private to prevent from copying. This private constructor is always triggered when it meets matching calls. The compiler would not opt out this.

For example:

```
Fraction fiveThirds(Fraction(5, 3));
//The compiler may change this to:
Fraction fiveThirds(5, 3);// This doesn't call copy constructor UNLESS it is private. (Leads to compilation error)
```

*Avoid using copy initialization intentionally, and use uniform initialization instead.*

Typically variables are returned by value, in this case copy initializer is called by process. But the compiler may opt out this:

```
class Something
{
};
 
Something foo() 
{
  Something s;
  return s;
}
 
int main()
{
  Something s = foo();
}
```

2. Converting constructors:

```
// suppose we have constructor:
Fraction(int numerator=0, int denominator=1) :
        m_numerator(numerator), m_denominator(denominator)
        
// we can (in C++11) pass an integer to this class. It will be converted to a "Fraction"
```

Constructors decorated by `explicit` do not allow implicit conversion.

*Consider making your constructors explicit to prevent implicit conversion errors*

3. Delete constructor:

```
someclass(type) = delete; // Any attempt to use this constructor will result a compile error
```

The copy constructor and overloaded operators may also be deleted in order to prevent those functions from being used.

3. Shallow and deep copying

Shallow copying ONLY copy address and can cause problem, like the following case:

```
// The default copy constructor
MyString::MyString(const MyString &source) :
    m_length(source.m_length), m_data(source.m_data)
{
}

// Then called in main:
int main()
{
    MyString hello("Hello, world!");
    {
        MyString copy = hello; // use default copy constructor
    } // copy gets destroyed here
 
    std::cout << hello.getString() << '\n'; // this will have undefined behavior
 
    return 0;
}
```
Solution: deep copying

```
// Copy constructor (Deep copying)
MyString::MyString(const MyString& source)
{
    // because m_length is not a pointer, we can shallow copy it
    m_length = source.m_length;
 
    // m_data is a pointer, so we need to deep copy it if it is non-null
    if (source.m_data)
    {
        // allocate memory for our copy
        m_data = new char[m_length];
 
        // do the copy
        for (int i=0; i < m_length; ++i)
            m_data[i] = source.m_data[i];
    }
    else
        m_data = 0;
}

// Overload assignment operator "="
MyString& MyString::operator=(const MyString & source)
{
    // check for self-assignment
    if (this == &source)
        return *this;
 
    // first we need to deallocate any value that this string is holding!
    delete[] m_data;
 
    // because m_length is not a pointer, we can shallow copy it
    m_length = source.m_length;
 
    // m_data is a pointer, so we need to deep copy it if it is non-null
    if (source.m_data)
    {
        // allocate memory for our copy
        m_data = new char[m_length];
 
        // do the copy
        for (int i=0; i < m_length; ++i)
            m_data[i] = source.m_data[i];
    }
    else
        m_data = 0;
 
    return *this;
}
```



*Classes in the standard library that deal with dynamic memory, such as `std::string` and `std::vector`,  do proper shallow/deep copying and proper `=` overloading*.

- The default copy constructor and default assignment operators do shallow copies, which is fine for classes that contain no dynamically allocated variables.
- Classes with dynamically allocated variables need to have a copy constructor and assignment operator that do a deep copy.
- Favor using classes in the standard library over doing your own memory management.

##### CH10 Composition, aggregation and association 

| Property\Type                          | Composition     | Aggregation     | Association                       | Dependency                        |
| -------------------------------------- | --------------- | --------------- | --------------------------------- | --------------------------------- |
| Relationship type                      | Whole/part      | Whole/part      | Otherwise unrelated               | Otherwise unrelated               |
| Members can belong to multiple classes | No              | Yes             | Yes                               | Yes                               |
| Members existence managed by class     | Yes             | No              | No                                | Yes                               |
| Directionality                         | Uni-directional | Uni-directional | Uni-directional or bi-directional | Uni-directional or bi-directional |
| Relationship verb                      | Part-of         | Has-a           | Uses-a                            | Depends-on                        |



An example of aggregation (note, destroying aggregated member only deleting the pointer, the main object still exists. Distinguish this case with shallo/deep copying):

```
#include <string>
 
class Teacher
{
private:
    std::string m_name;
 
public:
    Teacher(std::string name)
        : m_name(name)
    {
    }
 
    std::string getName() { return m_name; }
};
 
class Department
{
private:
    Teacher *m_teacher; // This dept holds only one teacher for simplicity, but it could hold many teachers
 
public:
    Department(Teacher *teacher = nullptr)
        : m_teacher(teacher)
    {
    }
};
 
int main()
{
    // Create a teacher outside the scope of the Department
    Teacher *teacher = new Teacher("Bob"); // create a teacher
    {
        // Create a department and use the constructor parameter to pass
        // the teacher to it.
        Department dept(teacher);
 
    } // dept goes out of scope here and is destroyed, but it only destroyed *pointer* to m_teacher (only deleted *m_teacher)
 
    // Teacher still exists here because dept did not delete m_teacher
 
    std::cout << teacher->getName() << " still exists!";
 
    delete teacher;
 
    return 0;
}
```





##### CH11 Inheritance

C++ constructs derived classes in phases, starting with the most-base class (at the top of the inheritance tree) and finishing with the most-child class (at the bottom of the inheritance tree). So the parent class knows nothing about its child class.

To specify specific base constructor when instantiating derived class, do:

```
class Derived: public Base
{
public:
    double m_cost;
 
    Derived(double cost=0.0, int id=0)
        : Base(id), // Call Base(int) constructor with value id!
            m_cost(cost)
    {
    }
 
    double getCost() const { return m_cost; }
};
```

 The **protected** access specifier allows the class, the member belongs to, friends, and derived classes to access the member. 

Recall: default access of class variables are private, default inheritance of a class is also private.

Access control:

| Access specifier in base class | Access specifier when inherited publicly | Access specifier when inherited privately | Access specifier when inherited protectedly |
| ------------------------------ | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Public                         | Public                                   | Private                                  | Protected                                |
| Private                        | Inaccessible                             | Inaccessible                             | Inaccessible                             |
| Protected                      | Protected                                | Private                                  | Protected                                |

*Use public inheritance unless you have a specific reason to do otherwise.*

Use `static_cast` to call friend function of base class.

```
class Base
{
private:
	int m_value;
 
public:
	Base(int value)
		: m_value(value)
	{
	}
 
	friend std::ostream& operator<< (std::ostream &out, const Base &b)
	{
		out << "In Base\n";
		out << b.m_value << '\n';
		return out;
	}
};
 
class Derived : public Base
{
public:
	Derived(int value)
		: Base(value)
	{
	}
 
	friend std::ostream& operator<< (std::ostream &out, const Derived &d)
	{
		out << "In Derived\n";
		// static_cast Derived to a Base object, so we call the right version of operator<<
		out << static_cast<Base>(d); 
		return out;
	}
};
 
int main()
{
	Derived derived(7);
	std::cout << derived;
	return 0;
}
```

`using `-declarations are the preferred way of changing access levels.

Make a public member in base class private in derived class:

```
#include <iostream>
class Base
{
public:
	int m_value;
};
 
class Derived : public Base
{
private:
	using Base::m_value;
 
public:
	Derived(int value)
	// We can't initialize m_value, since it's a Base member (Base must initialize it)
	{
		// But we can assign it a value
		m_value = value;
	}
};
 
int main()
{
	Derived derived(7);
	// The following won't work because m_value has been redefined as private
	std::cout << derived.m_value;
	return 0;
}
```

Multiple inheritance potentially leads to  "diamond inheritance". a->b,c->d.

*Avoid multiple inheritance unless alternatives lead to more complexity.*

---

##### CH12 Polymorphism, virtual functions and casting

A **virtual function** is a special type of function that, when called, resolves to the most-derived version of the function that exists between the base and derived class. This capability is known as **polymorphism**.

**Only** the most base class function needs to be tagged as virtual for all of the derived functions to work virtually.  However, *it’s generally a good idea to use the virtual keyword for virtualized functions in derived classes even though it’s not strictly necessary.*

A trick: because derived class is constructed/destructed *after/before* its base class, so do not call virtual functions in constructor/destructor of derived class.

`override` and `final` are not keywords of C++, they are normal identifiers that have special meaning in certain contexts.

*Apply the override specifier to every intended override function you write.* The compiler would have complained if the intended function is not overwrote. This will not take you extra performance cost.

Covariant return type is considered to be a legal override:

```
class Base
{
public:
    // This version of getThis() returns a pointer to a Base class
    virtual Base* getThis() { return this; }
};
 
class Derived: public Base
{
    // Normally override functions have to return objects of the same type as the base function
    // However, because Derived is derived from Base, it's okay to return Derived* instead of Base*
    virtual Derived* getThis() { return this; }
};
```



*Whenever you are dealing with inheritance, you should make any explicit destructors virtual.* (because if you use base pointer to refer derived class, only base class destructor is called.)

###### Function binding and virtual table:

Static binding, which binds specific address to function. Dynamic binding, which uses function pointers.

Example:

```
#include <iostream>
 
int add(int x, int y)
{
    return x + y;
}
 
int main()
{
    // Create a function pointer and make it point to the Add function ->Dynamic binding
    int (*pFcn)(int, int) = add;
    // Static binding
    int c = add(1, 2);
    std::cout << pFcn(5, 3) << std::endl; // add 5 + 3
 
    return 0;
}
```

 The **virtual table** is a lookup table of functions used to resolve function calls in a dynamic/late binding manner. It is a static array that stores eligible functions a class can call  constructed during compilation. Henceforth, it has slight performance impact:

* Direct function call: resolve physical address
* Function pointer: resolve function, resolve physical address
* Virtual function: look up vtable, resolve function, resolve physical address

###### Pure virtual functions, abstract base classes, and interface classes

Pure virtual function (meant to be redefined in derived classes) `virtual returntype funcname() = 0;` (you can also put a body in this function and let derived class use base function) The according class becomes abstract and cannot be instantiated. Any derived class must define a body for derived pure virtual function, or that derived class will be considered an abstract base class as well.

*Include a (usually default, i.e., empty) virtual destructor for interface classes, so that the proper derived destructor will be called if a pointer to the interface is deleted.*

###### Virtual base classes (virtual inheritance)

`class derived : virtual public/private/protected base`. Derived classes share same member from base class.(diamond inheritance)

Example:

```
#include <iostream>
 
class PoweredDevice
{
public:
    PoweredDevice(int power)
    {
		std::cout << "PoweredDevice: " << power << '\n';
    }
};
 
class Scanner: virtual public PoweredDevice // note: PoweredDevice is now a virtual base class
{
public:
    Scanner(int scanner, int power)
        : PoweredDevice(power) // this line is required to create Scanner objects, but ignored in this case (copier takes charge of this)
    {
		std::cout << "Scanner: " << scanner << '\n';
    }
};
 
class Printer: virtual public PoweredDevice // note: PoweredDevice is now a virtual base class
{
public:
    Printer(int printer, int power)
        : PoweredDevice(power) // this line is required to create Printer objects, but ignored in this case (copier takes charge of this)
    {
		std::cout << "Printer: " << printer << '\n';
    }
};
 
class Copier: public Scanner, public Printer
{
public:
    Copier(int scanner, int printer, int power)
        : Scanner(scanner, power), Printer(printer, power),
        PoweredDevice(power) // PoweredDevice is constructed here
    {
    }
};
```

> a virtual base class is always considered a direct base of its most derived class (which is why the most derived class is responsible for its construction). But classes inheriting the virtual base still need access to it. So in order to facilitate this, the compiler creates a virtual table for each class directly inheriting the virtual class (Printer and Scanner). These virtual tables point to the functions in the most derived class. Because the derived classes have a virtual table, that also means they are now larger by a pointer (to the virtual table)

###### Object slicing and dynamic casting

Derived class is "sliced" to be base type while assigning (`=`) to base class (because `=` is not virtual). So it is always a good idea to pass by reference.

Example:

```
void printName(const Base &base) // note: base  passed by reference
{
    std::cout << "I am a " << base.getName() << '\n';
}
 void printName2(const Base base) // note: base now passed by value, will be sliced and derived virtual functions won't be evaluated.
{
    std::cout << "I am a " << base.getName() << '\n';
}

int main()
{
    Derived d(5);
    printName(d);
 
    return 0;
}
```

Object slicing in `std::vector`:

```
#include <vector>
#include <functional> // for std::reference_wrapper
int main()
{
	std::vector<std::reference_wrapper<Base> > v; // our vector is a vector of std::reference_wrapper wrapped Base (not Base&)
	Base b(5); // b and d can't be anonymous objects
	Derived d(6);
	v.push_back(b); // add a Base object to our vector
	v.push_back(d); // add a Derived object to our vector
 
	// Print out all of the elements in our vector
	for (int count = 0; count < v.size(); ++count)
		std::cout << "I am a " << v[count].get().getName() << " with value " << v[count].get().getValue() << "\n"; // we use .get() to get our element from the wrapper
 
 
	return 0;
}
```

Use `dynamic_cast ` to do downcasting (cast base to derived). So sometimes you don't need virtual functions.

Failure of `dynamic_cast`ing a pointer leads null pointer. *Always ensure your dynamic casts actually succeeded by checking for a null pointer result*. (You can also `dynamic_cast` a reference, it will throw `std::bad_cast` when it fails)

You can also use `static_cast` (is faster than `dynamic_cast`) to do downcasting, but it will always "successful", i.e., doesn't return null pointer if it fails.

```
Derived *d = dynamic_cast<Derived*>(b); // use dynamic cast to convert Base pointer into Derived pointer
 
        if (d) // make sure d is non-null
            std::cout << "The name of the Derived is: " << d->getName() << '\n';
```

In general, using a virtual function *should* be preferred over downcasting, except:

- When you can not modify the base class to add a virtual function
- When you need access to something that is derived-class specific
- When adding a virtual function to your base class doesn’t make sense (e.g. there is no appropriate value for the base class to return)

An example to "virtualize" `<<`:

```
#include <iostream>
class Base
{
public:
	Base() {}
 
	// Here's our overloaded operator<<
	friend std::ostream& operator<<(std::ostream &out, const Base &b)
	{
		// Delegate printing responsibility for printing to member function print()
		return b.print(out);
	}
 
	// We'll rely on member function print() to do the actual printing
	// Because print is a normal member function, it can be virtualized
	virtual std::ostream& print(std::ostream& out) const
	{
		out << "Base";
		return out;
	}
};
 
class Derived : public Base
{
public:
	Derived() : Base() {}
 
	// Here's our override print function to handle the Derived case
	virtual std::ostream& print(std::ostream& out) const override
	{
		out << "Derived";
		return out;
	}
};
 
int main()
{
	Base b;
	std::cout << b << '\n';
 
	Derived d;
	std::cout << d << '\n'; // note that this works even with no operator<< that explicitly handles Derived objects
 
	Base &bref = d;
	std::cout << bref << '\n';
 
	return 0;
}
```


##### CH13 Templates

###### Function templates

```
template <typename T1, typename T2, ...> // Note, use typename and class are equivalent unless you are dealing with template template parameters (use typename) 
// templated function here
```

 The function with actual types is called a **function template instance**.

###### Templates Class 

`classname<typename> class`

Explicit instantiation for class templates (to prevent from linking error in instantiating classes)

```
// The template class definition goes in the header. The template class member functions goes in the cpp file
// Ensure the full Array template definition can be seen
#include "Array.h"
#include "Array.cpp" // we're breaking best practices here, but only in this one place
 
// #include other .h and .cpp template definitions you need here
// Instantiate ALL classes you need
template class Array<int>; // Explicitly instantiate template Array<int>
template class Array<double>; // Explicitly instantiate template Array<double>
 
// instantiate other templates here
// finally, include this cpp in project
```

###### Expression parameters

A template expression parameter can be

- A value that has an integral type or enumeration
- A pointer or reference to a class object/ function/ class member function

The expression serves as a stencil -- it replaces placeholders during compilation. There is no dynamic allocation.

###### 	Function/class template specialization

Can be used to define specific function for specified type.

```
template <> // outside of the template class
void Storage<double>::print() // redefine class member function for type double
{
    std::cout << std::scientific << m_value << '\n';
}
```

**Functions do not support partial specialization as of C++14** (Only full specialization is permitted, i.e., explicitly specify all types):

```
template<typename T, typename U> void f() {}   //allowed!
template<> void f<int, char>()            {}   //allowed!
template<typename T> void f<char, T>()    {}   //not allowed!
template<typename T> void f<T, int>()     {}   //not allowed!
```

Class however support partial specialization,

Using partial template class specialization to create separate pointer and non-pointer implementations of a class is extremely useful when you want a class to handle both differently, but in a way thatÃ¢â‚¬â„¢s completely transparent to the end-user.



---

##### CH14 Exceptions

The catch-all handler

```
int main()
{
	try
	{
		something
	}
	catch(type) // Handle a specific exception type
	{
		something
	}
	catch(..) // The catch-all handler ensures no uncaught exception is passed to OS.
	{
		something
	}
}
```



Exceptions can be wrapped in a class, but you should use a reference to do that: `catch (user_defined_exception& ex)`	 It can prevent from expensive copying a class. Catching exceptions by pointer should generally be avoided unless you have a specific reason to do so.

A useful trick: put most derived class first to prevent from class slicing

```
#include <stdexcept>

catch ( std::bad_alloc &ex) // Assuming a bad_alloc is thrown, std::bad_alloc is inherited from std::exception
    {
        cerr << "caught std::bad_alloc";
    }
    catch (std::exception &ex) // If you put this first, the exception will be handled by this block because of object slicing
    {
        cerr << "caught std::exception";
    }
 
```

The exceptions have a `what()` function printing error message, but this string is meant to be used for descriptive text only.

```
catch (std::exception &exception)
{
    std::cerr << "Standard exception: " << exception.what() << '\n'; // Assuming std::runtime_error (or something other) is thrown
}
```

Derive your exception from `std::exception`:

```
#include <exception> // for std::exception
 
class ArrayException: public std::exception
{
private:
	std::string m_error;
 
public:
	ArrayException(std::string error)
		: m_error(error)
	{
	}
 
	 const char* what() { return m_error.c_str(); } // return the std::string as a const C-style string
};
```

*When rethrowing the same exception, use the throw keyword by itself*. i.e., `throw;`

Function try blocks:

```
class B : public A
{
public:
	B(int x) try : A(x) // note addition of try keyword here
	{
	}
	catch (...) // note this is at same level of indentation as the function itself
	{
                // Exceptions from member initializer list or constructor body of A are caught here
                std::cerr << "Construction of A failed\n";
                // If an exception isn't explicitly thrown here, the current exception will be implicitly rethrown
	}
};
```

Notes on exception:

* Remember to clean up resources after exceptions are thrown
* Exceptions should *never* be thrown in destructors
* Performance issue: exception handling is best used for truly exceptional cases and catastrophic errors, not for routine error handling.

##### CH15 Smart pointers and Move semantics

An **l-value** (also called a locator value) as a function or an object (or an expression that evaluates to a function or object). **All l-values have assigned memory addresses**, all rest are r-values. r-values are typically evaluated for their values, have expression scope (they die at the end of the expression they are in), and cannot be assigned to. More on l/r values see [this](https://en.cppreference.com/w/cpp/language/value_category).

| L-value reference       | Can be initialized with | Can modify |
| :---------------------- | :---------------------- | :--------- |
| Modifiable l-values     | Yes                     | Yes        |
| Non-modifiable l-values | No                      | No         |
| R-values                | No                      | No         |

| L-value reference to const | Can be initialized with | Can modify |
| :------------------------- | :---------------------- | :--------- |
| Modifiable l-values        | Yes                     | No         |
| Non-modifiable l-values    | Yes                     | No         |
| R-values                   | Yes                     | No         |

| R-value reference       | Can be initialized with | Can modify |
| :---------------------- | :---------------------- | :--------- |
| Modifiable l-values     | No                      | No         |
| Non-modifiable l-values | No                      | No         |
| R-values                | Yes                     | Yes        |

| R-value reference to const | Can be initialized with | Can modify |
| :------------------------- | :---------------------- | :--------- |
| Modifiable l-values        | No                      | No         |
| Non-modifiable l-values    | No                      | No         |
| R-values                   | Yes                     | No         |

R-value references：

1. extend the lifespan of the object they are initialized with to the lifespan of the r-value reference (l-value references to const objects can do this too)
2. non-const r-value references allow you to modify the r-value

You should almost never return an r-value reference, for the same reason you should almost never return an l-value reference. 

The move constructor and move assignment are called when those functions have been defined, and the argument for construction or assignment is an *r-value*. Most typically, this r-value will be a *literal* or *temporary value*.

*Rule: If you want a move constructor and move assignment that do moves, you’ll need to write them yourself.*

Example: comparing copy/move constructor/assignment

```c++
	// Copy constructor
    // Member: T* m_ptr
	// Do deep copy of a.m_ptr to m_ptr
	Auto_ptr4(const Auto_ptr4& a)
	{
		m_ptr = new T;
		*m_ptr = *a.m_ptr;
	}
 
	// Move constructor
	// Transfer ownership of a.m_ptr to m_ptr
	Auto_ptr4(Auto_ptr4&& a)
		: m_ptr(a.m_ptr)
	{
		a.m_ptr = nullptr; 
	}
 
	// Copy assignment
	// Do deep copy of a.m_ptr to m_ptr
	Auto_ptr4& operator=(const Auto_ptr4& a)
	{
		// Self-assignment detection
		if (&a == this)
			return *this;
 
		// Release any resource we're holding
		delete m_ptr;
 
		// Copy the resource
		m_ptr = new T;
		*m_ptr = *a.m_ptr;
 
		return *this;
	}
 
	// Move assignment
	// Transfer ownership of a.m_ptr to m_ptr
	Auto_ptr4& operator=(Auto_ptr4&& a)
	{
		// Self-assignment detection
		if (&a == this)
			return *this;
 
		// Release any resource we're holding
		delete m_ptr;
 
		// Transfer ownership of a.m_ptr to m_ptr
		m_ptr = a.m_ptr;
		a.m_ptr = nullptr; 
 
		return *this;
	}
```







##### CH16 An intro to STL

###### Containers

* Sequence container: std::vector, std::deque, std::array, std::list, std::forward_list, and std::basic_string
* Associative container: std::set, std::multiset, std::map, std::multimap
  * compare elements using operator<
* Container adapeters: std::stack, std::queue, std::priority_queue

###### Iterators

*Iterators are container member functions*.

* Overloaded operators:
  * \*: deference
  * ++/--: moving forward/backward
  * !=/==: comparison
  * =: moving to position
* Positions:
  * begin()/end()
  * cbegin()/cend() -> for const (read-only) iterators
* Type
  * container::iterator read/write iterator
  * container::const_iterator: read only iterator

###### Algorithms

Algorithms are implemented as global functions that operate using iterators. This means that each algorithm only needs to be implemented once, and it will generally automatically work for all containers that provides a set of iterators (including your custom container classes). 

##### CH17 `std::string`

Note: A **C-style string** is simply an array of characters that uses a null terminator.  It has many downsides and is generally not suggested. (e.g. `=` is not overloaded so comparing two C-style string is comparing two pointers.)

`<cstring>`: C++ version of `<string.h>`, dealing with C-style string. Use `<string>` instead.

```
namespace std
{
    typedef basic_string<char> string; // For utf8 characters
    typedef basic_string<wchar_t> wstring; // For utf16 characters
}
```

Details see http://www.learncpp.com/cpp-tutorial/17-1-stdstring-and-stdwstring/

##### CH18 I/O

![iostream](.\imgs\iostream.gif)

###### iostream

* istream: `>>` extraction from input stream;
* ostream: `<<` insertion to output stream.
* iostream: combined above.

`<iomanip.h>`: manipulate stream.

Manipulator example:

```
cin>>setw(m)>>buff; // read only m-1 (1 for \0) characters from buff
cout<<endl; output '\n' and flush buffer (write everything in buffer to device)
```

Extraction and whitespace:

```
char ch;
cin.get(ch); // whitespace will be accepted. Note, get DOES NOT READ \n
char buff[100];
cin.getline(buff,50); // this also extracts \n
```

More functions:

* **ignore()** discards the first character in the stream.
* **ignore(int nCount)** discards the first nCount characters.
* **peek()** allows you to read a character from the stream without removing it from the stream.
* **unget()** returns the last character read back into the stream so it can be read again by the next call.
* **putback(char ch)** allows you to put a character of your choice back into the stream to be read by the next call.

Formatting:

```
cout.setf(ios::showpos | ios::uppercase); // turn on the ios::showpos and ios::uppercase flag, use unsetf to set off flags. Note, uppercase doesn't apply to lower case letters, it only applies to numbers ->see language specification

// a case on mutually exclusive flag:
cout.unsetf(ios::dec); // turn off decimal output FIRST
cout.setf(ios::hex); // turn on hexadecimal output
cout << 27 << endl;

//or instead
// Turn on ios::hex as the only ios::basefield flag
cout.setf(ios::hex, ios::basefield);
cout << 27 << endl;

// you can use ios::fmtflags to store flag status
http://www.cplusplus.com/reference/ios/ios_base/fmtflags/
```

More manipulators see web.

String buffer: `stringstream` in `<sstream>`

Stream status:

`ios::goodbit`, `ios::badbit` (fatal error), `ios::eofbit`, `ios::failbit` (non-fatal error). They also have member function counterparts, namely, `bool ios::good()` , etc. (return true if everything is good)

###### File I/O

`ifstream`, `ofstream` and `fstream` are included in `fstream.h`.

`ifstream ` returns 0 when reaches EOF. A typical reading process:

```
  // ifstream is used for reading files
    // We'll read from a file called Sample.dat
    ifstream inf("Sample.dat");
 
    // If we couldn't open the input file stream for reading
    if (!inf)
    {
        // Print an error and exit
        cerr << "Uh oh, Sample.dat could not be opened for reading!" << endl;
        exit(1);
    }
 
    // While there's still stuff left to read
    while (inf)
    {
        // read stuff from the file into a string and print it
        std::string strInput;
        getline(inf, strInput);
        cout << strInput << endl;
    }
```

`endl` flushes buffer (as `ostream::flush()` does), so use `\n` instead for performance concerns.

`ofstream outf("Sample.dat", ios::app);`

| Append    | Meaning                                  |
| --------- | ---------------------------------------- |
| app       | Opens the file in append mode            |
| ate       | Seeks to the end of the file before reading/writing |
| binary    | Opens the file in binary mode (instead of text mode) |
| in        | Opens the file in read mode (default for ifstream) |
| nocreate  | Opens the file only if it already exists |
| noreplace | Opens the file only if it does not already exist |
| out       | Opens the file in write mode (default for ofstream) |
| trunc     | Erases the file if it already exists     |

Random file access using `seekp()` and `seekg()` (seek get and seek put):

`seekp/seekg(int byteoffset, ios_flag)`

| Ios seek flag | Meaning                                  |
| ------------- | ---------------------------------------- |
| beg           | The offset is relative to the beginning of the file (default) |
| cur           | The offset is relative to the current location of the file pointer |
| end           | The offset is relative to the end of the file |

*Do not write addresses to files. The variables that were originally at those addresses may be at different addresses when you read their values back in from disk, and the addresses will be invalid.*

Static library: .a(archive) in Linux or .lib in Windows

Dynamic (shared) library: .so(shared object) in Linux or .dll in Windows

##### Something more...

1. `__cplusplus` is predefined macro for C++ compilers. 

   ```
   static_assert(__cplusplus > 199711L, "Program requires C++11 capable compiler");
   // static_assert also requires C++11
   ```














































































