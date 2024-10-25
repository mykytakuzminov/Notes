//
//  AddView.swift
//  TodoList
//
//  Created by Mykyta Kuzminov on 20.10.24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    
    @FocusState private var focused: Bool
    
    @State private var textFieldText: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                textField
                
                saveButton
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✏️")
        .alert(alertTitle, isPresented: $showAlert) {}
        .onAppear { focused = true }
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}

extension AddView {
    
    private var textField: some View {
        TextField("Type something here...", text: $textFieldText)
            .focused($focused)
            .padding(.horizontal)
            .frame(height: 55)
            .background(.thinMaterial)
            .clipShape(.rect(cornerRadius: 10))
    }
    
    private var saveButton: some View {
        Button {
            save()
        } label: {
            Text("Save".uppercased())
                .font(.headline)
                .foregroundStyle(Color.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
    
    private func save() {
        if textIsAppropriate() {
            listViewModel.add(title: textFieldText)
            dismiss()
        }
    }
    
    private func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
}
