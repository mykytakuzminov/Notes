//
//  ScrollViewReaderBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 13.11.24.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State private var textFieldText = ""
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                HStack {
                    TextField("Number...", text: $textFieldText)
                        .font(.headline)
                        .foregroundStyle(Color.secondary)
                        .padding()
                        .background(.thickMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.vertical)
                        .padding(.leading)
                    
                    Image(systemName: "magnifyingglass")
                        .font(.headline)
                        .foregroundStyle(Color.secondary)
                        .padding()
                        .background(.thickMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.vertical)
                        .padding(.trailing)
                        .onTapGesture {
                            if let index = Int(textFieldText) {
                                withAnimation(.default) {
                                    proxy.scrollTo(index, anchor: .center)
                                }
                            }
                            
                            textFieldText = ""
                        }
                }
                
                ScrollView {
                    ForEach(1..<51) { index in
                        Text("\(index)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                            .background(.thickMaterial)
                            .clipShape(.rect(cornerRadius: 10))
                            .shadow(radius: 1)
                            .padding(.horizontal)
                            .padding(.top)
                            .id(index)
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
