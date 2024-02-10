//
//  massComparison.swift
//  Hackathon
//
//  Created by Ahmad Hallaq on 2/9/24.
//

import SwiftUI

struct massComparison: View {
  @State private var imagesFall = false
  var body: some View {
      VStack {
          HStack {
              Image("basketball")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 100, height: 100)
                  .offset(y: imagesFall ? 300 : 0) // Adjust the offset distance
                  .animation(.easeInOut(duration: 2))

              Image("metalBall")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 100, height: 100)
                  .offset(y: imagesFall ? 300 : 0) // Adjust the offset distance
                  .animation(.easeInOut(duration: 1))
          }
          
          Button("Go") {
              withAnimation {
                  self.imagesFall.toggle()
              }
          }
          .padding()
      }
  }
}

#Preview {
    massComparison()
}
