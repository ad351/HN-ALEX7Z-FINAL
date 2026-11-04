import SwiftUI

@main
struct HackApp: App {
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}

struct ContentView: View {
    @State var hue: Double = 0
    @AppStorage("aimbot") var aimbot = true
    @AppStorage("esp") var esp = true
    @AppStorage("aimFov") var aimFov = true
    @AppStorage("noRecoil") var noRecoil = true
    @State var injected = true
    
    let colors: [Color] = [.blue, .purple, .green, .yellow, .red, .orange, .blue]
    
    func haptic() {
        let gen = UIImpactFeedbackGenerator(style: .medium)
        gen.impactOccurred()
    }
    
    func openApp(scheme: String, appStoreId: String) {
        if let url = URL(string: scheme), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            // Si no está instalado, abre App Store
            if let storeUrl = URL(string: "https://apps.apple.com/app/id\(appStoreId)") {
                UIApplication.shared.open(storeUrl)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 15) {
                // LOGO
                Text("HN-ALEX7z").font(.system(size: 32, weight: .heavy, design: .rounded)).foregroundColor(.white)
                Text("EXTERNAL").font(.system(size: 28, weight: .black, design: .rounded))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
                    .hueRotation(.degrees(hue * 360))
                    .shadow(color: .blue.opacity(0.9), radius: 40, x: 0, y: 10)
                    .shadow(color: .red.opacity(0.8), radius: 40, x: 0, y: 0)
                
                Spacer().frame(height: 10)
                
                // MENU
                VStack(spacing: 14) {
                    Toggle("AIMBOT", isOn: $aimbot)
                    Toggle("ESP LINE", isOn: $esp)
                    Toggle("AIM FOV", isOn: $aimFov)
                    Toggle("NO RECOIL", isOn: $noRecoil)
                }
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .foregroundColor(.white)
                .padding().background(Color.white.opacity(0.12)).cornerRadius(15)
                .padding(.horizontal)
                .onChange(of: aimbot) { _ in haptic() }
                .onChange(of: esp) { _ in haptic() }
                .onChange(of: aimFov) { _ in haptic() }
                .onChange(of: noRecoil) { _ in haptic() }
                
                // BOTON INJECT
                Button(action: {
                    haptic()
                    withAnimation { injected.toggle() }
                }) {
                    Text(injected ? "INJECTED ✓" : "INJECT")
                        .font(.system(size: 18, weight: .black, design: .rounded))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(injected ? Color.green : Color.white)
                        .cornerRadius(12)
                        .shadow(color: (injected ? Color.green : Color.white).opacity(0.6), radius: 15)
                }
                .padding(.horizontal, 40)
                .padding(.top, 10)
                
                Spacer()
                
                // BOTONES FREE FIRE
                VStack(spacing: 10) {
                    Text("LAUNCH GAME").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.5))
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            haptic()
                            openApp(scheme: "freefire://", appStoreId: "1300146617")
                        }) {
                            HStack { Image(systemName: "gamecontroller.fill"); Text("Free Fire") }
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color.red.opacity(0.8))
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            haptic()
                            openApp(scheme: "freefiremax://", appStoreId: "1480516823")
                        }) {
                            HStack { Image(systemName: "gamecontroller.fill"); Text("Free Fire MAX") }
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .padding(.top, 60)
        }
        .onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) { hue = 1 }
        }
    }
}
