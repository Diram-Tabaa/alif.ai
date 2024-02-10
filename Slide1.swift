//
//  DiscoveringGravityView.swift
//  Hackathon
//
//  Created by Bakhtiyorjon Mirzajonov on 2/9/24.
//

import SwiftUI

struct Slide1: View {
  @State private var isImageMoved = false
  var goToSlide2: () -> Void
  var backToScience: () -> Void
  // Current slide index
  @State private var currentSlideIndex = 0
  
  
  
  
  
  var body: some View {
    
    HStack {
      
      VStack{
        
        VStack(spacing: 30) {
          
          VStack(alignment: .leading){
            
            Text("Story of Newton and the Apple")
              .font(.system(size: 40, weight: .bold))
              .foregroundColor(.black)
              .padding()
            
            Text("About 300 years ago, Sir Isaac Newton made a groundbreaking discovery about why things fall towards the ground, all because he saw an apple fall from a tree.The story of Sir Isaac Newton and the falling apple is one of the most famous anecdotes in the history of science, symbolizing the moment of inspiration for the formulation of the law of universal gravitation.")
              .font(.system(size: 18, weight: .regular))
              .foregroundColor(.black)
              .padding()
            
          
        
          }
          
          
          Text("Click the apple to see gravity in action")
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.black)
          
          ZStack {
            Image("appletree")
              .resizable()
              .frame(width: 500, height: .infinity)
            
            Image("Apple")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 50, height: 50)
              .padding()
              .offset(y: isImageMoved ? 200 : 0)
              .animation(.easeInOut(duration: 1.0))
            
            Spacer()
          }
        }
        .onTapGesture {
          withAnimation {
            self.isImageMoved.toggle()
          }
        }
        Spacer()
        
        // Your existing Slide1 content
        HStack {
          
          
          Button(action: backToScience) {
              Text("Back")
                  .frame(minWidth: 0, maxWidth: 60)
                  .padding()
                  .background(Color.red)
                  .foregroundColor(.white)
                  .font(.title2)
                  .cornerRadius(50)
          }
          .cornerRadius(50)
          .padding()
          
          Spacer()
          
          Button(action: backToScience) {
              Text("Next")
                  .frame(minWidth: 0, maxWidth: 60)
                  .padding()
                  .background(Color.green)
                  .foregroundColor(.white)
                  .font(.title2)
                  .cornerRadius(50)
            
          }
          .cornerRadius(50)
          .padding()
        }
      }
      
      
      Divider()
      
      // AI Chat Sidebar
      // AI Chat Sidebar
      AIchatView()
    }
  }
}


        
    
    
    
    

