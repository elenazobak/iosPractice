Button("Delete selection") {
    print("Now deleting…")
}

struct ContentView: View {
    var body: some View {
        Button("Delete selection", action: executeDelete)
    }

    func executeDelete() {
        print("Now deleting…")
    }
}


Button("Delete selection", role: .destructive, action: executeDelete)

VStack {
    Button("Button 1") { }
        .buttonStyle(.bordered)
    Button("Button 2", role: .destructive) { }
        .buttonStyle(.bordered)
    Button("Button 3") { }
    .buttonStyle(.borderedProminent)
    .tint(.mint)
    Button("Button 4", role: .destructive) { }
        .buttonStyle(.borderedProminent)
}

//If you want something completely custom, you can pass a custom label using a second trailing closure:

Button {
    print("Button was tapped")
} label: {
    Text("Tap me!")
        .padding()
        .foregroundColor(.white)
        .background(.red)
}


Button {
    print("Edit button was tapped")
} label: { 
    Image(systemName: "pencil")
}
//If you want both text and image at the same time, SwiftUI has a dedicated type called Label.

Button {
    print("Edit button was tapped")
} label: {
    Label("Edit", systemImage: "pencil")
}

renderingMode(.original) // to force SwiftUI to show the original image rather than the recolored version.