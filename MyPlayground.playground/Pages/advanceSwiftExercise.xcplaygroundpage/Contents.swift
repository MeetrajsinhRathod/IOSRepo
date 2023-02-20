import Foundation

//---------------------------------------------------------------------------Class---------------------------------------------------------------------------
//1) Create a swift program to demonstrate swift class. Which has two variables inside class body. Access (Set its values and get its value.) these variables by creating one instance of class.

class PersonInfo {
    var name = "name"
    var age = 0
}

var person1 = PersonInfo()
person1.name = "Meetraj"
person1.age = 20
print(person1.name)
print(person1.age)

//2) Create a swift program to demonstrate usage of swift class for usage of multiple initializers. Create one initializer with two parameters your name and college and another initializer with your name and department. You can be able to access these properties using instance of class.

class Student {
    var name: String?
    var college: String?
    var department: String?

    init(name: String, college: String) {
        self.name = name
        self.college = college
    }

    init(name: String, department: String) {
        self.name = name
        self.department = department
    }
}

var student1 = Student(name: "Meetraj", college: "Charusat")
var student2 = Student(name: "Meetraj", department: "IT")

//3) Create a swift class without initializers and access (write, read) its properties using instance of class.

class studentWithoutInit {
    var name = ""
    var age = 0
}
var student3 = studentWithoutInit()

student3.name = "Meetraj"
student3.age = 20

print("Name: \(student3.name) Age: \(student3.age)")

//4) Create a swift class which is having code to return square of given number and access this code using class instance.

class Square {
    func findSquare(num: Int) -> Int {
        return num * num
    }
}

let objOfSquare = Square()
objOfSquare.findSquare(num: 2)

//5) Create a swift class example to show use of swift inheritance. Your base class has some property access this property. In two different child classes and show its usage using the instances of both child classes.
//6) Create a swift class example to show use of swift base class which have some implementation inside any method. Now demonstrate usage of overriding that method implementation.

class Shape {
    var type: String = "type"
    var color: String = "color"

    func describeShape() {
        print("It has a \(type) shape, it is of \(color) color.")
    }
}

class Circle: Shape {
    var name: String = "name"

    init(name: String, color: String) {
        self.name = name
        super.init()
        super.type = "Circle"
        super.color = color
    }
    override func describeShape() {
        print("This is a \(name). It has a circle shape. It is of \(color) color")
    }
}
class Triangle: Shape {
    var name: String = "name"

    init(name: String, color: String) {
        self.name = name
        super.init()
        super.type = "Triangle"
        super.color = color
    }
    override func describeShape() {
        print("This is a \(name). It has a triangle shape. It is of \(color) color")
    }
}

let donut = Circle(name: "Donut", color: "Brown")
donut.describeShape()

let cautionSign = Triangle(name: "Caution Sign", color: "Red")
cautionSign.describeShape()

//7) Create a swift class with an initializer in a manner that you can create this class using initializing value. And one function which takes int input and returns the power of class instance.
//example:  let instance = Example(value: 5)
//   let result = instance.doPower(power: 3)
//then it should return 5's 3 power (125)

class Ex {
    var value: Int

    init(value: Int) {
        self.value = value
    }

    func doPower(num: Int) -> Int {
        var res = 1
        for _ in 1...num {
            res = res * num
        }
        return res
    }
}
let instance = Ex(value: 5)
let result = instance.doPower(num: 3)

//8) Create a swift class example which has a parent class for vehicles, and child classes for two different vehicles e.g. (bike & car). You need to use common properties and method in the parent class and inside child class, there will be some different property which is not common.

class Vehicles {
    var numberOfSeats = 0
    var stateCode = 0
    var name = ""

    func describeVehicle() {
        print("This is a vehicle")
    }
    func start() {
        print("Vehicle started")
    }
    func stop() {
        print("Vehicle stopped")
    }
}

class Bike: Vehicles {

    init(numberOfSeats: Int, stateCode: Int, name: String) {
        super.init()
        self.numberOfSeats = numberOfSeats
        self.stateCode = stateCode
        self.name = name
    }

    override func describeVehicle() {
        print("This is \(name). It has \(numberOfSeats) seats. It has \(stateCode) state code.")
    }
}

class Car: Vehicles {
    var numberOfAirbags = 0

    init(numberOfAirbags: Int, numberOfSeats: Int, stateCode: Int, name: String) {
        self.numberOfAirbags
        super.init()
        self.numberOfSeats = numberOfSeats
        self.stateCode = stateCode
        self.name = name
    }
    override func describeVehicle() {
        print("This is \(name). It has \(numberOfSeats) seats. It has \(numberOfAirbags) airbags. It has \(stateCode) state code.")
    }
}

let vespa = Bike(numberOfSeats: 2, stateCode: 2, name: "Vespa")
vespa.describeVehicle()

let bmw = Car(numberOfAirbags: 4, numberOfSeats: 4, stateCode: 1, name: "BMW")
bmw.describeVehicle()

//9) Create a person swift class with person name initializer and create one function to greet that person.
//Example: let person1 = Person(name: Joe)
// Person1.greet() // This should print “Hello Joe”

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }

    func greet() {
        print("Hello \(name)")
    }
}
let personObj = Person(name: "Meetraj")
personObj.greet()

//10) Create a swift class with some property. And then set its value using initializer of class, then perform below actions.
//let example1 = Example()
//Example1.a = “Hello”
//let example2 = example1
//example2.a = “Hi”
//print(example1.a)
//print(example2.a)
//// Consider ‘a’ as string property of example class.
//--> Check these two print outputs and try to find out the reason for that output.

class Example {
    var a = ""
}

let example1 = Example()
example1.a = "Hello"
let example2 = example1
example2.a = "Hi"
print(example1.a)
print(example2.a)

//---------------------------------------------------------------------------Structures---------------------------------------------------------------------------
//1) Create one structure of type Work, which have some properties like work location, work hours and one string array of project names. And create a function inside structure which returns all project names for the person.

struct Work {
    var workLocation: String
    var workHours: Int
    var projectNames = [String]()

    func returnProject() -> [String] {
        return projectNames
    }
}

var workingPerson = Work(workLocation: "work from home", workHours: 8, projectNames: ["a", "b", "c", "d"])
print(workingPerson.returnProject())

//2) Create a structure example which demonstrates use of initializer in structures.
//3) Create a structure program which can be initialized with parameters and it also should be able to initialized without parameters.

struct Bag {
    var type = "Carry Bag"
    var size = "Medium"
    var color = "Dark blue"

    init() {

    }
    init(type: String, size: String, color: String) {
        self.type = type
        self.size = size
        self.color = color
    }
}

var bag1 = Bag()
var bag2 = Bag(type: "Laptop Bag", size: "Small", color: "Grey")

//4) Create one structure which have initializer which takes array of int as input returns  two arrays one of all even numbers and another is all odd numbers.
//Input: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12]
//Output: even numbers are: [6, 8, 10, 8, 12]
//                Odd numbers are: [1, 3, 5, 9, 7]
struct OddEven {
    var array = [Int]()
    var evenArray = [Int]()
    var oddArray = [Int]()
    
    init(array: [Int]) {
        self.array = array
        evenArray = array.filter { $0 % 2 == 0 }
        oddArray = array.filter { $0 % 2 != 0 }
    }
}
var oddEvenObj = OddEven(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
print("even numbers are: \(oddEvenObj.evenArray)")
print("odd numbers are: \(oddEvenObj.oddArray)")

//5) Create one swift structure program for person that contains basic details like name, age, gender. Then create one array of person with all details. Print all details of that array.
//// Consider two persons array for Joe and Harry. But in your code Its size can be vary.
//Output be like: Name: Joe, Gender: Male, Age: 27
//     Name: Harry, Gender: Male, Age: 21

struct PersonStruct {
    var name: String
    var age: Int
    var gender: String

    init(name: String, age: Int, gender: String) {
        self.name = name
        self.age = age
        self.gender = gender
    }

    func printDetails() {
        print("Name: \(name), Gender: \(gender), Age: \(age)")
    }
}
var personArray = [PersonStruct(name: "Meetraj", age: 20, gender: "Male"), PersonStruct(name: "Dhvanil", age: 17, gender: "Male")]
for person in personArray {
    person.printDetails()
}

//6) Perform same example given in class question no 10 and check output using structure. Try to find difference between these two outputs and try to figure out the reason for that output.
//7) Try to figure out basic difference between class and structures and give a demo for same.

struct ExampleStruct {
    var a = ""
}

var exampleStruct1 = ExampleStruct()
exampleStruct1.a = "Hello"
var exampleStruct2 = exampleStruct1
exampleStruct2.a = "Hi"
print(exampleStruct1.a)
print(exampleStruct2.a)

//---------------------------------------------------------------------------Enums---------------------------------------------------------------------------
//1) Write swift program using enumerations to check week day from given number. Consider Monday as 1 and Sunday as 7. We can be able to get day name as string in short form (sun, mon,...) and same full name (Sunday, Monday...) by given number of the day.
//Example. It should return Monday or mon if I pass parameter 1 for get day name.
enum Weekdays {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday

    func getDayName(day: Int) -> String {
        switch day {
        case 1:
            return "Monday"
        case 2:
            return "Tuesday"
        case 3:
            return "Wednesday"
        case 4:
            return "Thursday"
        case 5:
            return "Friday"
        case 6:
            return "Saturday"
        case 7:
            return "Sunday"
        default:
            return "Not available"
        }
    }
}
var monday = Weekdays.monday
print(monday.getDayName(day: 2))

//2) Create one enumeration program to return number of days in a month.

enum Month {
    case january, february, march, april, may, june, july, august, september, october, november, december

    func numberOfDays(year: Int) -> Int {
        switch self {
        case .january, .march, .may, .july, .august, .october, .december:
            return 31
        case .april, .june, .september, .november:
            return 30
        case .february:
            if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) {
                return 29
            } else {
                return 28
            }
        }
    }
}
let jan = Month.january
let numberOfDaysInJanuary = jan.numberOfDays(year: 2022)

let feb = Month.february
let numberOfDaysInFebruary = feb.numberOfDays(year: 2022)

//3) Write a swift program using enumerations to demonstrate Int enums.

enum numberWords: Int {
    case zero = 0, one, two, three, four, five, six, seven, eight, nine
}
var one = numberWords.one
one.rawValue

//4) Write a swift program to demonstrate string type enum.
//5) Write a swift program for enum with raw values.
//8) Create an enum with its rawValues of type String and show usage of case to print value of case.

enum CompassPoint: String {
    case north = "north"
    case south
    case east
    case west

    func getCurrentDirection() {
        print("current direction is: \(self.rawValue)")
    }
}
var direction = CompassPoint.north
direction.getCurrentDirection()

//6) Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and without use of CaseIterable(Mandatory).

enum colors: Int, CaseIterable {
    case black = 1, white, gray, red, purple
    
    func enumerateCases() {
        switch colors.black {
        case colors.black:
            print(colors.black)
            fallthrough
        case colors.white:
            print(colors.white)
            fallthrough
        case colors.gray:
            print(colors.gray)
            fallthrough
        case colors.red:
            print(colors.red)
            fallthrough
        case colors.purple:
            print(colors.purple)
        }
    }
}

for color in colors.allCases {
    print(color)
}

var colorBlack = colors.black
colorBlack.enumerateCases()


//7) Write a swift program using enumerations for learn and demonsrate enum cases with parameters (Enum with associated values).

enum ColorCode {
    case rgb(red: Int, green: Int, blue: Int)
}
let rgbColor = ColorCode.rgb(red: 100, green: 0, blue: 0)
print("rgb color code is : \(rgbColor)")

//---------------------------------------------------------------------------Error Handling---------------------------------------------------------------------------
//1. Create a password validation program. If length of password is less than 8 characters, it throws “Password too short” exception and if password is empty, throw “Empty password” exception.
enum PasswordError: Error {
    case tooShort, emptyPass
}
func checkPassword(password: String) throws {
    if password.count < 8 {
        throw PasswordError.tooShort
    }
    if password.isEmpty {
        throw PasswordError.emptyPass
    }
}

let string = "1245"

do {
    try checkPassword(password: string)
}
    catch PasswordError.tooShort {
    print("Password is too short")
}
catch PasswordError.emptyPass {
    print("Password can not be empty")
}

//2. Create a program for shopping cart. If desired quantity for an item is not available, throw exception.

enum quantityError: Error {
    case insufficientQuantity
}
var items = ["item1": 20, "item2": 10, "item3": 5]

func shop(item1: Int, item2: Int, item3: Int) throws {
    var val1 = items["item1"]! - item1
    var val2 = items["item2"]! - item2
    var val3 = items["item3"]! - item3
    
    if val1 < 0 || val2 < 0 || val3 < 0{
        throw quantityError.insufficientQuantity
    }
}

do {
    try shop(item1: 18, item2: 5, item3: 10)
}
catch quantityError.insufficientQuantity {
    print("Item not available")
}
