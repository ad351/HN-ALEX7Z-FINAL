import SwiftUI

@main
struct HackApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State var hue = 0.0
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("HN-ALEX7z")
                    .font(.system(size: 42, weight: .black))
                    .foregroundColor(.white)
                
                Text("EXTERNAL")
                    .font(.system(size: 36, weight: .heavy, design: .monospaced))
                    .foregroundColor(Color(hue: hue, saturation: 1, brightness: 1))
                    .shadow(color: Color(hue: hue, saturation: 1, brightness: 1), radius: 20)
                    .shadow(color: Color(hue: hue, saturation: 1, brightness: 1), radius: 40)
                    .onReceive(timer) { _ in
                        hue += 0.02
                        if hue > 1 { hue = 0 }
                    }
            }
        }
    }
}
