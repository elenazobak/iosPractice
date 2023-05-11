extension Double {
    func round(to places: Int) -> Double { // rounds a double to n decimal places
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}