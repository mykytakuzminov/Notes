//
//  UnavailabelViewBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 20.10.24.
//

import SwiftUI

struct UnavailabelViewBootcamp: View {
    var body: some View {
        ContentUnavailableView(
            "No Internet Connection",
            systemImage: "wifi.slash",
            description: Text("Please connect to the Internet and try again."))
    }
}

#Preview {
    UnavailabelViewBootcamp()
}
