//
//  LongPressGestureBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 12.11.24.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State private var isComplete: Bool = false
    @State private var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(width: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
                .clipShape(.rect(cornerRadius: 15))
                .padding()
                .shadow(radius: 10)
            
                ZStack {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 75, height: 75)
                    
                    Image(systemName: "hand.rays.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(Color.white)
                        .symbolEffect(.bounce, value: isComplete)
                        .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                            withAnimation(.easeInOut) {
                                isSuccess = true
                            }
                        } onPressingChanged: { isPressing in
                            if isPressing {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    isComplete = true
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    if !isSuccess {
                                        withAnimation(.easeInOut(duration: 1.0)) {
                                            isComplete = false
                                        }
                                    }
                                }
                            }
                        }
            }
        }
    }
}

#Preview {
    LongPressGestureBootcamp()
}

