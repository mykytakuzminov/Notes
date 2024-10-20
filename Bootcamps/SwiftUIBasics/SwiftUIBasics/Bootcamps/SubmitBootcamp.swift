//
//  SubmitBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 17.10.24.
//

import SwiftUI

struct SubmitBootcamp: View {
    
    @State private var textFieldText: String = ""
    
    var body: some View {
        TextField("Write something here...", text: $textFieldText)
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal)
            .submitLabel(.done)
            .onSubmit {
                textFieldText = "Done"
            }
    }
}

#Preview {
    SubmitBootcamp()
}
