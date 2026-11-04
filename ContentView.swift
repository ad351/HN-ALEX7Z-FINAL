import SwiftUI

@main
struct HNApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var keyInput = ""
    @State private var mensaje = ""
    @State private var desbloqueado = false

    let misKeys: [String: String] = [
        "HN-38A1-CQCD-K2GG": "1 DIA",
        "HN-85VW-0P3K-E3ZF": "7 DIAS",
        "HN-ZFXE-77J5-1L0Y": "30 DIAS",
        "HN-BSLA-7FI7-30EG": "ILIMITADA"
    ]

    var body: some View {
        if desbloqueado {
            VStack {
                Text("HN ALEX7z")
                    .font(.largeTitle.bold())
                Text("Bienvenido, key correcta ✅")
                Text("Tu key: \(keyInput)")
            }
        } else {
            VStack(spacing: 20) {
                Text("HN ALEX7z")
                    .font(.largeTitle.bold())
                Text("Pon tu Key para entrar")
                TextField("HN-XXXX-XXXX-XXXX", text: $keyInput)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.allCharacters)
                    .padding(.horizontal)
                Button("Activar") {
                    verificar()
                }
                .buttonStyle(.borderedProminent)
                Text(mensaje)
                    .foregroundColor(.red)
            }
            .padding()
        }
    }

    func verificar() {
        let keyLimpia = keyInput.trimmingCharacters(in: .whitespaces).uppercased()
        if let tipo = misKeys[keyLimpia] {
            UserDefaults.standard.set(keyLimpia, forKey: "keyGuardada")
            UserDefaults.standard.set(Date(), forKey: "fechaActivacion")
            mensaje = ""
            desbloqueado = true
            print("Key correcta: \(tipo)")
        } else {
            mensaje = "Key incorrecta ❌"
        }
    }
}
