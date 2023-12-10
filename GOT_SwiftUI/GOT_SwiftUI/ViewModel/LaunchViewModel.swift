//
//  LaunchViewModel.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import Foundation
enum LaunchState {
    case characters
    case continents
    case launch
}
final class LaunchViewModel: ObservableObject {
    // MARK: - Properties
    @Published var status = LaunchState.launch
    
    // MARK: - Public functions
    func changeState() {
        switch status {
        case .characters:
            break
        case .continents:
            break
        case .launch:
            break
        }
            
        }
    }

