import SwiftUI

struct ContentView: View {
    // TODAS APAGADAS AL ENTRAR
    @State private var aimbot = false
    @State private var espLine = false
    @State private var aimFov = false
    @State private var noRecoil = false
    @State private var aimCuello = false
    @State private var xitPlus = false
    @State private var aimPecho = false
    @State private var injected = false

    var body: some View {
        ZStack {
            // FONDO = TU FOTO
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            // Oscuro poquito para que se lea el texto
            Color.black.opacity(0.35)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("HN-ALEX7z")
                    .font(.system(size: 36, weight: .black))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 5)
                    .padding(.top, 30)

                Text("EXTERNAL")
                    .font(.system(size: 30, weight: .black))
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 8)
                    .shadow(color: .red, radius: 8)

                // CAJA NEGRA DE OPCIONES
                VStack(spacing: 13) {
                    ToggleRow(title: "AIMBOT", isOn: $aimbot)
                    ToggleRow(title: "ESP LINE", isOn: $espLine)
                    ToggleRow(title: "AIM FOV", isOn: $aimFov)
                    ToggleRow(title: "NO RECOIL", isOn: $noRecoil)
                    ToggleRow(title: "AIM CUELLO", isOn: $aimCuello)
                    ToggleRow(title: "XIT PLUS", isOn: $xitPlus)
                    ToggleRow(title: "AIM PECHO", isOn: $aimPecho)
                }
                .padding(18)
                .background(Color.black.opacity(0.85))
                .cornerRadius(18)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                )
                .padding(.horizontal, 20)

                // BOTON INJECT
                Button(action: {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    injected.toggle()
                }) {
                    Text(injected ? "INJECTED ✓" : "INJECT")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(injected ? .black : .white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(injected ? Color.green : Color.red)
                        .cornerRadius(14)
                }
                .padding(.horizontal, 40)

                Spacer()

                // BOTONES FREE FIRE - MAS PEQUEÑOS Y FACILES DE TOCAR
                HStack(spacing: 12) {
                    Button(action: { openGame(schemes: ["freefire://", "FreeFire://"], storeId: "1300146617") }) {
                        Text("Free Fire")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 11)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                    Button(action: { openGame(schemes: ["freefiremax://", "FreeFireMax://"], storeId: "1480516823") }) {
                        Text("Free Fire MAX")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 11)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 28)
            }
        }
    }

    func openGame(schemes: [String], storeId: String) {
        for s in schemes {
            if let url = URL(string: s) {
                UIApplication.shared.open(url, options: [:]) { success in
                    if !success {
                        if let store = URL(string: "https://apps.apple.com/app/id\(storeId)") {
                            UIApplication.shared.open(store)
                        }
                    }
                }
                return
            }
        }
    }
}

struct ToggleRow: View {
    var title: String
    @Binding var isOn: Bool
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(.red) // ACTIVADO = ROJO
                .onChange(of: isOn) { _ in
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                }
        }
    }
}
