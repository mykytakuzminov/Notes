//
//  SoundsBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 14.11.24.
//

import SwiftUI
import AVKit

protocol SoundServiceProtocol {
    var player: AVAudioPlayer? { get }
    
    func playSound()
}

final class SoundService: SoundServiceProtocol {
    
    static let shared = SoundService()
    
    private init() {}
    
    private(set) var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(
            forResource: "sound",
            withExtension: ".mp3")
        else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    
    private let soundService: SoundServiceProtocol
    
    init(soundService: SoundServiceProtocol = SoundService.shared) {
        self.soundService = soundService
    }
    
    var body: some View {
        Button {
            soundService.playSound()
        } label: {
            Text("Play sound")
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    SoundsBootcamp()
}
