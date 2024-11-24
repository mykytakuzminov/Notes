//
//  GeometryReaderBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 13.11.24.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<30) { index in
                        GeometryReader { geo in
                            Text("\(index)")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .frame(width: 300, height: 200)
                                .background(Color.black)
                                .clipShape(.rect(cornerRadius: 10))
                                .scaleEffect(getScale(proxy: proxy, geo: geo))
                                .padding(.vertical)
                        }
                        .frame(width: 300, height: 400)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    private func getScale(proxy: GeometryProxy, geo: GeometryProxy) -> CGFloat {
            let screenCenter = proxy.size.width / 2
            let cardCenter = geo.frame(in: .global).midX
            let distance = abs(cardCenter - screenCenter)
            let scale = max(0.7, 1 - (distance / screenCenter) * 0.1)
            return scale
        }
}

#Preview {
    GeometryReaderBootcamp()
}
