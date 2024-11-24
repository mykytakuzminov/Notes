//
//  FileManagerBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 21.11.24.
//

import SwiftUI

final class FileManagerService {
    
    static let shared = FileManagerService()
    
    private let appDirectoryName: String = "AppFolder"
    
    init() {
        createDirectory()
    }
    
    private func createDirectory() {
        guard let path = getDirectoryPath(with: appDirectoryName) else { return }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
            } catch let error {
                print("Creating app directory failed with error: \(error.localizedDescription)")
            }
        }
    }
    
    private func deleteDirectory() {
        guard let path = getDirectoryPath(with: appDirectoryName) else { return }
        
        do {
            try FileManager.default.removeItem(atPath: path)
        } catch let error {
            print("Deleting app directpry failed with error: \(error.localizedDescription)")
        }
    }
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getFilePath(with: name)
        else {
            return
        }
        
        do {
            try data.write(to: path)
        } catch let error {
            print("Writing error occurred: \(error.localizedDescription)")
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getFilePath(with: name)?.path,
            FileManager.default.fileExists(atPath: path)
        else {
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) {
        guard
            let path = getFilePath(with: name)?.path,
            FileManager.default.fileExists(atPath: path)
        else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
        } catch let error {
            print("Deleting error occurred: \(error.localizedDescription)")
        }
    }
    
    private func getDirectoryPath(with name: String) -> String? {
        let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathExtension(name)
            .path
        
        return path
    }
    
    private func getFilePath(with name: String) -> URL? {
        let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathExtension(appDirectoryName)
            .appendingPathExtension("\(name).jpg")
        
        return path
    }
}

final class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    
    private let fileManagerService = FileManagerService.shared
    
    private let imageName: String = "Nature"
    
    init() {
        // getImageFromAssets()
    }
    
    func getImageFromAssets() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        guard let image = fileManagerService.getImage(name: imageName) else { return }
        self.image = image
    }
    
    func saveImage() {
        guard let image = image else { return }
        fileManagerService.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        fileManagerService.deleteImage(name: imageName)
    }
}

struct FileManagerBootcamp: View {
    
    @StateObject private var vm = FileManagerViewModel()
    
    var body: some View {
        VStack(spacing: 100) {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 200)
            }
            
            VStack {
                Button("Save image") {
                    vm.saveImage()
                }
                
                Button("Delete image") {
                    vm.deleteImage()
                }
                
                Button("Get image") {
                    vm.getImageFromFileManager()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
