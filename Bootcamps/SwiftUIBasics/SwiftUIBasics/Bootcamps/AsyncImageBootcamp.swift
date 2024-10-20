//
//  AsyncImageBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 17.10.24.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        VStack {
            AsyncImage(url: url)
            
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
            
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                case .failure(let error):
                    Text(error.localizedDescription)
                default:
                    Text("")
                }
            }

        }
    }
}

#Preview {
    AsyncImageBootcamp()
}
