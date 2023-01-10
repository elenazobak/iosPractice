class Dragon: Enemy {
    let wingSpan = 5
    
    
    func talk(speech: String) {
        print("Says: \(speech)")
    }
    
    override func move() {
        print ("fly forward")
    }
    
}
