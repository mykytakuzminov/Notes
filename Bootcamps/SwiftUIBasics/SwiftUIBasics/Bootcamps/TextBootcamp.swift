//
//  TextBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, World!")
            //.font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.cyan)
            //.bold()
            //.underline()
            //.underline(true, color: .green)
            .underline(true, pattern: .dot, color: .green)
            .italic()
            //.strikethrough()
            .strikethrough(true, color: .red)
            //.strikethrough(true, pattern: .dot, color: .blue)
            //.font(.system(size: 24, weight: .semibold, design: .monospaced))
            .font(.custom("AvenirNext-Medium", size: 24))
            .baselineOffset(10)
            .kerning(3)
            //.multilineTextAlignment(.leading)
            //.minimumScaleFactor(0.7)
    }
}

#Preview {
    TextBootcamp()
}
