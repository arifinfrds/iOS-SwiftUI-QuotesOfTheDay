import Quote

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
    @State private var isRefreshTapped = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.quote.message)
                        .font(.title)
                        .foregroundStyle(.primary)
                    
                    Text(viewModel.quote.owner)
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            Button {
                isRefreshTapped.toggle()
                withAnimation {
                    viewModel.randomizeQuote()
                }
            } label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .frame(width: 72, height: 72)
            }
            .symbolEffect(.bounce.byLayer, value: isRefreshTapped)
            .padding(.top, 100)
            .frame(width: 72, height: 72)
            .frame(maxHeight: .infinity, alignment: .center)
            .tint(.brown)
        }
        .padding()
        .onAppear {
            scheduleDailyNotifications()
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator()))
}

#Preview {
    ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator()))
        .preferredColorScheme(.dark)
}

func scheduleDailyNotifications() {
    let center = UNUserNotificationCenter.current()
    center.removeAllPendingNotificationRequests() // Remove previous notifications if any

    let morningContent = UNMutableNotificationContent()
    morningContent.title = "Good Morning!"
    morningContent.body = "Start your day with a motivational quote. See quote here."
    morningContent.sound = .default

    let eveningContent = UNMutableNotificationContent()
    eveningContent.title = "Good Evening!"
    eveningContent.body = "End your day with a motivational quote. See quote here!"
    eveningContent.sound = .default

    // Schedule morning notification at 7 AM
    var morningDateComponents = DateComponents()
    morningDateComponents.hour = 7
    morningDateComponents.minute = 0
    morningDateComponents.timeZone = .current
    let morningTrigger = UNCalendarNotificationTrigger(dateMatching: morningDateComponents, repeats: true)

    let morningRequest = UNNotificationRequest(identifier: "morningNotification", content: morningContent, trigger: morningTrigger)
    center.add(morningRequest)

    // Schedule evening notification at 8 PM
    var eveningDateComponents = DateComponents()
    eveningDateComponents.hour = 20
    eveningDateComponents.minute = 0
    morningDateComponents.timeZone = .current
    let eveningTrigger = UNCalendarNotificationTrigger(dateMatching: eveningDateComponents, repeats: true)

    let eveningRequest = UNNotificationRequest(identifier: "eveningNotification", content: eveningContent, trigger: eveningTrigger)
    center.add(eveningRequest)
}
