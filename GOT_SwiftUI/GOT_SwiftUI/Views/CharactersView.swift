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
    
            List {
                ForEach(viewModel.characters) {
                    data in
                    NavigationLink {
                        DetailView(character: data)
                    } label : {
                        CellCharacterView(character: data)
                    }
                }
            
        
            }
        }
    }

#Preview {
    CharactersView()
}
