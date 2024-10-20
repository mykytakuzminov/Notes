//
//  DatePickerBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 13.10.24.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var date: Date = .now
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        VStack {
            Text(formattedDate(date: date))
                .font(.headline)
            
            DatePicker("Select a date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(.rect(cornerRadius: 20))
                .padding()
        }
    }
    
    func formattedDate(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}

#Preview {
    DatePickerBootcamp()
}
