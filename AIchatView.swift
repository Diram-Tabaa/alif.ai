//
//  AIchatView.swift
//  Hackathon
//
//  Created by Ahmad Hallaq on 2/10/24.
//

import SwiftUI
import Generation
import Models

struct AIchatView: View {
    // State variables for AI chat
//    @State private var userQuestion = ""
    @State private var messages: [ChatMessage] = [ChatMessage(text: "Welcome to AI Chat!", isReceived: true)]
    
  @Environment(\.horizontalSizeClass) private var horizontalSizeClass
  @Environment(\.verticalSizeClass) private var verticalSizeClass
  
  @State private var config = GenerationConfig(maxNewTokens: 90, doSample: true, numBeams: 2)
  @State private var prompt = ""
  @State private var genPrompt = ""
  //@State private var modelURL: URL? = nil
  @State private var languageModel: LanguageModel? = nil
  
  @State private var isSettingsPresented = false
//  @State private var isFirstLaunch = true
  
  @State private var status: ModelState = .noModel
  @State private var outputText: AttributedString = ""
  @State private var outputText2: String = ""
//  @Binding var clearTriggered: Bool
    
  func modelDidChange() {
      guard status != .loading else { return }
      
      status = .loading
      Task.init {
          do {
              languageModel = try await ModelLoader.load()
              if let config = languageModel?.defaultGenerationConfig { self.config = config }
              status = .ready(nil)
              isSettingsPresented = false
              print("After?")
          } catch {
              print("No model could be loaded: \(error)")
              status = .noModel
          }

      }
  }
  
    func sendMessage() {
            let ResponseMessage = ChatMessage(text: "",  isReceived: true)
            let trimmedQuestion = prompt.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmedQuestion.isEmpty else { return }
            
            genPrompt = "<|system|>\nYou are a chatbot who can help primary school students!</s>\n<|user|>\n\(prompt)</s>\n<|assistant|>"
            prompt = ""
      
            let newMessage = ChatMessage(text: trimmedQuestion, isReceived: false)
            messages.append(newMessage)
            // Simulate receiving an answer after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) {
              messages.append(ResponseMessage)
            }
            run()
       // Clear the text field
      
        }
  
  func run() {
      guard let languageModel = languageModel else { return }
      
      @Sendable func showOutput(currentGeneration: String, progress: Double, completedTokensPerSecond: Double? = nil) {
          Task { @MainActor in
              // Temporary hack to remove start token returned by llama tokenizers
              var response = currentGeneration.deletingPrefix("<s> ")
              
              // Strip prompt
              guard response.count > genPrompt.count else { return }
              response = response[genPrompt.endIndex...].replacingOccurrences(of: "\\n", with: "\n")
  
    
              let message = ChatMessage(text: response, isReceived: true)
              messages[messages.endIndex - 1] = message
            
            
              if let tps = completedTokensPerSecond {
                genPrompt = ""
                  status = .ready(tps)
                  
              } else {
                  status = .generating(progress)
              }
          }
      }
      
      Task.init {
          status = .generating(0)
          var tokensReceived = 0
          let begin = Date()
          do {
              let output = try await languageModel.generate(config: config, prompt: genPrompt) { inProgressGeneration in
                  tokensReceived += 1
                  showOutput(currentGeneration: inProgressGeneration, progress: Double(tokensReceived)/Double(config.maxNewTokens))
              }
              let completionTime = Date().timeIntervalSince(begin)
              let tokensPerSecond = Double(tokensReceived) / completionTime
              showOutput(currentGeneration: output, progress: 1, completedTokensPerSecond: tokensPerSecond)
              print("Took \(completionTime)")
          } catch {
              print("Error \(error)")
              Task { @MainActor in
                  status = .failed("\(error)")
              }
          }
      }
  }
  
    var body: some View {
        
        VStack {
            Text("Ask AI")
                .font(.headline)
                .padding()
            
            // Messages ScrollView
            ScrollView {
                ForEach(messages) { message in
                    HStack {
                        if message.isReceived {
                            Text(message.text)
                                .padding()
                                .background(Color.green.opacity(0.3))
                                .cornerRadius(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } else {
                            Spacer()
                            Text(message.text)
                                .padding()
                                .background(Color.blue.opacity(0.3))
                                .cornerRadius(10)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .padding(.horizontal, 5)
                }
            }
            
            HStack {
                
                // Field to ask a question
                TextField("Ask me anything...", text: $prompt)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(20)
                
                Button(action: sendMessage) {
                  Image(systemName: "paperplane.circle")
                    .resizable()
                    .frame(maxWidth: 24, maxHeight: 28)
                        
                }
                .disabled(prompt.isEmpty)
                
                Spacer()
            }
        }
        .frame(width: 400) // Adjust the width of the AI chat sidebar as needed
        .background(Color.white)
        .onAppear {
          modelDidChange()
          
      }
        
    }        

}

#Preview {
    AIchatView()
}
