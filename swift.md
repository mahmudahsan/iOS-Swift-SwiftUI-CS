# Swift Language

1. [Quick Overview](#quick-overview)
2. [Basics](#basics)
    - [Tuple](#tuples)
    - [Optional](#optionals)

## Quick Overview

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

#### Class

```swift
class Person {
    let name: String
    var age: Int
    var address: String?
    
    init(name:String, age:Int, address: String?) {
        self.name = name
        self.age = age
        self.address = address
    }
    
    deinit {
        print("Clean UP")
    }
}

var person1:Person? = Person(name: "Mark", age: 35, address: "US")
if let name = person1?.name {
    print(name)
}
if let age = person1?.age {
    print(age)
}
if let address = person1?.address {
    print(address)
}

person1 = nil

```
- Every property needs a value assigned. Either when it is declared or in the initializer.

- `deinit` is used to cleanup before the object deallocated

#### Subclass

```swift
class Person {
    let name: String
    var age: Int
    var address: String?
    
    init(name:String, age:Int, address: String?) {
        self.name = name
        self.age = age
        self.address = address
    }
    
    deinit {
        print("Clean UP")
    }
}

class SpecialPerson : Person {
    let special: Bool
    
    init(name: String, age: Int, address: String?, isSpecial: Bool) {
        self.special = isSpecial
        super.init(name: name, age: age, address: address)
    }
    
    func showOutput() {
        print(name)
        print(age)
        if let address = self.address {
            print(address)
        }
        print(special ? "Special" : "Normal")
    }
}

let sp1 = SpecialPerson(name: "Mark", age: 35, address: nil, isSpecial: true)
sp1.showOutput()
```
- In subclass initializer, initialize the subclass properties first then call superclass initializer

- To override superclass methods, use `override` keyword in front of the methods

> Getter and Setter for computed properties

```swift
class Person {
    let name: String
    var age: Int
    var address: String?
    
    init(name:String, age:Int, address: String?) {
        self.name = name
        self.age = age
        self.address = address
    }
    
    // Getter
    var isAdult: Bool {
        get {
            return age >= 18 ? true : false
        }
        set {
            // do nothing in this case
        }
    }
}

let p1 = Person(name: "Mark", age: 35, address: nil)
if (p1.isAdult) {
    print("\(p1.name) is an adult!")
}
```

- `willSet` and `didSet` are used to run code before and after setting a new value.


#### Enumeration

You can use `enum` to create enumeration. Like classes enumeration can have named types and methods.

```swift
enum GameResult: Int {
    case win = 1 // explicit value otherwise start from 0
    case tie // 2
    case loss // 3
    case unknown // 4
    
    func showResult() {
        switch self {
        case .win:
            print("Win")
        case .tie:
            print("Tie")
        case .loss:
            print("Loss")
        default:
            print("Unknown")
        }
    }
}

let gameResult = GameResult.tie
gameResult.showResult()

```

- Enumeration can use to associate value with it when the instances are created. 

```swift
enum Price {
    case good(String, Double)
    case bad(String)
}

let priceReceived = Price.good("Very good price", 23.33)
let priceReceived2 = Price.bad("Very bad price")

switch priceReceived {
case let .good(msg, val):
    print("\(msg): \(val)")
case let .bad(msg):
    print("\(msg)")
}
```

#### Structure

Same like class. Can contain properties, initializer and methods. 

> The Difference between class and structure is, classes are passed by reference and structure are passed by copied.

```swift
struct Person {
    let name: String
    var age: Int
    var address: String?
    
    init(name: String, age: Int, address: String?) {
        self.name = name
        self.age = age
        self.address = address
    }
    
    func showDisplay() {
        print(name)
        print(age)
        if let address = self.address {
            print(address)
        }
    }
}

let p1 = Person(name: "Mark", age: 35, address: nil)
p1.showDisplay()
```

#### Protocol

```swift
protocol NumDemoProtocol {
    var num: Int { get set }
    mutating func adjust()
}

class Num1 : NumDemoProtocol {
    var num: Int = 100
    func adjust() {
        num = num + 10
    }
}

let n1 = Num1()
n1.adjust()
print(n1.num)

struct Num2: NumDemoProtocol {
    var num: Int = 100
    mutating func adjust() {
        num = num + 20
    }
}

var n2 = Num2()
n2.adjust()
print(n2.num)
```

- Class, Structure and Enumeration can confront a protocol
- `mutating` is required in front of function if it modifies the structure.

#### Extension

```swift
protocol NumDemoProtocol {
    var num: Int { get set }
    mutating func adjust()
}

extension Int: NumDemoProtocol {
    var num: Int {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    
    mutating func adjust() {
        self += 10
    }
}

var n: Int = 100
n.adjust()
print(n)
```

#### Generics

> Write a name inside angle brackets to make a generic function or type

```swift
func makeArray<Item>(repeating item: Item, times: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<times {
        result.append(item)
    }
    
    return result
}

print(makeArray(repeating: "Life", times: 3))
print(makeArray(repeating: 5, times: 2))
```

### Basics

#### Fundamental Types

- Int 
- Double
- Float
- String
- Bool [ true / false ]

##### Integer

> Best practice to use `Int` for all cases.

```swift
let minValue = UInt8.min
let maxValue = UInt8.max

// Integer Literals
let decimalInt = 17
let binaryInt = 0b10001
let octalInt = 0o21
let hexaInt = 0x11

// Easier to read
let million = 1_000_000

```

##### Double

> `Double` represents 64 bit floating point number.
> `Float` represents 32 bit floating point number.

##### Type Conversion
Swift will not automatically convert between mixed types.
So use `Int(value)` or `Double(value)` to convert types

```swift
let aInt = 5
let aDouble = 4.5
let sum = Double(aInt) + aDouble
```

##### Type Alias

```swift
typealias HowInt = Int 
let a: HowInt = 5

```

#### Collection

- Array
- Set
- Dictionary

#### Other

- Tuple
- Optional Types

#### Comments

```swift
// single line comment

/* Multiline
Comment */
```

#### Tuples

To combine multiple values into a single compound value use tuple.

```swift
let aTuple = (404, "Not Found")

// Decompose
let (statusCode, status) = aTuple
print(statusCode)
print(status)

// OR accessing
print(aTuple.0)
print(aTuple.1)

// Named Tuple
let bTuple = (statusCode: 404, status: "Not Found")
print(bTuple.statusCode)
print(bTuple.status)
```

#### Optionals
An optional either has a value or absent of value (nil).

- If a variable is declared as optioanl by providing (?), an automatic `nil` is assigned to it

> There are 3 ways to unwrap optionals

1. Optional Binding `if let`
2. Nil Coalescing Operator `??`
3. Force unwrap `!`

```swift
var aNum: Int?

aNum = 100


// Optional Binding
if let aNum = aNum {
    print(aNum)
}

// Nil Coalescing Operator ??
aNum = nil
print(aNum ?? 0)

// Force unwrap !
// When you're sure the optional must contain a value
aNum = 1000
print(aNum!)

```

##### Implicitly Unwrap Optional

> If it is certain that an optional always have a value after the value is first set, in that case checking optional every time, it is better to declare that optional as implicitly unwrap optional.

**This part will not work**

```swift
var name:String? = "Jack"
let newName:String = name  //need to unwrap
newName
```

**Implicitly unwrap optional work no need unwrap logic**

```swift
var name:String! = "Jack"
let newName:String = name
newName
```

