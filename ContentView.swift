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
    @AppStorage("aimbot") private var aimbot = false
    @AppStorage("espLine") private var espLine = false
    @AppStorage("aimFov") private var aimFov = false
    @AppStorage("noRecoil") private var noRecoil = false
    @AppStorage("aimCuello") private var aimCuello = false
    @AppStorage("xitPlus") private var xitPlus = false
    @AppStorage("aimPecho") private var aimPecho = false
    @AppStorage("injected") private var injected = false
    @AppStorage("masterOn") private var masterOn = false
    @AppStorage("fechaInject") private var fechaInject = ""

    @State private var inyectando = false
    @State private var progreso: Double = 0
    @State private var mensaje = "LISTO PARA INYECTAR"

    let azulOscuro = Color(red: 0.0, green: 0.15, blue: 0.45)
    let azulBoton = Color(red: 0.0, green: 0.25, blue: 0.65)

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 5) {
                Text("HN-ALEX7Z")
                    .font(.system(size: 16, weight: .black))
                    .foregroundColor(.white)
                    .padding(.top, 8)

                Text(injected ? "INYECTADO ✔" : inyectando ? "INYECTANDO... \(Int(progreso * 100))%" : "SIN INYECTAR")
                    .font(.system(size: 8, weight: .bold))
                    .foregroundColor(injected ? .green : .white)
                    .padding(.horizontal, 8).padding(.vertical, 3)
                    .background(injected ? Color.green.opacity(0.2) : Color.white.opacity(0.15))
                    .cornerRadius(10)

                if inyectando {
                    ProgressView(value: progreso).tint(Color.blue).frame(width: 220)
                }
                Text(mensaje)
                    .font(.system(size: 7, weight: .bold))
                    .foregroundColor(.yellow)
                if injected && !fechaInject.isEmpty {
                    Text("Inyectado: \(fechaInject)").font(.system(size: 7, weight: .bold)).foregroundColor(.gray)
                }

                // ZONA VISUAL
                ZStack {
                    Color.white.opacity(0.08)
                    if injected {
                        if aimFov { Circle().stroke(Color.blue, lineWidth: 1.5).frame(width: 90, height: 90) }
                        if espLine {
                            Path { p in
                                p.move(to: CGPoint(x: 110, y: 80)); p.addLine(to: CGPoint(x: 60, y: 20))
                                p.move(to: CGPoint(x: 110, y: 80)); p.addLine(to: CGPoint(x: 160, y: 20))
                                p.move(to: CGPoint(x: 110, y: 80)); p.addLine(to: CGPoint(x: 110, y: 20))
                            }.stroke(Color.blue, lineWidth: 1)
                        }
                        if aimbot { Text("+").font(.system(size: 28, weight: .bold)).foregroundColor(.blue) }
                        if aimCuello { Circle().fill(Color.blue).frame(width: 8, height: 8).offset(y: -22) }
                        if aimPecho { Circle().fill(Color.white).frame(width: 8, height: 8).offset(y: 5) }
                        if xitPlus { Text("XIT PLUS ON").font(.system(size: 7, weight: .black)).foregroundColor(.blue).offset(y: 32) }
                        if noRecoil { Text("SIN RECOIL").font(.system(size: 7, weight: .bold)).foregroundColor(.white).offset(y: -38) }
                        if !aimbot && !espLine && !aimFov && !noRecoil && !aimCuello && !xitPlus && !aimPecho {
                            Text("INYECTADO - ACTIVA UNA OPCION").font(.system(size: 7, weight: .bold)).foregroundColor(.green)
                        }
                    } else {
                        Text("DALE INJECT PARA ACTIVAR").font(.system(size: 7, weight: .bold)).foregroundColor(.gray)
                    }
                }
                .frame(width: 220, height: 80)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(azulBoton, lineWidth: 1))

                Button(action: {
                    if !injected { mensaje = "PRIMERO DALE INJECT"; return }
                    masterOn.toggle()
                    let v = masterOn
                    aimbot = v; espLine = v; aimFov = v; noRecoil = v; aimCuello = v; xitPlus = v; aimPecho = v
                }) {
                    Text(masterOn ? "DESACTIVAR TODO" : "ACTIVAR TODO")
                        .font(.system(size: 9, weight: .black)).foregroundColor(.white)
                        .frame(maxWidth: .infinity).padding(.vertical, 5)
                        .background(azulBoton).cornerRadius(6)
                }

                VStack(spacing: 4) {
                    OptionRow(title: "AIMBOT", isOn: $aimbot, injected: injected, onTapSinInject: { mensaje = "PRIMERO DALE INJECT" })
                    OptionRow(title: "ESP LINE", isOn: $espLine, injected: injected, onTapSinInject: { mensaje = "PRIMERO DALE INJECT" })
                    OptionRow(title: "AIM FOV", isOn: $aimFov, injected: injected, onTapSinInject: { mensaje = "PRIMERO DALE INJECT" })
                    OptionRow(title: "NO RECOIL", isOn: $noRecoil, injected: injected, onTapSinInject: { mensaje = "PRIMERO DALE INJECT" })
                    OptionRow(title: "AIM CUELLO", isOn: $aimCuello, injected: injected, onTapSinInject: { mensaje = "PRIMERO DALE INJECT" })
                    OptionRow(title: "XIT PLUS", isOn: $xitPlus, injected: injected, onTapSinInject: { mensaje = "PRIMERO DALE INJECT" })
                    OptionRow(title: "AIM PECHO", isOn: $aimPecho, injected: injected, onTapSinInject: { mensaje = "PRIMERO DALE INJECT" })
                }

                HStack(spacing: 5) {
                    Button(action: { hacerInject() }) {
                        Text(injected ? "INYECTADO ✔" : inyectando ? "INYECTANDO..." : "INJECT")
                            .font(.system(size: 9, weight: .bold)).foregroundColor(.white)
                            .frame(maxWidth: .infinity).padding(.vertical, 5)
                            .background(injected ? Color.green : azulBoton).cornerRadius(6)
                    }
                    .disabled(inyectando || injected)
                    Button("STOP") {
                        injected = false; masterOn = false; inyectando = false; progreso = 0
                        aimbot = false; espLine = false; aimFov = false; noRecoil = false; aimCuello = false; xitPlus = false; aimPecho = false
                        fechaInject = ""; mensaje = "DESINYECTADO"
                    }
                    .font(.system(size: 9, weight: .bold)).foregroundColor(.white)
                    .frame(maxWidth: .infinity).padding(.vertical, 5)
                    .background(Color.white.opacity(0.15)).cornerRadius(6)
                }

                // BOTONES PARA REGRESAR AL JUEGO
                HStack(spacing: 5) {
                    Button("FREE FIRE") {
                        if let url = URL(string: "freefire://") { UIApplication.shared.open(url) }
                    }
                    .font(.system(size: 9, weight: .bold)).foregroundColor(.white)
                    .frame(maxWidth: .infinity).padding(.vertical, 5).background(azulOscuro).cornerRadius(6)
                    Button("FREE FIRE MAX") {
                        if let url = URL(string: "freefiremax://") { UIApplication.shared.open(url) }
                    }
                    .font(.system(size: 8, weight: .bold)).foregroundColor(.white)
                    .frame(maxWidth: .infinity).padding(.vertical, 5).background(azulOscuro).cornerRadius(6)
                }
                Text("1. INJECT  2. ACTIVA  3. DALE FREE FIRE PARA REGRESAR")
                    .font(.system(size: 6, weight: .bold)).foregroundColor(.gray)
            }
            .padding(10)
            .frame(width: 260)
            .background(Color.black.opacity(0.9))
            .cornerRadius(14)
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(azulBoton, lineWidth: 1))
        }
    }

    func hacerInject() {
        if injected || inyectando { return }
        inyectando = true; progreso = 0; mensaje = "INYECTANDO MODULOS..."
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
            progreso += 0.1
            if progreso >= 1.0 {
                timer.invalidate()
                inyectando = false; injected = true
                let f = DateFormatter(); f.dateFormat = "HH:mm:ss"; fechaInject = f.string(from: Date())
                mensaje = "INYECCION COMPLETA ✔"
                masterOn = true; aimbot = true; espLine = true; aimFov = true; noRecoil = true; aimCuello = true; xitPlus = true; aimPecho = true
            }
        }
    }
}

struct OptionRow: View {
    let title: String
    @Binding var isOn: Bool
    let injected: Bool
    let onTapSinInject: () -> Void
    var body: some View {
        HStack(spacing: 4) {
            Text(title).font(.system(size: 9, weight: .bold)).foregroundColor(.white)
            Spacer()
            Text(isOn && injected ? "VERDADERO" : "FALSO").font(.system(size: 7, weight: .bold)).foregroundColor(isOn && injected ? .green : .gray)
            Button(action: { if injected { isOn.toggle() } else { onTapSinInject() } }) {
                Text(isOn && injected ? "ON" : "OFF")
                    .font(.system(size: 8, weight: .black)).foregroundColor(.white)
                    .frame(width: 38, height: 18)
                    .background(isOn && injected ? Color(red: 0.0, green: 0.25, blue: 0.65) : Color.white.opacity(0.2))
                    .cornerRadius(5)
            }
        }
        .padding(.horizontal, 7).padding(.vertical, 4)
        .background(Color.white.opacity(0.08)).cornerRadius(6)
    }
}
