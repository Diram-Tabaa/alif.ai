//
//  Slide3_PowerOfGravityView.swift
//  Hackathon
//
//  Created by Bakhtiyorjon Mirzajonov on 2/9/24.
//

import SwiftUI

struct Slide2: View {
    @State private var imagesFall = false
    var backAction: () -> Void
    
    var body: some View {
        
        HStack{
            
            VStack{
                VStack(spacing: 30) {
                    
                    
                    VStack(alignment: .leading){
                        Text("Gravity All Around Us")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.top, 40)
                        
                        
                        Text("The gravitational pull depends on the mass. The more mass, the stronger the pull. This is gravity!")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                    }
                    // Interactive Element Placeholder with better styling
                    ZStack{
                        
                        Image("court")
                            .resizable()
                            .frame(width: 700, height: .infinity)
                        VStack {
                            HStack {
                                Image("basketball")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .offset(y: imagesFall ? 300 : 0) // Adjust the offset distance
                                    .animation(.easeInOut(duration: 2))
                                
                                Image("metalball")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .offset(y: imagesFall ? 300 : 0) // Adjust the offset distance
                                    .animation(.easeInOut(duration: 1))
                            }
                            
                            Button {
                                withAnimation {
                                    self.imagesFall.toggle()
                                }
                            } label: {
                                Text("Go")
                                    .font(.title)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding()
                        }}
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .edgesIgnoringSafeArea(.all)
                
                
                Button("Back", action: backAction)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .font(.title2)
                    .frame(minWidth: 100, maxHeight: 50)
                    .padding()
            }
            
            Divider()
            
            AIchatView()
        }
        
    }
    
}
