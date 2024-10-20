//
//  SheetBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 11.10.24.
//

import SwiftUI

struct SheetBootcamp: View {
    
    @State var showSheet: Bool = false
    @State var detents: PresentationDetent = .large
    
    var body: some View {
        ZStack {
            Button("Show sheet") {
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet) {
            SheetContentView()
                .presentationDetents([.medium, .large], selection: $detents)
                //.presentationDragIndicator(.hidden)
                //.interactiveDismissDisabled()
        }
        //.fullScreenCover(isPresented: $showSheet) {}
    }
}

struct SheetContentView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.semibold)
                        .tint(.primary)
                        .padding()
                }
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    SheetBootcamp()
}
