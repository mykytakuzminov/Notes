//
//  HapticsBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 16.11.24.
//

import SwiftUI

protocol HapticServiceProtocol {
    func notification(type: UINotificationFeedbackGenerator.FeedbackType)
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle)
}

final class HapticService: HapticServiceProtocol {
    
    static let shared = HapticService()
    
    private init() {}
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    
    private let hapticService: HapticServiceProtocol
    
    init(hapticService: HapticServiceProtocol = HapticService.shared) {
        self.hapticService = hapticService
    }
    
    var body: some View {
        VStack {
            Button("Error") { hapticService.notification(type: .error) }
            Button("Success") { hapticService.notification(type: .success) }
            Button("Warning") { hapticService.notification(type: .warning) }
            Divider()
            Button("Soft") { hapticService.impact(style: .soft) }
            Button("Light") { hapticService.impact(style: .light) }
            Button("Medium") { hapticService.impact(style: .medium) }
            Button("Rigid") { hapticService.impact(style: .rigid) }
            Button("Heavy") { hapticService.impact(style: .heavy) }
        }
    }
}

#Preview {
    HapticsBootcamp()
}
