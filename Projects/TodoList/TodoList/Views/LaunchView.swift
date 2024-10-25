//
//  LaunchView.swift
//  TodoList
//
//  Created by Mykyta Kuzminov on 24.10.24.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            background
            
            VStack {
                icon
                text
            }
        }
    }
}

#Preview {
    LaunchView()
}

extension LaunchView {
    
    private var background: some View {
        Color.accentColor.ignoresSafeArea()
    }
    
    private var icon: some View {
        Image(systemName: "checkmark.circle.fill")
            .foregroundStyle(Color.white)
            .font(.system(size: 150))
    }
    
    private var text: some View {
        Text("Doing things.")
            .foregroundStyle(Color.white)
            .font(.largeTitle)
    }
}
