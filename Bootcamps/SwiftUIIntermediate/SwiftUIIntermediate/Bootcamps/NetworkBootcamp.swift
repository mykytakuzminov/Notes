//
//  NetworkBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 20.11.24.
//

import SwiftUI
import Combine

final class NetworkService1 {
    
    static let shared = NetworkService1()
    
    private init() {}
    
    func downloadData(url: String, completionHandler: @escaping (_ data: Data) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data, error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                print("Downloading error occurred.")
                return
            }
            
            completionHandler(data)
        }.resume()
    }
}

final class NetworkService2 {
    
    static let shared = NetworkService2()
    
    private init() {}
    
    func downloadData(url: String) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .eraseToAnyPublisher()
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
}

struct Post: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

final class NetworkViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    private let networkService1 = NetworkService1.shared
    private let networkService2 = NetworkService2.shared
    private let jsonService = JSONService<[Post]>.shared()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts2()
    }
    
    private func getPosts1() {
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        networkService1.downloadData(url: url) { [weak self] data in
            guard let posts = self?.jsonService.decodeFromJSON(data) else {
                print("Getting posts failed.")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.posts = posts
            }
        }
    }
    
    private func getPosts2() {
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        networkService2.downloadData(url: url)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("Downloaded successfully.")
                case .failure(let error):
                    print("Error occurred. \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedPosts in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)

    }
}

struct NetworkBootcamp: View {
    
    @StateObject private var vm = NetworkViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                Text(post.title)
            }
        }
    }
}

#Preview {
    NetworkBootcamp()
}
