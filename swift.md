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
let price = 2.2

switch price {
case 2.2:
    print("Expensive")
case 1:
    print("Cheaper")
default:
    print("Cheap")
}
```

