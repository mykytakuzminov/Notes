//
//  EscapingBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 20.11.24.
//

import SwiftUI

typealias CompletionHandler = (_ data: [String]) -> ()

final class EscapingViewModel: ObservableObject {
    
    @Published var data: [String] = []
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        downloadData { [weak self] data in
            self?.data = data
        }
    }
    
    private func downloadData(completionHandler: @escaping CompletionHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler(["Apple", "Banana", "Cherry", "Mango"])
        }
    }
    
}

struct EscapingBootcamp: View {
    
    @StateObject private var vm = EscapingViewModel()
    
    var body: some View {
        VStack {
            ForEach(vm.data, id: \.self) { fruit in
                Text(fruit)
            }
        }
    }
}

#Preview {
    EscapingBootcamp()
}
