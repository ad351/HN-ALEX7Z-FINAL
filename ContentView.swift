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

    // Colores nuevos - Negro y Azul Oscuro
    let azulOscuro = Color(red: 0.0, green: 0.15, blue: 0.45)
    let azulBoton = Color(red: 0.0, green: 0.25, blue: 0.65)
    let negroFondo = Color.black

    var body: some View {
        ZStack {
            negroFondo.ignoresSafeArea()
            Image("background")
                .resizable()
                .scaledToFill()
                .opacity(0.15)
                .ignoresSafeArea()

            // CAJA CHIQUITA CENTRADA
            VStack(spacing: 5) {
                Text("HN-ALEX7Z")
                    .font(.system(size: 16, weight: .black))
                    .foregroundColor(.white)
                    .padding(.top, 8)

                Text(masterOn ? "ACTIVADO" : "DESACTIVADO")
                    .font(.system(size: 8, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(masterOn ? azulBoton : Color.white.opacity(0.15))
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
                        .background(azulBoton)
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
                        .background(azulBoton)
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

                // LOS 2 BOTONES NUEVOS QUE PEDISTE
                HStack(spacing: 5) {
                    Button("FREE FIRE") {
                        // Safari.open("freefire://")
                        if let url = URL(string: "freefire://") {
                            UIApplication.shared.open(url)
                        }
                    }
                    .font(.system(size: 9, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 5)
                    .background(azulOscuro)
                    .cornerRadius(6)

                    Button("FREE FIRE MAX") {
                        // Safari.open("freefiremax://")
                        if let url = URL(string: "freefiremax://") {
                            UIApplication.shared.open(url)
                        }
                    }
                    .font(.system(size: 8, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 5)
                    .background(azulOscuro)
                    .cornerRadius(6)
                }
            }
            .padding(10)
            .frame(width: 260)
            .background(Color.black.opacity(0.9))
            .cornerRadius(14)
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(azulBoton, lineWidth: 1))
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
                    .background(isOn ? Color(red: 0.0, green: 0.25, blue: 0.65) : Color.white.opacity(0.2))
                    .cornerRadius(5)
            }
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 4)
        .background(Color.white.opacity(0.08))
        .cornerRadius(6)
    }
}
