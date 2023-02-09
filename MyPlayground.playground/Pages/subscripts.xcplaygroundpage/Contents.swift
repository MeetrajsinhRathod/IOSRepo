//--------------------------------------------------Subscript--------------------------------------------------

class DaysOfAWeek {
    var days = ["Monday", "Tuesday", "Wednesday",
        "Thursday", "Friday", "Saturday", "Sunday"]
    subscript(index: Int) -> String {
        get {
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
        }
    }

}
var day = DaysOfAWeek()
print(day[0])

class Animal {
    var name = ["Dog"]

    subscript() -> String {
        get {
            return name.description
        }
        set {
            name.append(newValue)
        }
    }
    subscript(subs2 index: Int) -> String {
        get {
            print("get from sub2")
            return name[index]
        }
        set {
            print("set from sub2")
            //name.insert(newValue, at: index)
        }
    }
}
let newAnimal = Animal()
newAnimal[] = "Cat"
newAnimal[subs2: 1] = "Cow"

//Type subscript
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune

    subscript(planet: Planet) -> Planet {
        return planet
    }
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let earth = Planet.earth

//instance subscript
let jupiter = earth[Planet.jupiter]

//type subscript
let mars = Planet(rawValue: 3)
print(Planet[3])
