//
//  ListBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 11.10.24.
//

import SwiftUI

struct ListBootcamp: View {
    
    enum Tabs: String, CaseIterable, Identifiable {
        case notifications = "Notifications and Sounds"
        case privacy = "Privacy and Security"
        
        var id: Self { self }
        
        var icon: String {
            switch self {
            case .notifications: return "bell"
            case .privacy: return "lock"
            }
        }
        
        @ViewBuilder
        var destination: some View {
            switch self {
            case .notifications: NotificationsAndSounds()
            case .privacy: PrivacyAndSecurity()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Tabs.allCases) { tab in
                    NavigationLink {
                        tab.destination
                    } label: {
                        HStack {
                            Image(systemName: tab.icon)
                            Text(tab.rawValue)
                        }
                    }

                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct NotificationsAndSounds: View {
    var body: some View {
        List {
            Section("Message notifications") {
                Text("Private Chats")
                Text("Group Chats")
                Text("Channels")
                Text("Stories")
                Text("Reactions")
            }
            
            Section("In-app notifications") {
                Text("In-App Sounds")
                Text("In-App Vibrate")
                Text("In-App Preview")
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        //.listStyle(.grouped)
    }
}

struct PrivacyAndSecurity: View {
    
    @State var categories = [
        "Privacy",
        "Phone Number",
        "Last Seen & Online",
        "Profile Photos",
        "Bio",
        "Date of Birth",
        "Forwarded Messages",
        "Calls",
        "Invites"
    ]
    
    var body: some View {
        List {
            Section("Privacy") {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
                //.listRowBackground(Color.green)
            }
        }
        .navigationTitle("Privacy and Security")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
        
    }
    
    func delete(indexSet: IndexSet) {
        categories.remove(atOffsets: indexSet)
    }
    
    func move(indexSet: IndexSet, newOffset: Int) {
        categories.move(fromOffsets: indexSet, toOffset: newOffset)
    }
}

#Preview {
    ListBootcamp()
}
