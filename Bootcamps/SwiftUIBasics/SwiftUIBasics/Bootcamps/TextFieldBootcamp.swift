//
//  TextFieldBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 12.10.24.
//

import SwiftUI

struct TextFieldBootcamp: View {
    
    @State var nameTextField: String = ""
    @State var names: [String] = []
    
    var body: some View {
        VStack {
            TextField("Your name here...", text: $nameTextField)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
                .padding(.top, 20)
            
            Button {
                names.append(nameTextField)
                nameTextField = ""
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
                ForEach(names, id: \.self) { name in
                    Text(name.capitalized)
                }
            }
        }
    }
}

#Preview {
    TextFieldBootcamp()
}
