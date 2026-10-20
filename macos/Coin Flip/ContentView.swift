import SwiftUI

struct ContentView: View {
    @State private var flipResult: String = "Tap to Flip"
    @State private var isFlipping: Bool = false // Track if the coin is currently flipping
    
    var body: some View {
        ZStack {
            // Adding a gradient background for visual appeal
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Display either "Flipping..." or the flip result
                Text(isFlipping ? "Flipping..." : flipResult)
                    .font(.system(size: 60, weight: .bold, design: .rounded))  // Large, rounded font for clarity
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                
                Button(action: {
                    flipCoin() // Call the flipCoin function when button is pressed
                }) {
                    Text("Flip Coin")
                        .font(.title2)
                        .padding()
                        .frame(width: 200)  // Make the button larger
                        .background(Color.white.opacity(0.9))  // Use a light background for the button
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                        .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 0, y: 5)  // Adding a shadow for a 3D effect
                }
                .disabled(isFlipping) // Disable the button while the coin is flipping
            }
            .padding()
        }
    }
    
    // Function to simulate a coin flip with a delay to show the flipping process
    func flipCoin() {
        isFlipping = true  // Set flipping to true to show "Flipping..." text
        
        // Simulate the flipping process with a 1-second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            flipResult = Bool.random() ? "Heads" : "Tails"  // Flip the coin after the delay
            isFlipping = false  // Reset flipping to false after the result is shown
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

