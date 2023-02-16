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
print("Sum of integers from given string array \(numbersAsArrayOfString) is \(sum)")
