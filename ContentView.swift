import SwiftUI

@main
struct HN_ALEX7ZApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var aimbot = false
    @State private var espLine = false
    @State private var aimFov = false
    @State private var noRecoil = false
    @State private var aimCuello = false
    @State private var xitPlus = false
    @State private var aimPecho = false
    @State private var injected = false
    @State private var masterOn = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            // Fondo tenue
            Image("background")
                .resizable()
                .scaledToFill()
                .opacity(0.25)
                .ignoresSafeArea()

            // CAJA CHIQUITA CENTRADA - 260 de ancho nada más
            VStack(spacing: 5) {
                Text("HN-ALEX7Z")
                    .font(.system(size: 16, weight: .black))
                    .foregroundColor(.white)
                    .padding(.top, 8)

                Text(masterOn ? "ACTIVADO" : "DESACTIVADO")
                    .font(.system(size: 8, weight: .bold))
                    .foregroundColor(masterOn ? .red : .white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(Color.red.opacity(masterOn ? 0.9 : 0.15))
                    .cornerRadius(10)

                Button(action: {
                    masterOn.toggle()
                    let v = masterOn
                    aimbot = v; espLine = v; aimFov = v; noRecoil = v; aimCuello = v; xitPlus = v; aimPecho = v; injected = v
                }) {
                    Text(masterOn ? "DESACTIVAR TODO" : "ACTIVAR TODO")
                        .font(.system(size: 9, weight: .black))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                        .background(Color.red)
                        .cornerRadius(6)
                }

                VStack(spacing: 4) {
                    OptionRow(title: "AIMBOT", isOn: $aimbot)
                    OptionRow(title: "ESP LINE", isOn: $espLine)
                    OptionRow(title: "AIM FOV", isOn: $aimFov)
                    OptionRow(title: "NO RECOIL", isOn: $noRecoil)
                    OptionRow(title: "AIM CUELLO", isOn: $aimCuello)
                    OptionRow(title: "XIT PLUS", isOn: $xitPlus)
                    OptionRow(title: "AIM PECHO", isOn: $aimPecho)
                }

                HStack(spacing: 5) {
                    Button("INJECT") { injected = true }
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                        .background(Color.red)
                        .cornerRadius(6)
                    Button("STOP") {
                        masterOn = false
                        aimbot = false; espLine = false; aimFov = false; noRecoil = false; aimCuello = false; xitPlus = false; aimPecho = false; injected = false
                    }
                    .font(.system(size: 9, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 5)
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(6)
                }

                HStack(spacing: 5) {
                    Button("FREE FIRE") { openFreeFire() }
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                        .background(Color.red)
                        .cornerRadius(6)
                    Button("FREE FIRE MAX") { openFreeFireMax() }
                        .font(.system(size: 8, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(6)
                }
            }
            .padding(10)
            .frame(width: 260) // <--- ESTO LO HACE CHIQUITO Y CENTRADO
            .background(Color.black.opacity(0.85))
            .cornerRadius(14)
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.red, lineWidth: 1))
        }
    }

    // Intenta VARIOS esquemas, no solo uno
    func openFreeFire() {
        let schemes = ["freefire://", "garenafreefire://", "com.dts.freefireth://", "FreeFire://"]
        for s in schemes {
            if let url = URL(string: s), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url); return
            }
        }
        // Si ninguno abre, abre por Bundle ID
        if let url = URL(string: "https://apps.apple.com/app/id1300146617") {
            UIApplication.shared.open(url)
        }
    }
    func openFreeFireMax() {
        let schemes = ["freefiremax://", "garenafreefiremax://", "com.dts.freefiremax://", "FreeFireMax://"]
        for s in schemes {
            if let url = URL(string: s), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url); return
            }
        }
        if let url = URL(string: "https://apps.apple.com/app/id1480516829") {
            UIApplication.shared.open(url)
        }
    }
}

struct OptionRow: View {
    let title: String
    @Binding var isOn: Bool
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
                .font(.system(size: 9, weight: .bold))
                .foregroundColor(.white)
                .lineLimit(1)
            Spacer()
            Button(action: { isOn.toggle() }) {
                Text(isOn ? "ON" : "OFF")
                    .font(.system(size: 8, weight: .black))
                    .foregroundColor(.white)
                    .frame(width: 38, height: 18)
                    .background(isOn ? Color.red : Color.white.opacity(0.2))
                    .cornerRadius(5)
            }
        }
        .padding(.horizontal, 4)
        .padding(.vertical, 4)
        .background(Color.white.opacity(0.08))
        .cornerRadius(6)
    }
}
