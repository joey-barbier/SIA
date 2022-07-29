//
//  User.swift
//  Sia
//
//  Created by Joey BARBIER on 21/07/2022.
//

import Foundation
import OrkaPreviewData

class User: Decodable, Identifiable {
    var id: Int
    var email: String
    var username: String
    var website: String
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

extension User: PreviewData {}
