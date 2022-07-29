//
//  TodoDetails.swift
//  Sia
//
//  Created by Joey BARBIER on 21/07/2022.
//

import SwiftUI

extension Todo {
    struct Details: View {
        @Binding var todo: Todo
        @Binding var user: User
    }
}

extension Todo.Details {
    var body: some View {
        VStack(alignment: .leading, spacing: Padding.l) {
            description
            userDescription
            todoState
        }
        .padding(.horizontal, Padding.s)
    }
    
    var description: some View {
        VStack(alignment: .leading, spacing: Padding.s) {
            Text("Description")
            Text(todo.title)
                .multilineTextAlignment(.leading)
        }
    }
    
    var userDescription: some View {
        VStack(alignment: .leading, spacing: Padding.s) {
            Text("Created by :")
            Text(user.toString)
        }
    }
    
    var todoState: some View {
        VStack(alignment: .leading, spacing: Padding.s) {
            Toggle("State :", isOn: $todo.isCompleted)
        }
    }
}

struct TodoDetails_Previews: PreviewProvider {
    static var previews: some View {
        let todo: Todo = try! Todo.previewData()
        let user: User = try! User.previewData()
        
        Todo.Details(todo: .constant(todo), user: .constant(user))
    }
}
