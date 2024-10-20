//
//  TabViewBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 16.10.24.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    enum Tabs: String, CaseIterable {
        case contacts
        case chats
        case settings
        
        var title: String {
            self.rawValue.capitalized
        }
        
        var icon: String {
            switch self {
            case .contacts:
                "person.circle.fill"
            case .chats:
                "message.fill"
            case .settings:
                "gear"
            }
        }
    }
    
    @State private var currentTab: Tabs = .chats
    
    var body: some View {
        VStack {
            TabView(selection: $currentTab) {
                ForEach(Tabs.allCases, id: \.self) { tab in
                    Tab(value: tab) {
                        Text(tab.title)
                    } label: {
                        VStack {
                            Image(systemName: tab.icon)
                            Text(tab.title)
                        }
                    }
                }
            }
            //.tabViewStyle(.page)
        }
    }
}

#Preview {
    TabViewBootcamp()
}
