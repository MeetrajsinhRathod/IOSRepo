import UIKit

//constant
let constantValue = 10
//variable
var variableValue = 23.9

//int,float can have _ in between or at end
var numberWith_ = 1_2

//type inference
let constant: Int = 10
var number: Int = 10
var result: Int = number + constant

print(type(of: variableValue))
let intValue = Int(variableValue)
print(type(of: intValue))

//--------------------------------------------------Strings--------------------------------------------------
let firstMessage = "hello"
let secondMessage = "good morning"
var message = firstMessage + secondMessage
message.uppercased()
message.lowercased()
message.count
print(message)

let string1 = "Hello world"
var stringArr = string1.split(separator: "")
for i in 2...7 {
    if stringArr[i] == "l" {
        stringArr[i] = "x"
    }
}
print(stringArr)
let ansStr = stringArr.joined()
print(ansStr)

//use other data type variable with string
let age = 20
var ageMessage = "My age is " + String(age)

//string interpolation "\(num)"
ageMessage = "My age is \(age)"

// escape sequences \n \"
//string delimiters
let threeMoreDoubleQuotationMarks = #"""
Here are three more \#n double quotes: """
"""#

//ascii - character conversion
let singleChar: Character = "a"
let ascii = singleChar.asciiValue!
print(UnicodeScalar(97)!)

//--------------------------------------------------Array--------------------------------------------------
//Array ordered allows-duplicates
let ageArray = [17, 50, 13, 30, 24, 10]
let repeatingValueArray = Array(repeating: 10, count: 10)
// array filter function
let op1 = ageArray.filter({ $0 < 30 })
print(op1)


// map
let op2 = ageArray.map({ $0 + $0 })
print(op2)
let newArray: Any = [1, 2, "a", "b", 0]
print(newArray)

//compactMap
let numbers = ["1", "2", "3", "ghi", "5"]
let strings = numbers.map { Int($0) }
print(strings)
let str = numbers.compactMap { Int($0) }
print(str)
let ans = strings.map { if let x = $0
{
    return x
} else {
    print("value not")
    return 0
}
}
print(ans)

var ans1 = numbers.compactMap {
    Int($0)
}
print(ans1)

//flatmap
let arr2d = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let flatArr = arr2d.flatMap({ $0 })
print(flatArr)

// array - reduce
var arrayvar1 = [0, 2, 0, 4, 0, 3, 1, 0]
let midpoint = arrayvar1.count / 2
let firstHalf = arrayvar1[..<midpoint]
let secondHalf = arrayvar1[midpoint...]
let firstHalfSum = firstHalf.reduce(0, +)
let secondHalfSum = secondHalf.reduce(0, +)
if firstHalfSum > secondHalfSum {
    print("More absences in the first half.")
} else {
    print("More absences in the second half.")
}

//array - print elements
let colours = ["red", "green", "blue"]
print(colours)
colours.forEach { colour in
    print(colour)
}
for index in 0...colours.count - 1 {
    print(colours[index])
}
for colour in colours {
    print(colour)
}

//--------------------------------------------------Tuple--------------------------------------------------
let NameAge = ("Meetraj", 20)
let (Name, Age) = NameAge
print("Name is \(Name)")
print("Age is \(Age)")
let(FirstName, _) = NameAge
print("First name is \(FirstName)")

let details = (subCode: 2, description: "Maths")
print("The code is \(details.subCode)")
print("The subject is \(details.description)")

//--------------------------------------------------Sets--------------------------------------------------
//Sets unordered no-duplicates high performance  -- it uses hash
let odd: Set = [1, 3, 5, 7, 9]
let even: Set = [0, 2, 4, 6, 8]
let primeNumbers: Set = [2, 3, 5, 7]

odd.union(even)
odd.intersection(even)
odd.subtracting(primeNumbers)
odd.symmetricDifference(primeNumbers)

//--------------------------------------------------Dictionaries--------------------------------------------------
var dictionaryOne: [String: String] = ["1": "2"]
dictionaryOne = [:]
var bookCollectionDict = ["1": "Tool of Titans", "2": "Rework", "3": "Authority"]
for (key, value) in bookCollectionDict {
    print("ISBN: \(key)")
    print("Title: \(value)")
}
// swap keys with values
bookCollectionDict = Dictionary(uniqueKeysWithValues: zip(bookCollectionDict.values, bookCollectionDict.keys))
var swappedDict = Dictionary(uniqueKeysWithValues: bookCollectionDict.map { (key, value) in return (value, key) })
print(swappedDict)

var dictionaryMirror = bookCollectionDict.customMirror
print(dictionaryMirror)
dictionaryMirror.children.forEach {
    print(($0.value))
}

//--------------------------------------------------Conditions--------------------------------------------------
//if-else
if age >= 18 {
    print("You can vote")
} else {
    print("You can not vote")
}
//ternary operator
age >= 18 ? print("You can vote") : print("You can not vote")

//nested switch with tuple as case
var tup = (month: 12, date: 1)
switch tup {
case (let x, 1):
    switch x {
    case 12:
        print("month is 1212121")
    default:
        print("default")
    }
case (_, 1):
    print("date is 1")
default:
    print("default")
}
var num = 2
var randomVar = 3
switch num {
case num where num % 2 == 0 && randomVar == 3:
    print("\(num) is even")
case num where num % 2 == 1:
    print("\(num) is odd")
default:
    print("Invalid")
}

//--------------------------------------------------Optionals--------------------------------------------------
var msg: String?
msg = "This is message."
if msg != nil {
    print(msg!)
} else {
    print("no value found")
}
func checkAge() {
    let age: Int? = 22
    guard let myAge = age else {
        print("Age is undefined")
        return
    }
    print("My age is \(myAge)")
}
checkAge()

//get -set
var y = 10
var x:Int {
    get{
        print("From get")
        return y
    }
    set{
        print("From set")
    }
}
x = 20
print(x)
