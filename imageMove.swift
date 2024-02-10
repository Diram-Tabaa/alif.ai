//
//  imageMove.swift
//  Hackathon
//
//  Created by Ahmad Hallaq on 2/9/24.
//

import SwiftUI

struct imageMove: View {
  @State private var isImageMoved = false
    var body: some View {
      VStack {
        Spacer()
                    
                    Image("apple")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                        .offset(y: isImageMoved ? 300 : 0) // Move the image downward when isImageMoved is true
                        .animation(.easeInOut(duration: 1.0)) // Add animation
                    
                    Spacer()
      }
      .onTapGesture {
                  withAnimation {
                      self.isImageMoved.toggle() // Toggle the state to trigger animation
                  }
              }
    }
}

#Preview {
    imageMove()
}
