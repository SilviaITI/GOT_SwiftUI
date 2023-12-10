//
//  CharactersViewModel.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import Foundation
import Combine
enum CharactersState {
    case loading
    case error(error: String)
    case none
    case loaded
}
final class CharactersViewModel: ObservableObject {
    // MARK: - Properties
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorText = ""
    
    var subscribers = Set<AnyCancellable>()
    var status = CharactersState.none
    
    init() {
        getCharacters()
    }
    // MARK: Api functions
    func getCharacters() {
        status = .loading
        URLSession.shared
            .dataTaskPublisher(for: .request(networkRequest: .getCharacters))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    self.status = .error(error: "Error al construir url")
                    throw URLError(.badServerResponse)
                }
                print("received response\($0.data.base64EncodedString())")
                return $0.data
            }
            .decode(type: [Character].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  completion in
                switch completion {
                case .failure:
                    self?.status = .error(error: "Error al cargar los héroes")
                case .finished:
                    self?.status = .loaded
                }
            } receiveValue: { [weak self] (response: [Character])  in
                self?.characters = response
                
            }
            .store(in: &subscribers)
    }
}

