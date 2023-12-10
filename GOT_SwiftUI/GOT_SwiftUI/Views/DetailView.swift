//
//  DetailView.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import SwiftUI

struct DetailView: View {
    var character: Character
    var body: some View {
        VStack{
            Text(character.title ?? "_")
                .bold()
                .font(.largeTitle)
            Text(character.fullName ?? "_")
                .font(.title2)
            AsyncImage(url: URL(string: character.imageUrl ?? "cersei"), content: { image in
                image
                    .resizable()
                    .scaledToFit()
            }, placeholder: {
                Image(systemName: "photo")
            })
           
            .cornerRadius(18)
            .shadow(radius: 12)
            .padding()
            Text(character.firstName ?? "_")
            Text(character.lastName ?? "_")
            Text(character.family ?? "_")
        }
        .backgroundStyle(Color(.clear))
    }
}
#Preview {
    DetailView(character: Character(id: 156, firstName: "Personaje", lastName: "GOT", fullName: "Sir Personaje", title: "Lord Personaje", family: "Lannister", image: "cersei", imageUrl: "cersei"))
}
