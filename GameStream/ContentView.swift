//
//  ContentView.swift
//  GameStream
//
//  Created by Appa on 12/12/22.
//

import SwiftUI

enum TipoInicioSesion{
    case inicioSesion, registroSesion
}

struct ContentView: View {
    var body: some View {
        ZStack{
            Spacer()
            Color(red: 21/255, green: 31/255, blue: 59/255, opacity: 1)
                .ignoresSafeArea()
            VStack{
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 60)
                InicioYRegistroView()
            }
        }
    }
}

struct InicioYRegistroView: View{
    @State var tipoInicioSesion:  TipoInicioSesion = .inicioSesion
    var body: some View{
        VStack{
            HStack {
                Spacer()
                Button("INICIA SESIÓN") {
                    self.tipoInicioSesion = .inicioSesion
                }
                .foregroundColor(tipoInicioSesion == .inicioSesion ? .gray : .white)
                Spacer()
                Button("REGÍSTRATE") {
                    self.tipoInicioSesion = .registroSesion
                }
                .foregroundColor(tipoInicioSesion == .registroSesion ? .gray : .white)
                Spacer()
            }.padding()
            switch tipoInicioSesion {
            case .inicioSesion:
                InicioSesionView()
            case .registroSesion:
                RegistroView()
            }
            Spacer()
        }
    }
}

struct InicioSesionView: View {
    @State var correo:String = ""
    @State var password:String = ""
    var body: some View{
        VStack{
            ScrollView {
                VStack(alignment: .leading){
                    
                    Text("Correo Electrónico").foregroundColor(Color("Dark-cian"))
                    
                    ZStack(alignment: .leading){
                        if correo.isEmpty {
                            Text(verbatim: "ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                        }
                        TextField("",text: $correo).foregroundColor(.white)
                    }
                    Divider().frame(height: 1).background(Color("Dark-cian")).padding(.bottom)
                    
                    Text("Conraseña").foregroundColor(.white)
                    ZStack(alignment: .leading){
                        if password.isEmpty {
                            Text(verbatim: "Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("",text: $password).foregroundColor(.white)
                    }
                    Divider().frame(height: 1).background(Color("Dark-cian")).padding(.bottom)
                    Text("¿Olvidaste tu contraseña?")
                        .font(.footnote)
                        .foregroundColor(Color("Dark-cian"))
                        .frame(maxWidth: 400, alignment: .trailing)
                        .padding(.bottom)
                    Button {
                        iniciarSesion()
                    } label: {
                        Text("INICIAR SESIÓN")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("Dark-cian"), lineWidth: 2.0)
                                    .shadow(color: .white, radius: 6)
                            )
                    }.padding(.bottom, 50)
                    
                    Text("Inicia sesión con redes sociales")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                    
                    HStack{
                        Button {
                            print("33")
                        } label: {
                            Text("Facebook")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 150, height: 45)
                                .background(
                                    RoundedRectangle(cornerRadius: 9, style: .continuous).fill(Color("Social-network"))
                                )
                        }
                        Spacer()
                        Button {
                            print("33")
                        } label: {
                            Text("Twitter")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 150, height: 45)
                                .background(
                                    RoundedRectangle(cornerRadius: 9, style: .continuous).fill(Color("Social-network"))
                                )
                            
                        }
                    }
                    
                }.padding(.horizontal, 50)
            }
        }
    }
} 

struct RegistroView: View {
    var body: some View{
        VStack{
            Text("Registrate").foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Image("04_swiftui-apps-ios-pantalla1")
    }
}

func iniciarSesion() -> Void {
    print("33")
}
