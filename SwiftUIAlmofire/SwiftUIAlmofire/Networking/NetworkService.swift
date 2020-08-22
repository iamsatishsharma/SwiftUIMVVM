//
//  NetworkService.swift
//  SwiftUIAlmofire
//
//  Created by Satish Sharma on 21/08/20.
//  Copyright © 2020 Satish Sharma. All rights reserved.
//

import Foundation

// MARK: services
enum services :String{
    case orgs = "users/hadley/orgs"
    case users = "users/"
}

// MARK: baseURL
var baseURL: String {
    switch NetworkManager.networkEnviroment {
        case .dev: return "https://api.github.com/"
        case .production: return "https://api.github.com/"
        case .stage: return "https://api.github.com/"
    }
}

class NetworkService : NSObject{
    
}
