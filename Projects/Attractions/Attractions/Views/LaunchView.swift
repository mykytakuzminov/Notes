//
//  LaunchView.swift
//  Attractions
//
//  Created by Mykyta Kuzminov on 04.11.24.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
        }
    }
}

#Preview {
    LaunchView()
}
