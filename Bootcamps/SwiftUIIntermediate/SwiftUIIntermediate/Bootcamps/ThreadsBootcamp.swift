//
//  ThreadsBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 19.11.24.
//

import SwiftUI

final class ThreadsViewModel: ObservableObject {
    
    @Published var numbers: [String] = []
    
    func fetchNumbers() {
        DispatchQueue.global(qos: .background).async {
            let numbers = self.downloadNumbers()
            
            print("Check 1: \(Thread.isMainThread)")
            print("Check 1: \(Thread.current)")
            
            DispatchQueue.main.async {
                self.numbers = numbers
                
                print("Check 2: \(Thread.isMainThread)")
                print("Check 2: \(Thread.current)")
            }
        }
    }
    
    private func downloadNumbers() -> [String] {
        var numbers: [String] = []
        for i in 0..<30 {
            numbers.append("\(i)")
        }
        
        return numbers
    }
}

struct ThreadsBootcamp: View {
    
    @StateObject private var vm = ThreadsViewModel()
    
    var body: some View {
        ScrollView {
            Button("Load numbers") {
                vm.fetchNumbers()
            }
            .buttonStyle(.borderedProminent)
            
            LazyVStack {
                ForEach(vm.numbers, id: \.self) { number in
                    Text(number)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.horizontal)
                }
            }
            
        }
    }
}

#Preview {
    ThreadsBootcamp()
}
