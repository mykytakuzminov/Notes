//
//  NavigationBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 11.10.24.
//

import SwiftUI

struct User: Hashable {
    let name: String
    let surname: String
}

struct NavigationBootcamp: View {
    
    @State private var users: [User] = [
        User(name: "John", surname: "Bender"),
        User(name: "Walter", surname: "Hansen"),
        User(name: "Kurt", surname: "Fischer"),
    ]
    
    @State private var pathes: [User] = [
    
    ]
    
    var body: some View {
        NavigationStack(path: $pathes) {
            List {
                Section("Navigation with value") {
                    ForEach(users, id: \.self) { user in
                        NavigationLink(value: user) {
                            Text("Profile: \(user.name)")
                        }
                    }
                }
                
                Section("Navigation with path") {
                    Button {
                        pathes.append(contentsOf: [users[0], users[1], users[2]])
                    } label: {
                        Text("Open all profiles")
                    }
                }
            }
            .navigationTitle("Navigation")
            .navigationDestination(for: User.self) { user in
                UserInfoView(user: user)
            }
            .navigationBarTitleDisplayMode(.inline)
            //.navigationBarHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        ArchivesView()
                    } label: {
                        Image(systemName: "archivebox")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        NotificationsView()
                    } label: {
                        Image(systemName: "bell")
                    }
                }
            }
            //.toolbarBackgroundVisibility(.hidden, for: .navigationBar)
            //.toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarTitleMenu {
                Button("Settings") {}
                Button("Profiles") {}
            }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        ScrollView {
            
        }
        .navigationTitle("Settings")
        //.navigationBarBackButtonHidden()
    }
}

struct ArchivesView: View {
    var body: some View {
        ScrollView {
            
        }
        .navigationTitle("Archives")
    }
}

struct NotificationsView: View {
    var body: some View {
        ScrollView {
            
        }
        .navigationTitle("Notifications")
    }
}

struct UserInfoView: View {
    
    let user: User
    
    var body: some View {
        List {
            Text("Name: \(user.name)")
            Text("Surname: \(user.surname)")
        }
    }
}

#Preview {
    NavigationBootcamp()
}
