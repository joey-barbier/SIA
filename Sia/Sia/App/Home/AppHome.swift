//
//  Home.swift
//  Sia
//
//  Created by Joey BARBIER on 21/07/2022.
//

import SwiftUI
import OrkaApiRouter

extension App {
    struct Home: View {
        @State var todos: Todos = []
    }
}

extension App.Home {
    var body: some View {
        Todo.List(todos: $todos){ todo in
            App.TodoDetails(todo: todo)
        }
        .padding(.top, Padding.m)
        .navigationTitle("Todo List")
        .task {
            guard self.todos.isEmpty else {return}
            let items: Todos? = try? await ApiRouter.Todo.list.call()
            self.todos = items ?? []
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        let items: Todos = try! Todo.previewData()
        App.Home(todos: items)
    }
}
