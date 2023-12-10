//
//  LaunchScreen.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import SwiftUI

struct LaunchScreen: View {
    
    @StateObject var launchViewModel = LaunchViewModel()
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    CharactersView()
                } label: {
                   ZStack {
                        Image("cersei")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                            .opacity(0.6)
                            .shadow(radius: 15)
                            
                        Text("Personajes")
                            .bold()
                            .font(.title)
                    }
                }

                NavigationLink {
                    ContinentsView()
                } label: {
                    ZStack {
                        Image("Lannister 1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                            .opacity(0.6)
                            .shadow(radius: 15)
                        
                        Text("Continentes")
                            .bold()
                            .font(.title)
                    }
                }
            }

            
            .navigationTitle("Bienvenido")
        }
    }
}
#Preview {
    LaunchScreen()
}
