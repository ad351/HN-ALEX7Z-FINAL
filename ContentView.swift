import SwiftUI
struct ContentView: View {
    @State var hue: Double = 0
    @State var aimbot = True
    @State var esp = True
    @State var aimFov = True
    @State var noRecoil = True
    let colors: [Color] = [.blue, .purple, .green, .yellow, .red, .orange, .blue]
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 10) {
                Text("HN-ALEX7z").font(.system(size: 32, weight: .heavy, design: .rounded)).foregroundColor(.white)
                Text("EXTERNAL").font(.system(size: 28, weight: .black, design: .rounded))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
                    .hueRotation(.degrees(hue * 360))
                    .shadow(color: .blue.opacity(0.9), radius: 40, x: 0, y: 10)
                    .shadow(color: .red.opacity(0.8), radius: 40, x: 0, y: 0)
                Spacer().frame(height: 25)
                VStack(spacing: 12) {
                    Toggle("AIMBOT", isOn: $aimbot)
                    Toggle("ESP LINE", isOn: $esp)
                    Toggle("AIM FOV", isOn: $aimFov)
                    Toggle("NO RECOIL", isOn: $noRecoil)
                }
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .foregroundColor(.white)
                .padding().background(Color.white.opacity(0.12)).cornerRadius(15).padding(.horizontal)
                Spacer()
            }.padding(.top, 70)
        }
        .onAppear { withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) { hue = 1 } }
    }
}
