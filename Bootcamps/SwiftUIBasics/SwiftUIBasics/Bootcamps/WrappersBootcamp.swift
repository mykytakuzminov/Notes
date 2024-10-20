//
//  WrappersBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 17.10.24.
//

import SwiftUI

class ObservableObjectCounter: ObservableObject {
    @Published var count: Int = 0
    
    func increment() {
        count += 1
    }
}

struct WrappersBootcamp: View {
    
    @StateObject var counter: ObservableObjectCounter = ObservableObjectCounter()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(counter.count)")
                
                NavigationLink {
                    ObservedObjectView(counter: counter)
                } label: {
                    Text("Observed Object View")
                }
                
                NavigationLink {
                    EnvironmentObjectView()
                        .environmentObject(counter)
                } label: {
                    Text("Environment Object View")
                }
                
                Button("Increase") {
                    counter.increment()
                }
            }
        }
    }
}

struct ObservedObjectView: View {
    
    @ObservedObject var counter: ObservableObjectCounter
    
    var body: some View {
        VStack {
            Text("\(counter.count)")
        }
    }
}

struct EnvironmentObjectView: View {
    @EnvironmentObject var counter: ObservableObjectCounter
    
    var body: some View {
        VStack {
            Text("\(counter.count)")
        }
    }
}

#Preview {
    WrappersBootcamp()
        .environmentObject(ObservableObjectCounter())
}
