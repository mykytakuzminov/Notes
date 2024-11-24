//
//  CombineBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 21.11.24.
//

import SwiftUI
import Combine

final class CombineViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var isValid: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubsribers()
    }
    
    private func addSubsribers() {
        $username
            .combineLatest($password)
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .map { (username, password) -> Bool in
                if username.count > 5 && password.count > 8 {
                    return true
                }
                return false
            }
            .sink { [weak self] value in
                self?.isValid = value
            }
            .store(in: &cancellables)
    }
}

struct CombineBootcamp: View {
    
    @StateObject private var vm = CombineViewModel()
    
    var body: some View {
        VStack {
            TextField("Username", text: $vm.username)
                .font(.headline)
                .padding(.horizontal)
                .frame(height: 55)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
            
            TextField("Password", text: $vm.password)
                .font(.headline)
                .padding(.horizontal)
                .frame(height: 55)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal)
            
            Button {
                vm.username = ""
                vm.password = ""
            } label: {
                Text("Submit")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(vm.isValid ? .blue : .gray)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)
                    .padding(.top, 10)
            }
            .disabled(!vm.isValid)
        }
    }
}

#Preview {
    CombineBootcamp()
}
