//
//  ListRowView.swift
//  TodoList
//
//  Created by Mykyta Kuzminov on 20.10.24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            doneSign
            text
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "This is the first item!", isCompleted: true))
        .environmentObject(ListViewModel())
}

extension ListRowView {
    
    private var doneSign: some View {
        Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
            .foregroundStyle(item.isCompleted ? .green : .red)
    }
    
    private var text: some View {
        Text(item.title)
    }
}
