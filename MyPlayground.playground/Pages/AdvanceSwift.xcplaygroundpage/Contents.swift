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
printHello(hello: greet,age: 20,firstName: "meetraj")

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
func writeToFile(write: Bool, getData: @autoclosure() -> String) {
    if(write) {
        print(getData())
        print("Writing Data")
    } else {
        print("Not writing")
    }
}
writeToFile(write: true, getData: "file-data")
//capture list
var str = "Hello, World!"
var myClosure = { [str] in
    print (str)
}
str = "next"
let inc = myClosure
inc()

//--------------------------------------------------Enumeration--------------------------------------------------
enum CompassPoint {
    case north
    case south
    case east
    case west
    
    func functionFromEnum(){
        print("from enum \(self)")
    }
}
var direction = CompassPoint.north
direction = .east
switch direction {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

enum ColorName: String, CaseIterable {
    case black, silver, gray, white, maroon, red, purple, fuchsia, green,
      lime, olive, yellow, navy, blue, teal, aqua
}
let color = ColorName.black
print(color)
for color in ColorName.allCases {
  print("\(color)")
}
