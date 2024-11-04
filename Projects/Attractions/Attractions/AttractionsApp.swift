//
//  AttractionsApp.swift
//  Attractions
//
//  Created by Mykyta Kuzminov on 02.11.24.
//

import SwiftUI

@main
struct AttractionsApp: App {
    
    @StateObject private var locationsViewModel = LocationsViewModel()
    
    @State private var showLaunchView: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showLaunchView {
                    LaunchView()
                } else {
                    LocationsView()
                        .environmentObject(locationsViewModel)
                }
            }
            .animation(.default, value: showLaunchView)
            .onAppear(perform: addDuration)
        }
    }
    
    private func addDuration() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.default) {
                    showLaunchView = false
                }
            }
        }
}
