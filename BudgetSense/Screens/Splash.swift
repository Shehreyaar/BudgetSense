import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            // Text with two different colors for "Budget" and "Sense"
            HStack(spacing: 5) {
                Text("Budget")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Text("Sense")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.green)
            }
            .shadow(color: .black, radius: 2, x: 0, y: 5)
        }
    }
}

#Preview {
    Splash()
}
