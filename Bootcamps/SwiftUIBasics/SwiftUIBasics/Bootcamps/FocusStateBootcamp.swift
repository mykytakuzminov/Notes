//
//  FocusStateBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 17.10.24.
//

import SwiftUI

struct FocusStateBootcamp: View {
    
    enum FieldFocusing: Hashable {
        case username
        case password
    }
    
    @FocusState private var fieldFocus: FieldFocusing?
    
    @State private var usernameTextField: String = ""
    @State private var passwordTextField: String = ""
    
    @State var data: [String: String] = [:]
    
    var body: some View {
        VStack {
            TextField("Your username here...", text: $usernameTextField)
                .focused($fieldFocus, equals: .username)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
                .padding(.top, 20)
            
            TextField("Your password here...", text: $passwordTextField)
                .focused($fieldFocus, equals: .password)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
            
            Button {
                if usernameTextField.isEmpty {
                    fieldFocus = .username
                } else if passwordTextField.isEmpty {
                    fieldFocus = .password
                } else {
                    data[usernameTextField] = passwordTextField
                    fieldFocus = nil
                    usernameTextField = ""
                    passwordTextField = ""
                }
            } label: {
                Text("Save")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.blue)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)
            }
            
            List {
                ForEach(Array(data.keys), id: \.self) { username in
                    if let password = data[username] {
                        Text("\(username): \(password)")
                    }
                }
            }
        }
    }
}

#Preview {
    FocusStateBootcamp()
}
