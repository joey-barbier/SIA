//
//  TodoRow.swift
//  Sia
//
//  Created by Joey BARBIER on 21/07/2022.
//

import SwiftUI

extension Todo {
    struct Row: View {
        @ObservedObject var todo: Todo
    }
}

extension Todo.Row {
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.title)
                .font(.title3)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            
            Text(todo.isCompleted ? "is completed" : "is not completed")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
        }
    }
}


struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        let item: Todo = try! Todo.previewData()
        Todo.Row(todo: item)
    }
}
