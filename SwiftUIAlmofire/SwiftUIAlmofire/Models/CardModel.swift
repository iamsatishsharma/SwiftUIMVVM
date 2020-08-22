//
//  CardModel.swift
//  SwiftUIAlmofire
//
//  Created by Satish Sharma on 20/08/20.
//  Copyright © 2020 Satish Sharma. All rights reserved.
//

import Foundation

// MARK: Model CardModel

struct CardModel : Identifiable, Codable {
    
    var id: Int
    var login: String
    var avatar_url: String
    var repos_url: String
}

//class CardModel : Identifiable, Codable, Mappable {
//
//    var id: Int
//    var name: String
//    var url: String
//
//   required init?(map: Map) {
//    }
//
//    mutating func mapping(map: Map) {
//           name     <- map["login"]
//           url     <- map["avatar_url"]
//           repos     <- map["repos_url"]
//       }
//
//}
//
