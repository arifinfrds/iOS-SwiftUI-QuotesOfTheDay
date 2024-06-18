//
//  ContentView.swift
//  QuotesOfTheDay
//
//  Created by arifin on 18/06/24.
//

final class ContentViewModel: ObservableObject {
    
    @Published var quote: Quote = .default
    
    private let quoteGenerator: any QuoteGenerator
    
    init(quoteGenerator: some QuoteGenerator) {
        self.quoteGenerator = quoteGenerator
    }
    
    func randomizeQuote() {
        quote = quoteGenerator.randomizeQuote()
    }
}

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.quote.message)
                    .font(.title2)
                    .foregroundStyle(.primary)
                
                Text(viewModel.quote.owner)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.secondary)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            Button {
                viewModel.randomizeQuote()
            } label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .frame(width: 72, height: 72)
            }
            .padding(.top, 100)
            .frame(width: 72, height: 72)
            .frame(maxHeight: .infinity, alignment: .center)
            .tint(.brown)
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator()))
}

#Preview {
    ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator()))
        .preferredColorScheme(.dark)
}
