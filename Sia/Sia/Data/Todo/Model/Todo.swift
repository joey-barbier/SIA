//
//  Todo.swift
//  Sia
//
//  Created by Joey BARBIER on 21/07/2022.
//

import SwiftUI
import OrkaPreviewData

typealias Todos = [Todo]
class Todo: Decodable, Identifiable, ObservableObject {
    var id: Int
    var userId: Int
    var title: String
    @Published var isCompleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, userId, title
        case isCompleted = "completed"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        userId = try container.decode(Int.self, forKey: .userId)
        title = try container.decode(String.self, forKey: .title)
        isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
    }
}

extension Todo: Equatable {
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Todo: PreviewData {}
