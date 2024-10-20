//
//  MacrosBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 20.10.24.
//

import SwiftUI

import SwiftUI

@Observable class ObservableCounter {
    var count: Int = 0
    
    func increment() {
        count += 1
    }
}

struct MacrosBootcamp: View {
    
    @State var counter: ObservableCounter = ObservableCounter()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(counter.count)")
                
                NavigationLink {
                    BindableView(counter: counter)
                } label: {
                    Text("Bindable View")
                }
                
                NavigationLink {
                    EnvironmentView()
                        .environment(counter)
                } label: {
                    Text("Environment View")
                }
                
                Button("Increase") {
                    counter.increment()
                }
            }
        }
    }
}

struct BindableView: View {
    
    @Bindable var counter: ObservableCounter
    
    var body: some View {
        VStack {
            Text("\(counter.count)")
        }
    }
}

struct EnvironmentView: View {
    @Environment(ObservableCounter.self) var counter
    
    var body: some View {
        VStack {
            Text("\(counter.count)")
        }
    }
}

#Preview {
    MacrosBootcamp()
}
