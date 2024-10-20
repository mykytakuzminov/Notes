//
//  StepperBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 13.10.24.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var count: Int = 0
    
    var body: some View {
        Stepper("Count: \(count)", value: $count, step: 3)
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 20))
            .padding()
    }
}

#Preview {
    StepperBootcamp()
}
