import Domain
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    @State private var isRefreshTapped = false
    @State private var showingSafari = false
    @State private var safariURL: URL?
    
    private let notificationManager: NotificationManager = LocalNotificationManager()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 24) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.quote.message)
                            .font(.title)
                            .fontDesign(.serif)
                            .foregroundColor(.primary)
                        
                        HStack {
                            Button(action: {
                                showSafariView()
                            }) {
                                Text(viewModel.quote.owner)
                                    .font(.body)
                                    .bold()
                                    .foregroundColor(.secondary)
                            }
                            .tint(.secondary)
                            
                            Button(action: {
                                showSafariView()
                            }) {
                                Image(systemName: "globe")
                            }
                            .tint(.brown)
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                Button(action: {
                    isRefreshTapped.toggle()
                    withAnimation {
                        viewModel.randomizeQuote()
                    }
                }) {
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
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        viewModel.copyCurrentQuote()
                    }) {
                        Image(systemName: "doc.on.doc")
                    }
                    .tint(.brown)
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.shareCurrentQuote()
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .tint(.brown)
                    .sheet(isPresented: $viewModel.isShareSheetPresented) {
                        ActivityView(
                            activityItems: [viewModel.copiedText],
                            applicationActivities: nil
                        )
                    }
                }
            }
        }
        .sheet(isPresented: $showingSafari) {
            if let safariURL = safariURL {
                SafariView(url: safariURL)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
    
    private func showSafariView() {
        if let searchQuery = viewModel.quote.owner.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "https://www.google.com/search?q=\(searchQuery)") {
            safariURL = url
            showingSafari = true
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator(), pasteboard: .general))
}

#Preview {
    ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator(), pasteboard: .general))
        .preferredColorScheme(.dark)
}
