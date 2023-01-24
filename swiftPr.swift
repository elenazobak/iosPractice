//cloning -> sourse control -> clone

ViewDidLoad -  what shown when the app loads

print("\(name) is working hard")//print


//RANDOM
  @IBAction func rollButtonPress(_ sender: UIButton) {
        diceImageViewOne.image = [].randomElement()
        diceImageViewTwo.image = myArray.[Int.random(in: 0...4)]
        
    
    }
}

//***Random azation
let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
//The number of letters in alphabet equals 26
var password = alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)]  
print(password)
//***

//Datatypes
var myAge: Int = 12 // datatypes start with capital
var myAge = 12


//Function
func greeting() {
    print("hello")
}

func greeting2(whoToGreet: String) {
    print ("Hello \(whoToGreet)")    // stribg interpelation
}

greeting2(whoToGreet: String)
greeting2(whoToGreet: "Angela")

//calculator exersize
//Write your code below this line to make the above function calls work.
func add(n1: Int, n2: Int) {
  print(n1 + n2)
}
func subtract(n1: Int, n2: Int) {
  print(n1 - n2)
}
func multiply(n1: Int, n2: Int) {
  print(n1 * n2)
}
func divide(n1: Int, n2: Int) {
  let decimalN1 = Double(n1)
  let decimalN2 = Double(n2)
  print(decimalN1 / decimalN2)
}

//Xylophone exersice
@IBAction func keyPressed(_ sender: UIButton) {
        
        playSound(soundName: sender.currentTitle!)
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
    }

// EGG exersice
class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        switch hardness {
        case "Soft": print(softTime)
        case "Medium": print(mediumTime)
        case "Hard": print(hardTime)
        default:
            print("Error")
        }
    }
    

}

//Dictinary solution -> Object
class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
       // var minutes = eggTimes[hardness]!
        print(eggTimes[hardness]!)
    }
    

}

// Optionals 
// can't print or unwrap nill

//Optionals solution
//Don't change this
var studentsAndScores = ["Amy": Int(readLine()!)!, "James": Int(readLine()!)!, "Helen": Int(readLine()!)!]

func highestScore(scores: [String: Int]) {
  
  //Write your code here.
  let a = studentsAndScores["Amy"]!
  let b = studentsAndScores["James"]!
  let c = studentsAndScores["Helen"]!
  
  var temp = 0
  //If a is greater than b
  if a > temp {
    //And a is also greater than c
    temp = a
  }
  if b > temp {
    temp = b
  }
  if c > temp {
    temp = c
  }
  print(temp)   
}

//Don't change this
highestScore(scores: studentsAndScores)

// round a number (down?) to n decimal places
// https://www.tutorialspoint.com/swift-program-to-round-a-number-to-n-decimal-places#:~:text=Swift%20provide%20a%20built%2Din%20function%20named%20as%20ceil(),also%20both%20Float%20and%20Double.
print(String(format: "%.2f", sender.value))
String(format: "%.0f", sender.value)
       //print(sender.value)
print(round(sender.value * 100)/100.0)