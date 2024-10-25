//
//  NoItemsView.swift
//  TodoList
//
//  Created by Mykyta Kuzminov on 24.10.24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                text
                navigateButton
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NavigationStack {
        NoItemsView()
            .navigationTitle("Title")
    }
}

extension NoItemsView {
    
    private var text: some View {
        VStack {
            Text("There are no items!")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                .padding(.bottom, 20)
        }
    }
    
    private var navigateButton: some View {
        NavigationLink {
            AddView()
        } label: {
            Text("Add something 🥳")
                .foregroundStyle(Color.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(animate ? Color.secondaryAccent : Color.accentColor)
                .clipShape(.rect(cornerRadius: 10))
        }
        .padding(.horizontal, animate ? 30 : 50)
        .shadow(
            color: animate ? Color.secondaryAccent.opacity(0.7) : Color.accentColor.opacity(0.7),
            radius: animate ? 30 : 10,
            x: 0.0,
            y: animate ? 50 : 30)
        .scaleEffect(animate ? 1.1 : 1.0)
        .offset(y: animate ? -7 : 0)
    }
    
    private func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}
