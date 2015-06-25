//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

// # Experiment: Create a constant with an explicit type of Float and a value of 4

let floatValue: Float = 4.0

print(floatValue)

let label = "The width is "
let width = 250
let widthLabel = label + String(width)

// Experiment: Try removing the conversion to String from the last line. What error do you get?
// Answer: Binary operator + cannot be applied to operands of type 'String' and 'Int'

// There's an wven simpler way to include values in strings: Write the value in parentheses, and write a backlash before it

let apples = 2
print("I have \(apples) apples left")

let myName = "Will"
print("Hello \(myName)")
print("Float value from experiment 1 is \(floatValue)")

// Create arrays and dictionaries with brackets ([])
// Access their elements by writing the index or key in brackets
// A comma is allowed after the element
var shoppingList = ["fish", "chicken", "meat"]
print(shoppingList[0])

var occupations = ["Will": "Software Engineer"]
let willsOccupation = occupations["Will"]
print("Will's occupation is \(willsOccupation)")

// To create an empty array or dict, use an initializer syntax
let emptyArray = [String]()
let emptyDict = [String: Float]()

// Use an if and switch to make conditionals, and use for-in, for while, and repeat-while to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required

let individualScores = [10, 2, 23, 45, 9]
var teamScore = 0

for score in individualScores {
    teamScore += score
}

print(teamScore)

// In an if statement, the conditional must be a Boolean expression
// You can use if and let together to work with values that might be missing. These values are represented as optionals. An optional value either cotains nil to indicate that a value is missing. Write a question mark (?) after the type of a value to mark the value as optional.

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

// Experiment: Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil

greeting = "Hello!"
var nilOptionalName: String? = nil
if let name = nilOptionalName {
    greeting = "Hello, \(name)"
} else {
    print(greeting)
}

// Switches support any kind of data and a wide variety of comparison operations - they aren't limited to integers and tests for equality
// Execution doesn't continue to the next case, so there is no need to explicitly break out of the switch at the end of each case's code

let vegetable = "pepper"
switch vegetable {
    case "celery":
        let vegetableComment = "Add some rasins and make ants on a log"
    case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea sandwich"
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "It is a spicy \(x)?"
    default:
        let vegetableComment = "Everything tastes good in soup"
}

// Experiment: try removing the default case. What error do you get?
// Switch must be exhaustive, consider adding a default case

// You use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair
// Dictinoaries are an unordered collection, so their keys and values are iterated over an arbitrary order
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0

for(key, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print("Largest number is \(largest)")

// Use a while to repeat a block of code until a condition changes
var n = 2

while n < 100 {
    n = n * 2
}

print(n)

// The condition of a loop can be at the end instead, ensuring that the loop is run at least once
var m = 2
repeat {
    m = m * 2
} while m < 100

print(m)

// You can keep an index in a loop - either by using ..< to make a range of indexes or by writing explicit initialization, condition, and increment
// Use ..< to make a range and omit its upper value. Use ... to make a range that includes both values

var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}

print(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 4; i++ {
    secondForLoop += 1
}

print(secondForLoop)

// Use func to declare a function. Call a function by following its name with a list of arguments in parentheses. Use -> to separate the parameter names and types from the function's return type

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

print(greet("Will", day: "Friday"))

// Experiment: Remove the day parameter. Add a parameter to include today's lunch special in the greeting
func whatsForLunch(name: String) -> String {
    return "Hello \(name), today's lunch special is buffalo wings"
}

print(whatsForLunch("Will"))

// Use a tuple to make a compound value - for example, to return multiple values from a function
func calculateStatistics(scores: [Int]) -> (min: Int, max:Int, sum:Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics([1, 2, 3, 30, 234, 2, 4])

print(statistics.sum)
print(statistics.min)
print(statistics.max)
print(statistics.2)

// Functions can also take a variable number of arguments, collecting them into an array
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum
}

print(sumOf(0, 1, 2, 3))

// Experiment: Write a function that calculates the average of its arguments
func averageOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum / numbers.count
}

print(averageOf(1, 2, 3))

// Functions can be nested. Nested functions have access to variables that were declared in outer functions. You can use nested functions to organize the code in a function that is long or complex
func returnFifteen() -> Int {
    var y = 10

    func add() {
        y += 5
    }
    
    add()
    return y
}

print(returnFifteen())

// Functions are first-class type. This means that a function can return another function as its value
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(7)

// A function can take another function as one of its arguments
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]

hasAnyMatches(numbers, condition: lessThanTen)

// Functions are actually a special kind of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed.
// You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

func isEven(number: Int) -> Bool {
    return number % 2 == 0
}

// Experiment: rewrite the closure to return zero for all odd numbers
numbers.map({
    (number: Int) -> Int in
    let result = isEven(number) ? number: 0
    return result
})

// You have several options for writing closures more concisely. When a closure's statement is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. 
// Single statement closures implicitly return the value of their only statement
let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)

// You can refer to parameters by number instead of by name - this approach is especially useful in very short closures.
// A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the ony argument to a function, you can omit the parentheses entirely
let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)

// Objects and classes
// Use class followed by the class's name to create a class
// A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class. Likewise, method and function declarations are written in the same way
class Shape {
    var numberOfSides = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

// Experiment: Add a constant property with let, and add another method that takes an argument

// Create an instance of a class by putting parentheses after the class name. Use dot syntax to access the properties and methods of the instance
var shape = Shape(name: "Square")
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)

// Use init to create an initializer to set up the class when an instance is created
// Every property needs a value assigned - either in its declaration (as with numberOfSides) or in the initializer (as with name)
// Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated

// Subclasses include their superclass name after their class name, separated by a colon
// Methods on a subclass that override the superclass's implementation are marked with override
class Square: Shape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// Experiment: Make another subclass named Circle that takes a radius and a name as arguments to its initializer
class Circle: Shape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return exp2(radius) * 3.14
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}

let testCircle = Circle(radius:4, name:"my test circle")
testCircle.area()
testCircle.simpleDescription()

// In addition to simple properties that are stored, properties can have a getter and a setter
class EquilateralTriangle: Shape {
    var sideLength = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    // In the setter, the new value has the implicit name newValue. You can provide an explicit name in parentheses after set
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 2.0, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.perimeter)

// If you don't need to compute the property but still need to provide code that is run before and after setting a new value, use willSet and didSet. For example, the class below ensures that the side length of its triangle is always the same as the side length of its square

class TriangleAnsSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name:String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAnsSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

// When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

// Enumerations and Structures
// Use enum to create an enumeration.
// Enumerations can have associated methods with them

/**
    The raw value-type of the enumeration is Int, so you only have to specify the first raw value. The rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration
*/
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                // Use the rawValue property to access the raw value of an enumeration member
                return String(self.rawValue)
            
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue

// Experiment: Write a function that compares two Rank values by comparing their raw values

func compareRanks(rank1: Rank, rank2: Rank) -> Bool {
    return rank1.rawValue > rank2.rawValue
}

// Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
            case .Spades, .Clubs:
                return "black"
        
            case .Diamonds, .Hearts:
                return "red"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

// Experiment: Add a color() method to Suit that returns "black" for spades and clubs and "red" for diamonds and hearts

let heartsColor = hearts.color()

// Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: Rank.Three, suit: Suit.Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// Experiment: Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit
// Better to do it as a separate function
func createFullDeckOfCards() -> [Card] {
    let suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs]
    let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
    var deck = [Card]()
    for r in ranks {
        for s in suits {
            deck.append(Card(rank: r, suit: s))
        }
    }
    return deck
}

let deckOfCards = createFullDeckOfCards()
for card in deckOfCards {
    print(card)
}

// An instance of an enumeration can have values associated with the instance. Instances of the same enumeration member can can have different values associated with them
enum ServerResponse {
    case Result(String, String)
    case Error(String)
    case Status(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese")
let status = ServerResponse.Status("Hungry")

switch success {
    // Notice how the sunrise and sunset are extracted from the ServerResponse value as part of matching the value against the switch cases
    case let .Result(sunrise, sunset):
        let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
    case let .Error(error):
        let serverResponse = "Failure... \(error)"
    case let .Status(status):
        let serverResponse = "Server status: \(status)"
}

// Experiment: Add a third case to ServerResponse and to the switch

// Use protocol to declare a protocol
protocol ExampleProtocol {
    var simpleDescription: String {get}
    
    mutating func adjust()
}

// Classes, enumerations, and structs can all adopt protocols
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    
    // The declaration of SimpleClass does not need any of its methods marked as mutating because methods on a class can always modify the class
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
}

var a = SimpleClass()
a.adjust()

let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()

let bDescription = b.simpleDescription

// Experiment: Write an enumeration that conforms to this protocol
enum SimpleEnumeration: ExampleProtocol {

    case Base, Adjusted
    
    var simpleDescription: String {
        get {
            return self.getDescription()
        }
    }
    
    func getDescription() -> String {
        switch self {
        case Base:
            return "A simple description"
        case .Adjusted:
            return "An adjusted enum"
        }
    }
    
    mutating func adjust() {
        self = SimpleEnumeration.Adjusted
    }
}

var c = SimpleEnumeration.Base
c.adjust()

let cDescription = c.simpleDescription

// Use extension to add functionality to an existing type, such as new methods and computed properties