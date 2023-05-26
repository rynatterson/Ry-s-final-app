import SwiftUI


struct IntroductionView: View {
    @State private var showContentView = false
    @State private var showAboutScreen = false
    
    var body: some View {
        VStack {
            Text("Welcome to Ry's Cool Computer Science App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)
                )
            
            Text("API: The Metropolitan Museum of Art")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            Text("Developed by Ry Natterson")
                .font(.title)
                .foregroundColor(.black)
                .padding()
            
            Text("Thanks to ChatGPT for debugging")
                .font(.title)
                .foregroundColor(.black)
                .padding()
            
            NavigationLink(destination: ContentView(), isActive: $showContentView) {
                EmptyView()
            }
            
            Button(action: {
                showContentView = true
            }) {
                Text("Start")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                showAboutScreen = true
            }) {
                Text("About the Creator")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
            }
            .padding()
            .sheet(isPresented: $showAboutScreen) {
                AboutView()
            }
        }
    }
}
