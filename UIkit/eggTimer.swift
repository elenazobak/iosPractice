import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    
    var countdownTimer = Timer()
    var player: AVAudioPlayer!
    var secondsPassed = 0
    var totalTime = 0
    
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
   
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        countdownTimer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLable.text = hardness
        
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        
//        progressBar.progress = Float(secondsRemaining * 100)/Float(eggTimes[hardness]!)
    }
    @objc func updateTime() {
            

            if secondsPassed < totalTime {
                print("\(secondsPassed) seconds")
                secondsPassed += 1
                let percentageProgress = Float(secondsPassed) / Float(totalTime)
                
                progressBar.progress = (percentageProgress)
                
                
            } else {
                countdownTimer.invalidate()
                titleLable.text = "Done"
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                            player = try! AVAudioPlayer(contentsOf: url!)
                            player.play()
                
            }
        }
    

}

 for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }