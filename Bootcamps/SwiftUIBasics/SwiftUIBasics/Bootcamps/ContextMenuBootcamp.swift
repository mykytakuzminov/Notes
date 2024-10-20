//
//  ContextMenuBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 12.10.24.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Post")
                .font(.headline)
            
            Text("How to use context menu")
                .font(.subheadline)
        }
        .foregroundStyle(Color.white)
        .padding(20)
        .background(Color.purple)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .contextMenu {
            Button("Share Post") {}
            Button("Report Post", role: .destructive) {}
            Button("Delete Post", role: .destructive) {}
        }
    }
}

#Preview {
    ContextMenuBootcamp()
}
