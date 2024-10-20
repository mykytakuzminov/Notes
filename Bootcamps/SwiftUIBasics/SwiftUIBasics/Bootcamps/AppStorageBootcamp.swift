//
//  AppStorageBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 17.10.24.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    @AppStorage("username") var username = "User"
    
    @State private var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Write your username here...", text: $textFieldText)
                    .padding(.horizontal)
                    .font(.headline)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 10))
                
                Button {
                    if check() {
                        withAnimation(.default) {
                            username = textFieldText
                        }
                        clear()
                    }
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(check() ? .blue : .gray)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .disabled(!check())
            }
            .navigationTitle("Hello, \(username)!")
        }
    }
    
    private func clear() {
        textFieldText = ""
    }
    
    private func check() -> Bool {
        textFieldText.count > 4
    }
}

#Preview {
    AppStorageBootcamp()
}
