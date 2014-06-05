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

struct APoint {
    var x, y: Double
    
    mutating func moveToTheRightBy(dx: Double) {
        x += dx // Mutating is necessary for modify property.
    }
}

var p = APoint(x: 0.0, y: 1.0) // var is necessary.
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

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms //error
//john.residence = Residence()

/*

在Case1中，roomCount是Int?类型

而Case2使用了可选变量绑定（Optional Binding）：
即在if或while的条件语句中声明新变量。roomCount是Int类型。

而字符串变量替换操作\()能够自动处理可选变量。在nil的时候，直接输出"nil"。
也就是说，如果不关心roomCount:Int?（Case1）是否是nil，
完全可以与roomCount:Int（Case2）一样处理。

因为Case1的if语句保证了roomCount:Int?肯定有有效值，
因此，替换时能够随意使用roomCount或roomCount!。

而Case2中，roomCount已经是Int类型了，因此只能用roomCount。
（有点绕，基本就是这样的情况。

*/

// Case 1: roomCount in println, could use both roomCount or roomCount! Odd!
let roomCount = john.residence?.numberOfRooms
if roomCount {
    println("John's residence has \(roomCount!) room(s).")
}
else {
    println("Unable to retrive the number of rooms.")
}

// Case 2
if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
}
else {
    println("Unable to retrive the number of rooms.")
}

let possibleNumber = "abc" // "123"
let convertedNumber = possibleNumber.toInt()
println("\(possibleNumber) has integer value of \(convertedNumber)") // Exception if use convertedNumber! 

class FirstLevel {
    var next: SecondLevel?
}

class SecondLevel {
    func nothingReturn() {
        
    }
}

class ZeroLevel {
    let identity = "Level 0"
}

class SubFirstLevel : FirstLevel {
    var previous: ZeroLevel?
}

class SupFirstLevel : FirstLevel {
    var sup = "A little over first level"
}

let f = FirstLevel()
f.next = SecondLevel()

if f.next?.nothingReturn() {
    println("returned Void!")
}
else {
    println("got nil.")
}

let sfs = [SubFirstLevel(), SubFirstLevel(), SubFirstLevel(), SupFirstLevel()]

for f in sfs {
    if f is SupFirstLevel {
        let spf = f as SupFirstLevel
        println("Got a sup: \(spf.sup)")
    }
}

let objs: Any[] = [Int(), FirstLevel(), ZeroLevel(), Person()]
let sameObjects: AnyObject[] = [FirstLevel(), SubFirstLevel(), Person()]

println("Hello Swift")

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x:2.0, y:2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size:Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x:originX, y:originY), size:size)
    }
}

let centerRect = Rect(center: Point(x:4.0, y:4.0), size:Size(width:3.0, height:3.0))

let num0: Int = 10 * 10

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch : Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}

class Light {
    var state: Bool
    
    init() {
        self.state = false
    }
    
    func toggle() {
        self.state = !self.state
    }
    
    func description() -> String {
        let stateString = self.state ? "On" : "Off"
        return "Light is now \(stateString)."
    }
}
extension Light : Togglable {}

let aLight = Light()
println(aLight.description())
aLight.toggle()
println(aLight.description())

let aTogglableObject: Togglable = Light()

//extension Light : Togglable {} // Xcode的编辑器不支持识别后声明的protocol? 编译是可以通过的。

protocol Container {
    typealias T
    mutating func append(item: T)
    var count:Int { get }
    subscript (i: Int) -> T { get }
}


