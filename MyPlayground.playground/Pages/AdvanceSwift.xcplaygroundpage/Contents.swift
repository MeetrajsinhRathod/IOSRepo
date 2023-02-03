//--------------------------------------------------Functions--------------------------------------------------
func hello(name: String) {
    print("Hello \(name)")
}
hello(name: "meetraj")

func sum(_ num1: Int, _ num2: Int) -> Int {
    print("sum of \(num1) and \(num2) is \(num1 + num2)")
    return num1 + num2
}
sum(1, 2)

//inout keyword in functions
func swap(num1: inout Int, num2: inout Int) {
    let temp = num1
    num1 = num2
    num2 = temp
}
var num1 = 2
var num2 = 10
swap(num1: &num1, num2: &num2)
print("Swapped values are \(num1), \(num2)")

//variadic
func variadicFunc(members: Int...) {
    for member in members {
        print(member)
    }
}
variadicFunc(members: 4, 3, 5)

//function with optional return type
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
minMax(array: [234, 6, 63, 24, 5, 65, 64, 65])

// function as an argument
func greet(name: String) {
    print("hello \(name)")
}
func printHello(hello: (String) -> Void, age: Int, firstName: String) {
    hello(firstName)
    print("age is \(age)")
}
printHello(hello: greet, age: 20, firstName: "meetraj")

//--------------------------------------------------Closures--------------------------------------------------
let getName: (String) -> (String) = { (name) in
    return("name is \(name)")
}
getName("meetraj")
// closure as a function parameter
func functionWithClosureParameter(closureInFunction: () -> ()) {
    closureInFunction()
    print("Hello")
}
//trailing closure
functionWithClosureParameter {
    print("from closure")
}
//auto closures
func writeToFile(write: Bool, getData: (String) -> String) {
    if(write) {
        print(getData("abc"))
        print("Writing Data")
    } else {
        print("Not writing")
    }
}
writeToFile(write: true, getData: { str in
    return str
})
//capture list
var str = Student("Meetraj", 1)
var myClosure = { [str] in
    print (str)
}
str = Student("Harsh", 2)
let inc = myClosure
inc()

////--------------------------------------------------Enumeration--------------------------------------------------
//Enum with function
enum CompassPoint: String {
    case north = "north"
    case south
    case east
    case west

    func getCurrentDirection() {
        print("current direction is: \(self)")
    }
}
var direction = CompassPoint.north
direction = .east
direction.getCurrentDirection()

//Case-Iterable And rawValue
enum ColorName: Int, CaseIterable {
    case black = 1, silver, gray, white, maroon, red, purple, fuchsia, green,
    lime, olive, yellow, navy, blue, teal, aqua
}
var color = ColorName.black
print(color.rawValue)
color = .blue
print(color.rawValue)
color = ColorName(rawValue: 3)!
print(color)

for color in ColorName.allCases {
    print("\(color)")
}

//Associated Values
enum ColorCode {
    case rgb(red: Int, green: Int, blue: Int)
}
let rgbColor = ColorCode.rgb(red: 100, green: 0, blue: 0)
print("rgb color code is : \(rgbColor)")


//recursive enum
indirect enum recursiveEnum {
    case number(Int)
    case add(recursiveEnum, recursiveEnum)
    case multiply(recursiveEnum, recursiveEnum)
}
//(5+4)*2
let five = recursiveEnum.number(5)
let four = recursiveEnum.number(4)
let sum = recursiveEnum.add(five, four)
let product = recursiveEnum.multiply(sum, recursiveEnum.number(2))

func evaluate(_ expression: recursiveEnum) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .add(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiply(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))

enum num {
    case num1(Int)
    case num2
}

var n = num.num2

switch n {
case .num1(let n1): print("val from num1 is \(n1)")
default:
    print("")
}

//--------------------------------------------------Structures--------------------------------------------------
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var someResolution = Resolution()
let someOtherResolution = Resolution()
let someVideoMode = VideoMode()

someResolution.width = 100
print(someOtherResolution.width)
someVideoMode.frameRate = 60

//memberwise initializer
let vga = Resolution(width: 640, height: 480)
vga.width

struct Person {
// properties with no default values
    var name: String
    var age: Int
}
// instance of Person with memberwise initializer
var person1 = Person(name: "Meetraj", age: 20)
print("Name: \(person1.name) and Age: \(person1.age)")

//--------------------------------------------------Classes--------------------------------------------------

class Student {
    var name: String
    var id: Int
    
    init(_ name: String, _ id: Int){
        self.name = name
        self.id = id
    }
    func getStudentInfo(){
        print("Name : \(self.name) Id : \(self.id)")
    }
}

let student1 = Student("Meetraj", 63)
student1.getStudentInfo()
let student2 = student1
print(student1 === student2)

let student3 = Student("Meetraj", 63)
print(student3 === student2)
