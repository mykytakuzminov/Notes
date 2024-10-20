//
//  AnyLayoutBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 19.10.24.
//

import SwiftUI

struct AnyLayoutBootcamp: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        VStack {
            let layout: AnyLayout = verticalSizeClass == .compact ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
            
            layout {
                Text("Alpha")
                Text("Beta")
                Text("Gamma")
            }
        }
    }
}

#Preview {
    AnyLayoutBootcamp()
}
