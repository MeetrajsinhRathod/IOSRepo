import Foundation
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

// function as a return type
func hello() -> String {
    return "hello there"
}
func greet() -> () -> String {
    return hello
}
var greetings = greet()
greetings()


class Student {
    var name: String = "Student"
    var id: Int = 0

    init(_ name: String, _ id: Int) {
        self.name = name
        self.id = id
    }

    init() { }

    deinit {
        print("deinit")
    }
}

var obj = Student("Meetraj", 63)

func printStudentInfo(st1: Student) -> Student {
    print(st1.name)
    st1.name = "harsh"
    print(st1.name)
    return st1
}

var objCopy = printStudentInfo(st1: obj)

func printStudentInfoWithInOut(st1: inout Student) -> Student {
    print(st1.name)
    st1 = Student("Rahul", 3)
    print(st1.name)
    return st1
}
objCopy = printStudentInfoWithInOut(st1: &obj)

//mutating function
struct Resolution {
    var width: Int = 1
    var height: Int = 1

    mutating func pixels() {
        width = 2
    }
}
var r = Resolution(width: 3, height: 4)
r.pixels()
r.width
