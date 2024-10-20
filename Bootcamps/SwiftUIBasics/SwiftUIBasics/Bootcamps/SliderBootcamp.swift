//
//  SliderBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 13.10.24.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State var count: Double = 0
    
    var body: some View {
        VStack {
            Text(String(format: "%.2f", count))
                .font(.headline)
            
            Slider(value: $count, in: -10...10, step: 1) {
                Text("Count")
            } minimumValueLabel: {
                Text("10")
            } maximumValueLabel: {
                Text("-10")
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 20))
            .padding()
        }
    }
}

#Preview {
    SliderBootcamp()
}
