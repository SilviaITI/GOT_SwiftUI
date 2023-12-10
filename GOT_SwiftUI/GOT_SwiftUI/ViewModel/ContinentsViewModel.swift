//
//  ContinentsViewModel.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import Foundation
import Combine

enum ContinentsState {
    case loading
    case error(error: String)
    case none
    case loaded
}
final class ContinentsViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var continents: [Continent] = []
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorText = ""
    
    var subscribers = Set<AnyCancellable>()
    var status = ContinentsState.none
    
    //MARK: - Init
    init() {
        getContinents()
        print(continents)
    }
    
    //MARK: - Api functions
    func getContinents() {
        status = .loading
        URLSession.shared
            .dataTaskPublisher(for: .request(networkRequest: .getContinents))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    self.status = .error(error: "Error al construir url")
                    throw URLError(.badServerResponse)
                }
                print("received response\($0.data.base64EncodedString())")
                return $0.data
            }
            .decode(type: [Continent].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  completion in
                switch completion {
                case .failure:
                    self?.status = .error(error: "Error al cargar los héroes")
                case .finished:
                    self?.status = .loaded
                }
            } receiveValue: { [weak self] (response: [Continent])  in
                self?.continents = response
                
            }
            .store(in: &subscribers)
    }
}
