//Exercise-1: Create an empty dictionary and then perform add,update, delete operations on that.
var emptyDictionary = Dictionary<String,String> ()
//add function for dictionary
func addElement(key: String, value: String) {
    emptyDictionary[key] = value
}
//update function for dictionary
func updateElement(key: String, value: String) {
    emptyDictionary.updateValue(value, forKey: key)
}
//remove function for dictionary
func deleteElement(key: String) {
    emptyDictionary.removeValue(forKey: key)
}
//perform actions on dictionary
addElement(key: "key1", value: "val1")
addElement(key: "key2", value: "val2")
updateElement(key: "key1", value: "val")
deleteElement(key: "key1")
print("Dictionary after performing operations : \(emptyDictionary)")

//Exercise-2: Create a dictionary which should have double value from the last value of dictionary.
//Eg :- if n = 3 then dict should be [1:2, 2:4, 3:8]
var dictionaryWithDoublingValue = Dictionary<Int,Int> ()
func createDictionary(length: Int) {
    var value = 1
    for n in 1...length {
        value = value * 2
        dictionaryWithDoublingValue[n] = value
    }
    print("Dictionary with double value from the last value : \(dictionaryWithDoublingValue)")
}
createDictionary(length: 3)

//Exercise-3: You are given int in string format convert this into Int and find sum.
let numbersAsArrayOfString = ["1","2","3","hi","5"]
let arrayWithIntNumbers = numbersAsArrayOfString.compactMap { Int($0) }
let sum = arrayWithIntNumbers.reduce(0, +)
print("Sum of integers from given string array \(numbersAsArrayOfString) is \(sum)")
