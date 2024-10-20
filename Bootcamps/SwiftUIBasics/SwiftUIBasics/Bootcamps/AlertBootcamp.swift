//
//  AlertBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 12.10.24.
//

import SwiftUI

struct AlertBootcamp: View {
    
    enum AlertType {
        case network
        case server
        
        var title: String {
            switch self {
            case .network:
                "Network Timeout Alert"
            case .server:
                "Server Error Alert"
            }
        }
        
        var message: String {
            switch self {
            case .network:
                "Oops! Looks like the connection timed out. Please check your network settings and try again."
            case .server:
                "Uh-oh! The server encountered a problem. Please try again later or contact support if the issue persists."
            }
        }
    }
    
    @State var showAlert: Bool = false
    @State var typeOfAlert: AlertType = .network
    
    var body: some View {
        VStack {
            Button("Show network alert") {
                typeOfAlert = .network
                showAlert.toggle()
            }
            Button("Show server alert") {
                typeOfAlert = .server
                showAlert.toggle()
            }
        }
        .alert(typeOfAlert.title, isPresented: $showAlert) {
            Button("Settings") {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text(typeOfAlert.message)
        }
    }
}

#Preview {
    AlertBootcamp()
}
