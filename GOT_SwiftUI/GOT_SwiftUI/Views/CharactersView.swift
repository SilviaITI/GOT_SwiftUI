//
//  CharactersView.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var viewModel = CharactersViewModel()
    var body: some View {
        Group{
            List {
                ForEach(viewModel.characters) {
                    data in
                    NavigationLink {
                        DetailView()
                    } label : {
                        CellCharacterView(character: data)
                    }
                }
            }
        
            }
        }
    }

#Preview {
    CharactersView()
}
