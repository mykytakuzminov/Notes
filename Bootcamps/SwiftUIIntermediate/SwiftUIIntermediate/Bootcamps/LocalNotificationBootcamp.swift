//
//  LocalNotificationBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 16.11.24.
//

import SwiftUI
import UserNotifications
import CoreLocation

protocol LocalNotificationServiceProtocol {
    func requestAuthorization()
    func cancelNotification()
    func scheduleNotification()
}

final class LocalNotificationService: LocalNotificationServiceProtocol {
    
    static let shared = LocalNotificationService()
    
    private init() {}
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error occurred: \(error.localizedDescription)")
            } else {
                print("Successfully authorized")
            }
        }
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Test notification title"
        content.subtitle = "Test notification subtitle"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // var dateComponents = DateComponents()
        // dateComponents.hour = 19
        // dateComponents.minute = 12
        
        // let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // let center = CLLocationCoordinate2D(latitude: 40, longitude: 50)
        
        // let region = CLCircularRegion(
        //    center: center,
        //    radius: 100,
        //    identifier: UUID().uuidString)
        
        // let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct LocalNotificationBootcamp: View {
    
    private let localNotificationService: LocalNotificationServiceProtocol
    
    init(localNotificationService: LocalNotificationServiceProtocol = LocalNotificationService.shared) {
        self.localNotificationService = localNotificationService
    }
    
    var body: some View {
        VStack {
            Button("Request Authorization") {
                localNotificationService.requestAuthorization()
            }
            
            Divider()
            
            Button("Cancel Notification") {
                localNotificationService.cancelNotification()
            }
            
            Divider()
            
            Button("Schedule Notification") {
                localNotificationService.scheduleNotification()
            }
        }
    }
}

#Preview {
    LocalNotificationBootcamp()
}
