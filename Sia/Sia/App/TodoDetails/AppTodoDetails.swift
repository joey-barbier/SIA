//
//  TodoDetails.swift
//  Sia
//
//  Created by Joey BARBIER on 23/07/2022.
//

import SwiftUI
import OrkaApiRouter


extension App {
    struct TodoDetails: View {
        @Binding var todo: Todo
        @State var user: User? = nil
    }
}

extension App.TodoDetails {
    var body: some View {
        VStack {
            details()
                .padding(.top, Padding.m)
            
            Spacer()
        }
        .navigationTitle("Todo n°\(todo.id)")
        .task {
            self.user = try? await ApiRouter.User.get(id: "\(todo.userId)").call()
        }
    }
    
    func details() -> some View {
        guard user != nil else {
            return AnyView(EmptyView())
        }
        
        let userBinding = Binding<User>(get: {
            return self.user!
        }, set: { user in
            self.user = user
        })
        
        return AnyView(Todo.Details(todo: $todo,
                                    user: userBinding))
    }   
}

struct AppTodoDetails_Previews: PreviewProvider {
    static var previews: some View {
        let todo: Todo = try! Todo.previewData()
        App.TodoDetails(todo: .constant(todo))
    }
}
