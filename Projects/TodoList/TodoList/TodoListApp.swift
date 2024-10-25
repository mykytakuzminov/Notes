//
//  TodoListApp.swift
//  TodoList
//
//  Created by Mykyta Kuzminov on 20.10.24.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    @State private var showLaunchView: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showLaunchView {
                    LaunchView()
                } else {
                    NavigationStack {
                        ListView()
                    }
                    .environmentObject(listViewModel)
                }
            }
            .animation(.easeInOut, value: showLaunchView)
            .onAppear(perform: addDuration)
        }
    }
    
    private func addDuration() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut) {
                showLaunchView = false
            }
        }
    }
}
