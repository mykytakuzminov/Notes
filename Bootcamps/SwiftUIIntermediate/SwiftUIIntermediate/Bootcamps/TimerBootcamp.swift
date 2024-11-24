//
//  TimerBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 21.11.24.
//

import SwiftUI
import Combine

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State var currentDate = Date()
    @State var currentTab = 1
    @State var count = 0
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 40) {
            Text(dateFormatter.string(from: currentDate))
                .font(.title)
                .fontWeight(.semibold)
            
            HStack {
                Circle()
                    .frame(width: 20)
                    .offset(y: count == 1 ? -20 : 0)
                
                Circle()
                    .frame(width: 20)
                    .offset(y: count == 2 ? -20 : 0)
                
                Circle()
                    .frame(width: 20)
                    .offset(y: count == 3 ? -20 : 0)
            }
            
            TabView(selection: $currentTab) {
                Rectangle()
                    .foregroundStyle(Color.red)
                    .tag(1)
                
                Rectangle()
                    .foregroundStyle(Color.green)
                    .tag(2)
                
                Rectangle()
                    .foregroundStyle(Color.blue)
                    .tag(3)
                
                Rectangle()
                    .foregroundStyle(Color.purple)
                    .tag(4)
                
                Rectangle()
                    .foregroundStyle(Color.pink)
                    .tag(5)
            }
            .tabViewStyle(.page)
            .frame(height: 300)
        }
        .onReceive(timer) { value in
            currentDate = value
            
            withAnimation(.bouncy) {
                count = count == 3 ? 0 : count + 1
            }
            
            withAnimation(.default) {
                currentTab = currentTab == 5 ? 0 : currentTab + 1
            }
        }
    }
}

#Preview {
    TimerBootcamp()
}
