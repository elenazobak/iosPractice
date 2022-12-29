//new Object /class/ blueprint

struct Town {
    let name = "Angeland"
    var citizens = ["Angela","Jack Bauer"]
    var resources = ["Grain": 100, "Ore": 42, "Wool": 75] // dictionary


    //method - a function inside a class or a struct
    func fortify() {
        print("Defences increased!")
    }
}

var myTown = Town() creates new Town object

print(myTown.citizens)
print("\(myTown.name) has \(myTown.resources["Grain"]!) bags of grain. ") // Angeland has 100 bags of grain

myTown.citizens.append("Keanu Reeves")// add to an array
print(myTown.citizens.count)

myTown.fortify()

//*********


struct Town {
    let name = String
    var citizens = [String]
    var resources = [String: Int]
// init -> constructor?
    init (name: String, citizens: [String], resources: [String: Int]) {
    self.name = name
    self.citizens = citizens
    self.resources = resources
    }

    //method - a function inside a class or a struct
    func fortify() {
        print("Defences increased!")
    }
}

var anotherTown = Town(name: "island", citizens: ["Tom Hanks"], resources: ["bla": 3] )
//***************************
// Define a struct
struct User {
    var name: String
    var email: String?
    var followers: Int
    var isActive: Bool
    
    func logStatus() {
        if (isActive) {
            print("\(name) is working hard")
        } else {
            print("\(name) has left earth")
        }
    }
}

// Initialise the struct
var branson = User(name: "Richard", email: nil, followers: 0, isActive: false)
branson.logStatus()
