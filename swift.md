# Swift Language

## Basics

Swift doesn't need main function as code written in global scope is used as the entry point.

> Swift doesn't need semicolon ;

```swift
print("Hello World")
```

#### Values

`let` is used to define constant. `var` is for variable.

```swift
let amount = 20
var price = 2.22
price = 1.1

```

#### Type Inference

If you want to provide a value type explicitly you can use `:` to define the type.

```swift
let firstName = "Mahmud"
let lastName: String = "Ahsan"

```

#### Type Conversion

Swift doesn't support automatic type conversion. You have to explicitly convert types.


```swift
let price = 20.2
let msg = "Total price is: " + String(price)
```

#### String Interpolation

```swift
let price = 20.2
let msg2 = "Total price is: \(price)"
```

#### Multiline String

```swift
let msg = """
Life is cool
Someone is right
"""
```

#### Array


```swift
// Explicit type is needed
var emptyArray = [String]()

emptyArray.append("Life")
emptyArray.append("is")
emptyArray.append("good")


// Array created with Type Inference
let emptyArray = [1, 2, 3, 4, 5]

```

#### Dictionary

```swift
// Explicity type is needed
var emptyDictionary = [String: Int]()

emptyDictionary["product"] = 5
emptyDictionary["price"] = 40
```

#### Control Flow

> `if` and `switch` are used to make conditionals.

parentheses is optional. But Curly braces are mandatory

```swift
let price = 2.2

if price > 2 {
    print("Expensive")
} else if price == 1 {
    print("Cheaper")
} else {
    print("Cheap")
}

```

```swift
let price = 4

switch price {
case let x where x > 2:
    print("Expensive")
case 1:
    print("Cheaper")
default:
    print("Cheap")
}

```

> To make loops you can use `for-in`, `while` and `repeat-while`.

```swift
let listOfNumbers = [1, 2, 3, 4, 5]

// for-in loop
for num in listOfNumbers {
    print(num)
}

// while loop
var i = 0
while i < listOfNumbers.count {
    print(listOfNumbers[i])
    i += 1
}

// repeat-while loop
i = 0
repeat {
    print(listOfNumbers[i])
    i += 1
} while i < listOfNumbers.count

```

> Accessing a dictionary using `for-in` loop

```swift
let people = [1: "Mark", 2: "John", 3: "Tiffen"]

for (index, value) in people {
    print("Person \(index): \(value)")
}

```

> Range operator `1..<5` it omits the upper bound or `1...5` it includes the upper bound

```swift
for i in 1..<5 {
    print(i)
}

for i in 1...5 {
    print(i)
}
```


#### Optional

> If a variable may contain value or no value you can declare the variable as optional.

> Using optional binding `if let` we can check the optional.

```swift
var price: Int? = 20

if let price = price {
    print(price)
}

price = nil

if let price = price {
    print(price)
} else {
    print("No Value")
}

```

Another way to check optional value by `??` operator.

```swift
print(price ?? "No Value")
```

#### Function

```swift
func showPerson(name: String, age: Int) {
    print("Name is: \(name), Age is: \(age)")
}

showPerson(name: "Mark", age: 35)

```

> A function that returns a value

- Function used parameters names as labels for their arguments. 

- When you don't want to use the name use `-` in front of label. 


```swift
func square(_ num: Int) -> Int {
    return num * 2
}

print(square(5))

```

- It is also possible to provide other label in front of parameter name. Here `value` is a label in this case

```swift
func square(value num: Int) -> Int {
    return num * 2
}

print(square(value: 5))

```

> To return multiple values from a function, you can use Tuple

- To access individual tuple values use `.` operator. Like `tuple.0` or `tuple.1`

```swift
func getCompoundValues(_ num: Int) -> (Int, Int, Int) {
    return (num * 2, num * 3, num * 4)
}

let result = getCompoundValues(2)
print("Value 1: \(result.0), Value 2: \(result.1), Value 3: \(result.2)")

```

#### Closure

Function are first class citizen in Swift. 

- A function can return another function as a value 

- A function can define another function inside

- A function can take another function as argument


Function are special case of Closure. A block of code that can be called later. The code within a closure can access the value within the scope and can hold it with it. Here `total` variable is associated with the inner function `addOne`.

```swift
func makeIncrement() -> ((Int) -> Int) {
    var total = 0
    
    func addOne(num: Int) -> Int {
        total = total + num
        return total
    }
    return addOne
}

let increment = makeIncrement()
print(increment(2)) // 2
print(increment(5)) // 7
```

> You can write a closure without name by surrounding code with braces `{}`. And a `in` operator to separate that argument and return type from the body

```swift
let numbers = [1, 2, 3, 4, 5]

let squareNums = numbers.map({ (num: Int) -> Int in
    return num * 2
})

print(squareNums) // [2, 4, 6, 8, 10]
```

- When a closure's type is already known, parameter type and return type can be ignored.

- In one line closure, `return` statement can be ignored

```swift
let numbers = [1, 2, 3, 4, 5]

let squareNums = numbers.map({num in num * 2})
print(squareNums) // [2, 4, 6, 8, 10]

```
- You can refer parameter in a closure by number `$0, $1`

- If a closure is the last argument of a function, it can appear immediately after the parentheses

- If closure is the only argument, you can omit the parentheses

```swift
let numbers = [5, 2, 1, 6, 7]

let sortedNumbers = numbers.sorted {$0 < $1}
print(sortedNumbers) // [1, 2, 5, 6, 7]
```
