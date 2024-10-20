//
//  BadgeBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 17.10.24.
//

import SwiftUI

struct BadgeBootcamp: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                Text("Home")
            }
            .badge(2)
            
            Tab("Notifications", systemImage: "bell") {
                Text("Notifications")
            }
            .badge(7)
        }
    }
}

#Preview {
    BadgeBootcamp()
}
