func myFunc (name eman: Type) { // name -> external parameter - when the function called
    print (eman)                //eman -> internal parameter - when used inside the function
}


myFunc(value) // to call without external parameter name 
// write the function with underscore ->
func myFunc (_ eman: Type) { 
    print (eman)               


// if one name -> it's only external, has to be call with the name and value
// if two -> external and internal -> has to be called with external and value
// if underscore and name -> internal -> can be called with only value

    extension Double {
    func round(places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}

var a = 44.589995

a.round(places: 2)

