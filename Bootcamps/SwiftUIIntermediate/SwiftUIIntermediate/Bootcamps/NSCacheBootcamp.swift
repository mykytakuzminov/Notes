//
//  NSCacheBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 23.11.24.
//

import SwiftUI

final class NSCacheManager {
    
    static let shared = NSCacheManager()
    
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
    }
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
    }
    func get(name: String) -> UIImage? {
        let image = imageCache.object(forKey: name as NSString)
        return image
    }
    
}

final class NSCacheViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    
    private let cacheManager = NSCacheManager.shared
    
    init() {
        getFromAssets()
    }
    
    private func getFromAssets() {
        image = UIImage(named: "Nature")
    }
    
    func saveToCache() {
        guard let image = image else { return }
        cacheManager.add(image: image, name: "Nature")
    }
    
    func deleteFromCache() {
        cacheManager.remove(name: "Nature")
    }
    
    func getFromCache() {
        guard let returnedImage = cacheManager.get(name: "Nature") else { return }
        cachedImage = returnedImage
    }
}

struct NSCacheBootcamp: View {
    
    @StateObject private var vm = NSCacheViewModel()
    
    var body: some View {
        VStack(spacing: 50) {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
            }
            
            VStack {
                Button("Save image") {
                    vm.saveToCache()
                }
                
                Button("Delete image") {
                    vm.deleteFromCache()
                }
                
                Button("Get image") {
                    vm.getFromCache()
                }
            }
            .buttonStyle(.borderedProminent)
            
            if let image = vm.cachedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
            }
        }
    }
}

#Preview {
    NSCacheBootcamp()
}
