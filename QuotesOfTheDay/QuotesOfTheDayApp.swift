//
//  QuotesOfTheDayApp.swift
//  QuotesOfTheDay
//
//  Created by arifin on 18/06/24.
//

import SwiftUI

@main
struct QuotesOfTheDayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator()))
        }
    }
}
