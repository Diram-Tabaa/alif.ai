import SwiftUI

struct ScienceView: View {
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text("Lesson 1: Gravity")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
        }
        .cornerRadius(10)
        .padding()
        
        
        
        Button(action: action) {
            Text("Lesson 2: Force")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
        }
        .cornerRadius(10)
        .padding()
        
        
        
        Button(action: action) {
            Text("Lesson 3: Electricity")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
        }
        .cornerRadius(10)
        .padding()
        
        Button(action: action) {
            Text("Lesson 4: Speed and Velocity")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
        }
        .cornerRadius(10)
        .padding()
        
        
        Button(action: action) {
            Text("Lesson 5: Solar System")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
        }
        .cornerRadius(10)
        .padding()
    }
}

