import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        "Four + Two is equal to Six",
        "Five - Three is greater than One",
        "Three + Eight is less than Ten"
    ]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        questionNumber += 1
        updateUI()
        
    }
    
    func updateUI() {
        questionLable.text = quiz[questionNumber]
    }
    
}