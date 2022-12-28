//new Object /clas?
struct Town {
    let name = "Angeland"
    var citizens = ["Angela","Jack Bauer"]
    var resources = ["Grain": 100, "Ore": 42, "Wool": 75]


    //method - a function inside a class or a struct
    func fortify() {
        print("Defences increased!")
    }
}

var myTown = Town()

print(myTown.citizens)
print("\(myTown.name) has \(myTown.resources["Grain"]!) bags of grain. ") // Angeland has 100 bags of grain

myTown.citizens.append("Keanu Reeves")// add to an array
print(myTown.citizens.count)

myTown.fortify()
