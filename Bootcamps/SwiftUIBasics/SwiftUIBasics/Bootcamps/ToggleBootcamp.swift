//
//  ToggleBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 13.10.24.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        Toggle("Airplane Mode", systemImage: "airplane", isOn: $isOn)
            .padding()
            .background(Color.yellow)
            .clipShape(.rect(cornerRadius: 20))
            .padding()
    }
}

#Preview {
    ToggleBootcamp()
}
