import Foundation

//You are given a dictionary code of type [String:String] which has values for all lowercase letters. The codedictionary represents a way to encode a message. For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz". You are also given a encodedMessage which contains only lowercase letters and spaces. Use the codedictionary to decode the message and print it. Write a Swift program to decode the message and print final output string
let code = ["a": "b", "b": "c", "c": "d", "d": "e", "e": "f", "f": "g", "g": "h", "h": "i", "i": "j",
    "j": "k", "k": "l", "l": "m", "m": "n", "n": "o", "o": "p", "p": "q", "q": "r", "r": "s",
    "s": "t", "t": "u", "u": "v", "v": "w", "w": "x", "x": "y", "y": "z", "z": "a", " ": " "]

var message = "uijt nfttbhf jt ibse up sfbe"

var decodeDictionary: [String: String] = [:]

// reverse the code
for (key, value) in code {
    decodeDictionary[value] = key
}

var decodedMessage = ""

for char in message {
    let character = "\(char)"

    if let encodedChar = decodeDictionary[character] {
        // letter
        decodedMessage += encodedChar
    } else {
        // space
        decodedMessage += character
    }
}

print(decodedMessage)

//2) You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. Create an array of strings called firstNames that contains only the values for “firstName” from each dictionary.
//Input:
//var people: [[String:String]] = [
//[
//"firstName": "Calvin",
//"lastName": "Newton"
//],
//[
//"firstName": "Garry",
//"lastName": "Mckenzie"
//],
//[
//"firstName": "Leah",
//"lastName": "Rivera"
//],
//[
//"firstName": "Sonja",
//"lastName": "Moreno"
//],
//[
//"firstName": "Noel",
//"lastName": "Bowen"
//]
//]
//Output: firstNames = ["Calvin","Garry","Leah","Sonja","Noel"]
var people: [[String: String]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton"
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie"
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera"
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno"
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen"
    ]
]
var firstNameArray: [String] = []

for person in people {
    for (key, value) in person {
        if key == "firstName" {
            firstNameArray.append(value)
        }
    }
}

print(firstNameArray)

//3) You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. Create an array of strings called fullNames that contains the values for “firstName” and “lastName” from the dictionary separated by a space.
//Input:
//var people: [[String:String]] = [
//[
//"firstName": "Calvin",
//"lastName": "Newton"
//],
//[
//"firstName": "Garry",
//"lastName": "Mckenzie"
//],
//[
//"firstName": "Leah",
//"lastName": "Rivera"
//],
//[
//"firstName": "Sonja",
//"lastName": "Moreno"
//],
//[
//"firstName": "Noel",
//"lastName": "Bowen"
//]
//]
//Output:
//fullNames = ["Calvin Newton","Garry Mckenzie","Leah Rivera",
//"Sonja Moreno","Noel Bowen"]
var fullNameArray: [String] = []

for person in people {
    var fullName = " "
    for (key, value) in person {
        if key == "lastName" {
            fullName = fullName + value
        } else {
            fullName = value + fullName
        }

    }
    fullNameArray.append(fullName)
}

print(fullNameArray)

//4) You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Find the person with the lowest score and print his full name.
//Input:
//var people: [[String:Any]] = [
//[
//"firstName": "Calvin",
//"lastName": "Newton",
//"score": 13
//],
//[
//"firstName": "Garry",
//"lastName": "Mckenzie",
//"score": 12
//],
//[
//"firstName": "Leah",
//"lastName": "Rivera",
//"score": 10
//],
//[
//"firstName": "Sonja",
//"lastName": "Moreno",
//"score": 3
//],
//[
//"firstName": "Noel",
//"lastName": "Bowen",
//"score": 16
//]
//]
//Output:
//Sonja Moreno
var peopleScore: [[String: Any]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 12
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
]

var leastScorePerson = peopleScore[0]
var leastscore = leastScorePerson["score"] as! Int

for person in peopleScore {
    if let score = person["score"] as? Int {
        if leastscore > score {
            leastscore = score
            leastScorePerson = person
        }
    }
}
print(leastScorePerson["firstName"]!, leastScorePerson["lastName"]!)

//5) You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Print the leaderboard in the following format:
//1. full name - score
//2. ...
//...
//Input:
//var people: [[String:Any]] = [
//[
//"firstName": "Calvin",
//"lastName": "Newton",
//"score": 13
//],
//[
//"firstName": "Garry",
//"lastName": "Mckenzie",
//"score": 23
//],
//[
//"firstName": "Leah",
//"lastName": "Rivera",
//"score": 10
//],
//[
//"firstName": "Sonja",
//"lastName": "Moreno",
//"score": 3
//],
//[
//"firstName": "Noel",
//"lastName": "Bowen",
//"score": 16
//]
//]
//Output:
//1. Garry Mckenzie - 23
//2. Noel Bowen - 16
//3. Calvin Newton - 13
//4. Leah Rivera - 10
//5. Sonja Moreno - 3

var sortedScore = peopleScore.sorted(by: { ($0["score"] as! Int) > ($1["score"] as! Int) })
print(sortedScore)

for (index, person) in sortedScore.enumerated() {
    if let firstName = person["firstName"] as? String {
        if let lastName = person["lastName"] as? String {
            if let score = person["score"] as? Int {
                print("\(index + 1). \(firstName) \(lastName) - \(score)")
            }
        }
    }
}

//6) You are given an array of integers. Find out the frequency of each one.The frequency of a number is the number of times it appears in the array.Print the numbers in ascending order followed by their frequency.
//Input:
//var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
//Output:
//1 2
//2 6
//3 3
//4 1
//5 1
let numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
let mappedItems = numbers.map { ($0, 1) }

//add the 1s together every time it finds a duplicate key:
let counts = Dictionary(mappedItems, uniquingKeysWith: +)

print(counts.sorted(by: <))


//----------------------Loops
//1) Print the powers of 2 that are less than or equal to N.
//Input:
//var N = 100
//Output:
//2
//8
//16
//32
//64
var power = 1
while (pow(2, power) < 100) {
    print(pow(2, power))
    power += 1
}

//2) Given an integer N draw a square of N x N asterisks. Look at the examples.
//Input:
//var N = 3
//Output:
//***
//***
//***
for _ in 1...3 {
    for _ in 1...3 {
        print("*", terminator: "")
    }
    print("")
}

//3) Given an integer N draw a triangle of asterisks. The triangle should have N lines, the i-th line should have i asterisks on it.
//Input:
//var N = 4
//Output:
//*
//**
//***
//****
var n = 4

for i in 1...n {
    for _ in 1...i {
        print("*", terminator: "")
    }
    print("")
}

//4) Given an integer N draw a pyramid of asterisks. The pyramid should have N lines. On the i-th line there should be N-i spaces followed by i*2-1 asterisks.
//Input:
//var N = 4
//Output:
//    *
//   ***
//  *****
// *******
for i in 1...n {
    for _ in 0..<(n - i) {
        print(" ", terminator: "")
    }
    for _ in 1...2 * i - 1 {
        print("*", terminator: "")
    }
    print("")
}

//5)You are given a number. Print "prime" if the number is a prime and "not prime" otherwise. A number is a prime if it has exactly 2 distinct divisors (1 and itself).
//Input:
//var number = 17
//Output:
//prime //17 is only divisible by 1 and 17
var number = 17
var factor = 1
for i in 1...n {
    if(number % i == 0) {
        factor += 1
    }
}

factor == 2 ? print("prime") : print("not prime")
