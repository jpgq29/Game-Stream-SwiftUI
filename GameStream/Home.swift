//
//  Home.swift
//  GameStream
//
//  Created by Appa on 15/12/22.
//

import SwiftUI

struct Home: View {
    @State var tabSeleccionado: Int = 1
    var body: some View {
        TabView(selection: $tabSeleccionado){
            Text("Pantalla Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            PantallaHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(1)
            Text("Pantalla Juegos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(2)
            Text("Pantalla Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }
        .accentColor(.white)
    }
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBar-color"))
        UITabBar.appearance().isTranslucent = true
        print("Iniciando las vistas de Home")
    }
}

struct PantallaHome: View {
    @State var textoBusqueda:String = ""
    var body: some View{
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack {
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11)
                HStack{
                    Button {
                        busqueda()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-cian"))
                    }
                    
                    ZStack(alignment: .leading){
                        if textoBusqueda.isEmpty {
                            Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                        }
                        TextField("", text: $textoBusqueda)
                            .foregroundColor(.white)
                    }
                    
                }.padding([.top, .leading, .bottom], 11)
                    .background(Color("TabBar-color"))
                    .clipShape(Capsule())
            }.padding(.horizontal, 18)
        }.navigationBarHidden(true)
    }
}

func busqueda()->Void{
    print("busqueda")
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
