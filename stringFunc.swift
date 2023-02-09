 //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
        
        //round it down to a whole number then set it as the text in
         splitNumberLabel.text = String(format: "%.0f", sender.value)

         //from data to string
         var testString = "This is a test string"
var somedata = testString.data(using: String.Encoding.utf8)
var backToString = String(data: somedata!, encoding: String.Encoding.utf8) as String!