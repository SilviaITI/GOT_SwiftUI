//
//  NetworkModel.swift
//  GOT_SwiftUI
//
//  Created by Silvia Casanova Martinez on 10/12/23.
//

import Foundation
import Combine

enum NetworkModel {
    case getCharacters
    case getContinents
}

extension NetworkModel {
    var path: String {
        switch self {
        case .getCharacters:
            return "/api/v2/Characters"
        case .getContinents:
            return "/api/v2/Continents"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCharacters,
             .getContinents:
            return .get
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        default:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    var headers: [String: String]? {
        var header = NetworkModel.defaultHeaders
        if let body {
            header["Content-Length"] = "\(body.count)"
        }
        switch self {
            
        default: ()
        }
        return header
    }
    
    private static var defaultHeaders: [String: String] {
        return [
            "Accept": "application/json",
            "Content-type": "application/json"
        ]
    }
    
    var baseURL: String {
        "https://thronesapi.com"
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


extension URLRequest {
    // Método encargado de crear el request de la llamada al servicio
    static func request(networkRequest: NetworkModel) -> URLRequest {
        var bodyString = ""
        var comps = URLComponents(string: networkRequest.baseURL)
        comps?.path = networkRequest.path
        var request = URLRequest(url: (comps?.url)!)
        if let query = networkRequest.query {
            comps?.queryItems = query
        }
        if let body = networkRequest.body {
            request.httpBody = body
            bodyString = String(data: networkRequest.body!, encoding: .utf8) ?? ""
        }
        request.url = comps?.url
        request.httpMethod = networkRequest.method.rawValue
        request.allHTTPHeaderFields = networkRequest.headers
        print("💡 Headers: \(request.allHTTPHeaderFields ?? ["":""])")
        print("🚀", networkRequest.method.rawValue, comps?.url ?? "", bodyString)
        return request
    }
}
