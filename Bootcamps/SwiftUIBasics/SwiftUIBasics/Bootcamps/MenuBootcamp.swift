//
//  MenuBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 19.10.24.
//

import SwiftUI

struct MenuBootcamp: View {
    
    enum SortOption: String, CaseIterable {
        case priceLowToHigh = "Price: Low to High"
        case priceHighToLow = "Price: High to Low"
        case recentlyAdded = "Recently Added"
    }
    
    @State private var sortOption: SortOption?
    
    var body: some View {
        Menu(sortOption?.rawValue.capitalized ?? "Sort") {
            ForEach(SortOption.allCases, id: \.self) { option in
                Button(option.rawValue) { sortOption = option }
            }
        }
    }
}

#Preview {
    MenuBootcamp()
}
