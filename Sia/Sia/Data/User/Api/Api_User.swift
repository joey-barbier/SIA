//
//  Api_Todo.swift
//  Sia
//
//  Created by Joey BARBIER on 23/07/2022.
//

import Foundation
import OrkaApiRouter
import Alamofire

extension ApiRouter {
    enum User: Route {
        case get(id: String)
    }
}

extension ApiRouter.User {
    var baseUrl: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .get(let id):
            return "/users/\(id)"
        }
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    var headers: HTTPHeaders? {
        return nil
    }
}
