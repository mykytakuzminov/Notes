//
//  ImagePaintBootcamp.swift
//  SwiftUIDrawings
//
//  Created by Mykyta Kuzminov on 31.10.24.
//

import SwiftUI

struct ImagePaintBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(ImagePaint(image: Image("Pattern"), scale: 0.7), style: StrokeStyle(lineWidth: 30))
            .frame(width: 300, height: 300)
    }
}

#Preview {
    ImagePaintBootcamp()
}
