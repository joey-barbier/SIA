//
//  TodoList.swift
//  Sia
//
//  Created by Joey BARBIER on 21/07/2022.
//

import SwiftUI

extension Todo {
    struct List<TargetView: View>: View {
        @Binding var todos: Todos
        var destination: ((Binding<Todo>) -> TargetView)
    }
}


extension Todo {
    struct Test: View {
        var body: some View {
            Text("WP !")
        }
    }
}

extension Todo.List {
    var body: some View {
        ScrollView {
            VStack {
                ForEach($todos) { todo in
                    NavigationLink {
                        destination(todo)
                    } label: {
                        VStack(alignment: .leading) {
                            Todo.Row(todo: todo.wrappedValue)
                                .padding(.horizontal, Padding.s)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray)
                                .padding(.vertical, Padding.s)
                        }
                        .contentShape(Rectangle())
                    }
                }
            }
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        let items: Todos = try! Todo.previewData()
        
        Todo.List(todos: .constant(items)) { todo in
            App.TodoDetails(todo: todo)
        }
    }
}
