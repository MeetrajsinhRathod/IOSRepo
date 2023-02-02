//Exercise-1: Create an empty dictionary and then perform add,update, delete operations on that.
var emptyDictionary = Dictionary<String,String>()
//add function for dictionary
func addElement(addKey: String, addValue: String) {
    emptyDictionary[addKey] = addValue
}
//update function for dictionary
func updateElement(dictKey: String, updatedValue: String) {
    emptyDictionary.updateValue(updatedValue, forKey: dictKey)
}
//remove function for dictionary
func deleteElement(deleteKey: String) {
    emptyDictionary.removeValue(forKey: deleteKey)
}
//perform actions on dictionary
addElement(addKey: "key1", addValue: "val1")
addElement(addKey: "key2", addValue: "val2")
updateElement(dictKey: "key1", updatedValue: "val")
deleteElement(deleteKey: "key1")
print("Dictionary after performing operations : \(emptyDictionary)")

//Exercise-2: Create a dictionary which should have double value from the last value of dictionary.
//Eg :- if n = 3 then dict should be [1:2, 2:4, 3:8]
var dictionaryWithDoublingValue = Dictionary<Int,Int>()
func createDictionary(firstKey: Int, firstValue: Int, length: Int) {
    var temp = 1
    for n in 1...length {
        temp = temp * 2
        dictionaryWithDoublingValue[n] = temp
    }
    print("Dictionary with double value from the last value : \(dictionaryWithDoublingValue)")
}
createDictionary(firstKey: 1, firstValue: 2, length: 3)

//Exercise-3: You are given int in string format convert this into Int and find sum.
let numbersAsArrayOfString = ["1","2","3","hi","5"]
let arrayWithIntNumbers = numbersAsArrayOfString.compactMap { Int($0) }
let sum = arrayWithIntNumbers.reduce(0, +)
print("Sum of integers from given string array is \(sum)")

//Exercise-4: Replace m with w in string. For eg :- Simform should be Siwforw
let stringOne = "Simform"
var stringTwo = ""
stringOne.forEach{ char in
    char == "m" ? stringTwo.append("w") : stringTwo.append(String(char))
}
print("String after replacing 'm' with 'w' : \(stringTwo)")

//Exercise-5: Reverse a string
stringTwo = String(stringOne.reversed())
print("Reversed String is : \(stringTwo)")

//Exercise-6: You are given the firstName and lastName of a user. Create a string variable called fullName that contains the full name of the user.
let firstName = "Meetraj"
let lastName = "Rathod"
let fullName = firstName + " " + lastName

//Exercise-7: You are given a dictionary code of type [String:String] which has values for all lowercase letters.
//The codedictionary represents a way to encode a message. For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz".
//You are also given a message which contains only lowercase letters and spaces.
//Use the code dictionary to encode the message and print it.
let code = ["a" : "b", "b" : "c", "c" : "d", "d" : "e", "e" : "f", "f" : "g", "g" : "h", "h" : "i", "i" : "j",
            "j" : "k", "k" : "l", "l" : "m", "m" : "n", "n" : "o", "o" : "p", "p" : "q", "q" : "r", "r" : "s",
            "s" : "t", "t" : "u", "u" : "v", "v" : "w", "w" : "x", "x" : "y", "y" : "z", "z" : "a", " " : " "]
let message = "wow this problem is hard"
var encodedMsg = ""
message.forEach{ char in
    guard let encode = code[String(char)] else { return }
    encodedMsg.append(encode)
}
print("Encoded message is : \(encodedMsg)")

//Exercise-8: Find the longest word from string
//Eg :- “Hi I am a Trainee Engineer in Mobile Department”
//Output - “Department”
let longString = "Hi I am a Trainee Engineer in Mobile Department"
var longestWord = ""
let longStringArray = longString.split(separator: " ")
longStringArray.forEach{ word in
    if word.count > longestWord.count {
        longestWord = String(word)
    }
}
print("Longest word in given string is : \(longestWord)")
