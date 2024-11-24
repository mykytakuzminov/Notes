//
//  AlignmentGuideBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 24.11.24.
//

import SwiftUI

struct AlignmentGuideBootcamp: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            row(title: "Row 1", showIcon: false)
            row(title: "Row 2", showIcon: true)
            row(title: "Row 3", showIcon: false)
        }
        .padding()
        .background(.thickMaterial)
        .clipShape(.rect(cornerRadius: 10))
        .shadow(radius: 2)
    }
}

#Preview {
    AlignmentGuideBootcamp()
}

extension AlignmentGuideBootcamp {
     
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            
            Text(title)
        }
        .alignmentGuide(.leading) { dimensions in
            return showIcon ? 40 : 0
        }
    }
}
