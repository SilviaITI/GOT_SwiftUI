//
//  ContinentsView.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import SwiftUI

struct ContinentsView: View {
  @StateObject var viewModel = ContinentsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.continents) {
                data in
                Text(data.name ?? "_")
            }
            .navigationTitle("Continentes")
        }
        .onAppear {
            viewModel.getContinents()
        }
    }
        
}


#Preview {
    ContinentsView()
}
