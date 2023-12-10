//
//  CellCharacterView.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import SwiftUI

struct CellCharacterView: View {
    
    let character: Character
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: character.imageUrl ?? "cersei"), content: { image in
                image
            }, placeholder: {
                Image(systemName: "photo")
            })
            .scaledToFill()
            .opacity(0.6)
            .presentationCornerRadius(12.0)
            
            VStack{
                Text(character.firstName ?? "Personaje")
                    .font(.title)
                    .bold()
                Text(character.title ?? "Titulo del personaje")
                    .font(.title3)
            }
        }
        .frame(height: 200)
        .padding(12)
    }
        
}
#Preview {

    CellCharacterView(character: Character(id: 156, firstName: "Personaje", lastName: "GOT", fullName: "Sir Personaje", title: "Lord Personaje", family: "Lannister", image: "cersei", imageUrl: "cersei"))
}
