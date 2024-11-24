//
//  CodableBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 20.11.24.
//

import SwiftUI

final class JSONService<T: Codable> {
    
    static func shared() -> JSONService {
        return JSONService<T>()
    }
    
    private init() {}
    
    func encodeToJSON(_ object: T) -> Data? {
        do {
            let encodedData = try JSONEncoder().encode(object)
            return encodedData
        } catch let error {
            print("Encoding error occurred. \(error.localizedDescription)")
            return nil
        }
    }
    
    func decodeFromJSON(_ data: Data) -> T? {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch let error {
            print("Decoding error occurred. \(error.localizedDescription)")
            return nil
        }
    }
}

struct Car: Identifiable, Codable {
    var id: String = UUID().uuidString
    let brand: String
    let model: String
    let year: Int
}

final class CodableViewModel: ObservableObject {
    
    @Published var cars: [Car] = []
    @Published var data: Data = Data()
    
    private let jsonService = JSONService<[Car]>.shared()
    
    init() {
        encodeToJSON()
        decodeFromJSON()
    }
    
    private func encodeToJSON() {
        let cars = [
            Car(brand: "Tesla", model: "Model 3", year: 2023),
            Car(brand: "Ford", model: "Mustang", year: 2020),
            Car(brand: "Toyota", model: "Prius", year: 2022),
        ]
        
        guard let encodedData = jsonService.encodeToJSON(cars) else { return }
        self.data = encodedData
    }
    
    private func decodeFromJSON() {
        guard let decodedData = jsonService.decodeFromJSON(data) else { return }
        self.cars = decodedData
    }
    
}

struct CodableBootcamp: View {
    
    @StateObject private var vm = CodableViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Encoded data: ")
                    .font(.headline)
                
                Text("\(vm.data.count) bytes")
                    .font(.subheadline)
            }
            
            HStack(spacing: 0) {
                ForEach(vm.cars) { car in
                    VStack {
                        Text(car.brand)
                        Text(car.model)
                        Text("\(car.year)")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.thickMaterial)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}
