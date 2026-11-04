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
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color.black.opacity(0.35)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 6) {
                    Text("HN-ALEX7Z")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(.top, 10)

                    Text(masterOn ? "ACTIVADO" : "DESACTIVADO")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(masterOn ? .green : .gray)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background((masterOn ? Color.green : Color.gray).opacity(0.2))
                        .cornerRadius(20)

                    // BOTON MAESTRO
                    Button(action: {
                        masterOn.toggle()
                        let v = masterOn
                        aimbot = v; espLine = v; aimFov = v; noRecoil = v; aimCuello = v; xitPlus = v; aimPecho = v; injected = v
                    }) {
                        Text(masterOn ? "DESACTIVAR TODO" : "ACTIVAR TODO")
                            .font(.system(size: 11, weight: .black))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 7)
                            .background(masterOn ? Color.red : Color.green)
                            .cornerRadius(8)
                    }

                    // CADA OPCION CON SU BOTONCITO
                    VStack(spacing: 6) {
                        OptionRow(title: "AIMBOT", isOn: $aimbot)
                        OptionRow(title: "ESP LINE", isOn: $espLine)
                        OptionRow(title: "AIM FOV", isOn: $aimFov)
                        OptionRow(title: "NO RECOIL", isOn: $noRecoil)
                        OptionRow(title: "AIM CUELLO", isOn: $aimCuello)
                        OptionRow(title: "XIT PLUS", isOn: $xitPlus)
                        OptionRow(title: "AIM PECHO", isOn: $aimPecho)
                    }

                    HStack(spacing: 6) {
                        Button("INJECT") { injected = true }
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                            .background(Color.green)
                            .cornerRadius(8)

                        Button("STOP") {
                            masterOn = false
                            aimbot = false; espLine = false; aimFov = false; noRecoil = false; aimCuello = false; xitPlus = false; aimPecho = false; injected = false
                        }
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .background(Color.red)
                        .cornerRadius(8)
                    }

                    HStack(spacing: 6) {
                        Button("FREE FIRE") {
                            openApp(urlScheme: "freefire://", appStoreID: "1300146617")
                        }
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 7)
                        .background(Color.orange)
                        .cornerRadius(8)

                        Button("FREE FIRE MAX") {
                            openApp(urlScheme: "freefiremax://", appStoreID: "1480516829")
                        }
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 7)
                        .background(Color.blue)
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 14)
                .padding(.bottom, 20)
            }
        }
    }

    func openApp(urlScheme: String, appStoreID: String) {
        if let url = URL(string: urlScheme), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else if let storeURL = URL(string: "https://apps.apple.com/app/id\(appStoreID)") {
            UIApplication.shared.open(storeURL)
        }
    }
}

struct OptionRow: View {
    let title: String
    @Binding var isOn: Bool
    var body: some View {
        HStack(spacing: 6) {
            Text(title)
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.white)
            Spacer()
            // BOTONCITO PEQUEÑO POR OPCION
            Button(action: { isOn.toggle() }) {
                Text(isOn ? "ON" : "OFF")
                    .font(.system(size: 9, weight: .black))
                    .foregroundColor(.white)
                    .frame(width: 48, height: 22)
                    .background(isOn ? Color.green : Color.gray)
                    .cornerRadius(6)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.white.opacity(0.12))
        .cornerRadius(8)
    }
}
