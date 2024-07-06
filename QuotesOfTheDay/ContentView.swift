import Domain
import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    @State private var isRefreshTapped = false
    
    private let notificationManager: NotificationManager = LocalNotificationManager()
    
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
            notificationManager.scheduleDailyNotifications()
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
