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
            Color.black.opacity(0.35)
                .ignoresSafeArea()

            VStack(spacing: 14) {
                Text("HN-ALEX7Z")
                    .font(.system(size: 28, weight: .black))
                    .foregroundColor(.white)
                    .shadow(radius: 5)

                Text("INJECTED")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(injected ? .green : .gray)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 6)
                    .background((injected ? Color.green : Color.gray).opacity(0.2))
                    .cornerRadius(20)

                VStack(spacing: 10) {
                    ToggleRow(title: "AIMBOT", isOn: $aimbot)
                    ToggleRow(title: "ESP LINE", isOn: $espLine)
                    ToggleRow(title: "AIM FOV", isOn: $aimFov)
                    ToggleRow(title: "NO RECOIL", isOn: $noRecoil)
                    ToggleRow(title: "AIM CUELLO", isOn: $aimCuello)
                    ToggleRow(title: "XIT PLUS", isOn: $xitPlus)
                    ToggleRow(title: "AIM PECHO", isOn: $aimPecho)
                }

                HStack(spacing: 10) {
                    Button("INJECT") {
                        injected = true
                    }
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .cornerRadius(12)

                    Button("STOP") {
                        aimbot = false; espLine = false; aimFov = false; noRecoil = false; aimCuello = false; xitPlus = false; aimPecho = false; injected = false
                    }
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.red)
                    .cornerRadius(12)
                }
                .padding(.top, 4)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ToggleRow: View {
    let title: String
    @Binding var isOn: Bool
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(.red)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(Color.white.opacity(0.12))
        .cornerRadius(12)
    }
}
