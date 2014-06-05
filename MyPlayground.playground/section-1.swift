// Playground - noun: a place where people can play

// Comment out import Cocoa to play with pure Swift 
// without pollution of Objective-C Objects.
//import Cocoa

var str = "Hello, playground"

let myInt :Int = 23

let arr = [1,2,3,4,5]

var mutableString = "Mutable String"

let constantString = "Constant String"

var combinedString = mutableString + " and " + constantString

combinedString = constantString + " and "  + mutableString

//var aString = String(NSString(format: "Hello %d, %@", 3, "triangles"))

//aString = aString + "."

countElements("what the heck! 🐪")

2 * 2.5

let number1 = 2
// number1 * 2.5 generate an compile error.
Double(number1) * 2.5

//let aSet = NSSet(array: [1,2,3,4,5])

//var aView = NSView()
//var aButton = NSButton()

// FIXME: Any fix to following situation if I really want to store two different types of object?
// let arrObjs = Array(aView, aButton)  // Error. Different Types.

//let anTraditionalObjectiveCArray = NSArray(objects: aView, aButton)

// Following assignments are the Same
var swiftArray: String[] = []  // Short hand syntax
var anotherSwiftArray: Array<String> = [] // Generic Syntax

swiftArray = ["Hello", "World"]
anotherSwiftArray = ["Hello", "World"]

var numbers = [0,1,2,3,4]
numbers.insert(5, atIndex:5)
numbers

var dict = Dictionary<String, String>()
var oneString = "1"
let anotherDict: Dictionary<String, String> = ["one": oneString, "two": "2"]
let anArray: Array<String> = ["1","2","3"]
anArray[0] = "4"
// anotherDict["one"] = "1" + "" //Generate an error.
oneString += ".0"


let finalSquare = 25
var board = Int[](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
board
var square = 0
var diceRoll = 0
var squares: Array<Int> = []
while square < finalSquare {
    // roll the dice
    if ++diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
    squares.append(square)
}
squares
println("Game over!")

func swap(inout a:Int, inout b:Int) {
    let tempA = a
    a = b
    b = tempA
}

var a = 2, b = 3
swap(&a, &b)
let str1 = "\(a) and \(b)"

let names = ["alpha", "delta", "beta", "gamma"]
var reversed = Array<String>()
reversed = sort(names, { (str1:String, str2:String) -> Bool in
    return str1 > str2
})
reversed
reversed = sort(names, { (str1:String, str2:String) -> Bool in return str1 > str2 })
reversed
reversed = sort(names, { str1, str2 in return str1 > str2 })
reversed
reversed = sort(names, { str1, str2 in str1 > str2 })
reversed
reversed = sort(names, { $0 > $1 })
reversed
reversed = sort(names, >)
reversed
reversed = sort(names) { $0 > $1 }
reversed

func increment(first: Int, #amount: Int) -> Int {
    return first + amount
}

increment(10, amount: 20)

struct Point {
    var x, y: Double
    
    mutating func moveToTheRightBy(dx: Double) {
        x += dx // Mutating is necessary for modify property.
    }
}

var p = Point(x: 0.0, y: 1.0) // var is necessary.
p.moveToTheRightBy(10.0)
p

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

Planet.Earth.toRaw()

struct Resolution {
    var width: Int
    let height: Int
    
    init() {
        width = 0
        height = 0
    }
}

var res = Resolution()
res.width = 480

class StepCounter {
    var totalSteps: Int = 0 {
    willSet {
        println("about to set totalSteps to \(newValue)")
    }
    didSet {
        if totalSteps - oldValue > 0 {
            println("added \(totalSteps - oldValue) steps")
            totalSteps += 1 // Do not trigger observer again.
        }
        else {
            println("minused \(oldValue - totalSteps) steps")
        }
    }
    }
}

let sc = StepCounter()
sc.totalSteps = 1
sc.totalSteps = 3
sc.totalSteps = 0

class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    
    func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    
    init() {
        numberOfWheels = 0
        maxPassengers = 1
    }
}

class Car: Vehicle {
    var speed: Double = 0.0
    
    init()  {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    
    override func description() -> String {
        return super.description() + ";" + "traveling at \(speed) mph"
    }
}

class SpeedLimitedCar : Car {
    override var speed: Double {
    get {
        return super.speed
    }
    set {
        println("called")
        super.speed = min(newValue, 40.0)
    }
    }
}

let spCar = SpeedLimitedCar()
spCar.speed = 60.0
println("SpeedLimitedCar: \(spCar.description())")

class Food {
    var name: String
    init (name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient : Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name:name)
    }
    convenience init(name: String) {
        self.init(name:name, quantity: 1)
    }
    // Inherited from super class, thus optional if no further customization is needed.
    //convenience init() {
    //    self.init(name:"[Unnamed Ingredient]", quantity: 1)
    //}
}

let recep = RecipeIngredient()

class ShoppingListItem : RecipeIngredient {
    var purchased = false
    var description: String {
    var output = "\(quantity) x \(name.lowercaseString)"
        output += purchased ? " ✔️" : " ✖️"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true
for item in breakfastList {
    println(item.description)
}

