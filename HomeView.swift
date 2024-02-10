import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            // Sidebar
            List {
                
                
                NavigationLink(destination: Text("Profile View")) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                        Text("Ahmad Hallaq")
                            .font(.headline)
                        
                    }
                    .padding()
                    
                }
                
                
                
                NavigationLink(destination: MainContentView()) {
                    Label("Library", systemImage: "books.vertical")
                        .font(.headline)
                    
                    
                }
                
                
            
                
                Section("My Collection") {
                    
                    
                    NavigationLink(destination: RootView()) {
                        Label("Science", systemImage: "atom")
                            .font(.headline)
                    }
                    
                    NavigationLink(destination: Text("Maths View")) {
                        Label("Maths", systemImage: "angle")
                            .font(.headline)
                    }
                    
                    NavigationLink(destination: Text("English View")) {
                        Label("English", systemImage: "square.and.pencil.circle")
                            .font(.headline)
                    }
                    
                    
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {}) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            
            
            //Main content area
            //MainContentView()
            //ScienceView()
        }
    }
}




struct MainContentView: View {
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Title
              Text("Science")
                  .frame(minWidth: 0, maxWidth: .infinity)
                  .padding()
                  .background(Color.blue)
                  .foregroundColor(.white)
                  .font(.title)
                
                // Featured Collection - Biography
                VStack(alignment: .leading) {
                    
                  Text("Maths")
                      .frame(minWidth: 0, maxWidth: .infinity)
                      .padding()
                      .background(Color.blue)
                      .foregroundColor(.white)
                      .font(.title)
                }
                
                
                // Featured Collection - Short Stories
                VStack(alignment: .leading) {
          
                  Text("English")
                      .frame(minWidth: 0, maxWidth: .infinity)
                      .padding()
                      .background(Color.blue)
                      .foregroundColor(.white)
                      .font(.title)
                }
              
            }
        }
    }
}










struct MainView_Previews: PreviewProvider {
    static var previews: some View {
       HomeView()
    }
}


