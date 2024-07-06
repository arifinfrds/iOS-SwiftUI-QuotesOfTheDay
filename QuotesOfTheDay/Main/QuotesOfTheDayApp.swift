//
//  QuotesOfTheDayApp.swift
//  QuotesOfTheDay
//
//  Created by arifin on 18/06/24.
//

import SwiftUI
import Domain

@main
struct QuotesOfTheDayApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator()))
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        requestNotificationAuthorization()
        return true
    }

    private func requestNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Authorization request error: \(error.localizedDescription)")
            }
        }
    }
}
