//
//  LaunchScreen.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import SwiftUI

struct LaunchScreen: View {
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    CharactersView()
                } label: {
                    itemLaunch(imageUrl: "cersei", text: "Personajes")
                }
                NavigationLink {
                    ContinentsView()
                } label: {
                    itemLaunch(imageUrl: "Lannister 1", text: "Continentes")
                }
            }
        }
    }
    
}
struct itemLaunch: View {
    var imageUrl: String
    var text: String
    var body: some View {
        
        ZStack {
            Image(imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .opacity(0.6)
                .shadow(radius: 15)
            
            Text(text)
                .bold()
                .font(.title)
        }
    }
}
#Preview {
    LaunchScreen()
}
