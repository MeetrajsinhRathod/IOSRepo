//--------------------------------------------------Strings--------------------------------------------------

//Write a Swift program to create a new string made of a copy of the first two characters of a given string. If the given string is shorter than length 2, return whatever there is.
//Input: “Simform”
//Output: “Si”

let inputString = "Simform"
let outputString = inputString.prefix(2)

//Write a Swift program to create a new string without the first and last character of a given string. The string length must be at least 2.
//Input: “Simform”
//Output: imfor

let inputString2 = "Simform"
var outputString2 = inputString2.dropFirst().dropLast()

//Write a Swift program that accept two strings and return their concatenation, except the first char of each string. The given strings length must be at least 1.
//Input: "Swift", "Examples"
//Output: wiftxamples
var str1 = "Swift"
var str2 = "Examples"

str1.removeFirst()
str2.removeFirst()
str1.append(str2)
print(str1)

//Write a Swift program to move the first two characters of a given string to the end. The given string length must be at least 2.
//Input: Swift
//Output: iftSw
var str3 = "Swift"
str3.append(str3.removeFirst())
str3.append(str3.removeFirst())
print(str3)

//Write a Swift program to test if a given string starts with "Sw".
//Input: Swift
//Output: true

var str4 = "Swift"
str4.contains("Sw")

//Write a Swift program to create a new string made of the first and last n chars from a given string. The string length will be at least n.
//Input: “Simform Solutions”, 3
//Output: Simons

var inputString3 = "Simform Solutions"
var outputString3 = inputString3.prefix(3) + inputString3.suffix(3)
print(outputString3)

//--------------------------------------------------Arrays--------------------------------------------------

//Write a Swift program to check whether the first element and the last element of a given array of integers are equal. The array length must be 1 or more.
//Input: [1,2,3,1]
//Output: true
var arr1 =  [1,2,3,1]
arr1.first == arr1.last ? print("equal") : print("not equal")

//Write a Swift program to create a new array with double the length of a given array of integers and its last element is the same as the given array. The given array will be length 1 or more. By default, a new integer array contains all 0's.
//Input: [1,2,3,4]
//Output: [0,0,0,0,0,0,0,4]
var arr2 =  [1,2,3,4]
var newArr = Array(repeating: 0, count: arr2.count * 2)
newArr[newArr.count - 1] = arr2.last ?? 0
newArr

//Write a Swift program to create a new array, taking first two elements from a given array of integers. If the length of the given array is less than 2 use the single element of the given array
//Input: [0,1,2,3]
//Output: [0,1]
var arr3 = [0,1,2,3]
var outputArray = [Int]()

if arr3.count > 2 {
    outputArray.append(contentsOf: arr3[0...1])
} else {
    outputArray.append(arr3[0])
}


//Write a Swift program to take one array and find out maximum number from that array
//Input: [0,50,100,20,80,150]
//Output: 150

let arr4 = [0,50,100,20,80,150]
print("maximum number: \(arr4.max()!)")

//Write a Swift program to take one array and sort it in descending order.
//Input: [0,5,6,2,10]
//Output: [10,6,5,2,0]
let arr5 = [0,5,6,2,10]
print("array in descending order: \(arr5.sorted(by: >))")

//Print all the numbers from listOfNumbers that are divisible by at least one number from divisors
//Input: var listOfNumbers = [1, 2, 3, 10, 100]
//var divisors = [2, 5]
//Output: 2,10,100

let listOfNumbers = [1, 2, 3, 10, 100]
let divisors = [2, 5]

let output = listOfNumbers.filter { num in
    divisors.contains{ num.isMultiple(of: $0) }
}
print(output)

