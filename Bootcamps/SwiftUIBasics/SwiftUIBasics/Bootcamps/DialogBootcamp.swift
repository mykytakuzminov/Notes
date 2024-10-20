//
//  DialogBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 12.10.24.
//

import SwiftUI

struct DialogBootcamp: View {
    
    enum DialogType {
        case myPost
        case otherPost
    }
    
    @State var showDialog: Bool = false
    @State var dialogType: DialogType = .myPost
    
    var body: some View {
        VStack {
            Button("As a my post") {
                dialogType = .myPost
                showDialog.toggle()
            }
            Button("As an other post") {
                dialogType = .otherPost
                showDialog.toggle()
            }
        }
        .confirmationDialog("What would you like to do?", isPresented: $showDialog) {
            getButtons()
        }
    }
    
    @ViewBuilder
    private func getButtons() -> some View {
        switch dialogType {
        case .myPost:
            Button("Edit Post") {}
            Button("Share Post") {}
            Button("Delete Post", role: .destructive) {}
            Button("Cansel", role: .cancel) {}
        case .otherPost:
            Button("Mute Notifications") {}
            Button("Report Post", role: .destructive) {}
            Button("Block User", role: .destructive) {}
            Button("Cansel", role: .cancel) {}
        }
    }
}

#Preview {
    DialogBootcamp()
}
