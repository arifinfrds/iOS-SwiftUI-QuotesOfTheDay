import Domain
import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    @State private var isRefreshTapped = false
    @State private var isShareSheetPresented = false
    
    private let notificationManager: NotificationManager = LocalNotificationManager()
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.quote.message)
                        .font(.title)
                        .foregroundStyle(.primary)
                    
                    HStack {
                        Button {
                            viewModel.copyCurrentQuote()
                        } label: {
                            Image(systemName: "doc.on.doc.fill")
                        }
                        .tint(.primary)
                        
                        Button {
                            viewModel.copyCurrentQuote()
                            isShareSheetPresented = true
                        } label: {
                            Image(systemName: "square.and.arrow.up.fill")
                        }
                        .tint(.primary)
                        .sheet(isPresented: $isShareSheetPresented) {
                            ActivityView(
                                activityItems: [UIPasteboard.general.string ?? ""],
                                applicationActivities: nil
                            )
                        }
                        
                        Text(viewModel.quote.owner)
                            .font(.body)
                            .bold()
                            
                            .foregroundStyle(.secondary)
                    }
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
    ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator(), pasteboard: .general))
}

#Preview {
    ContentView(viewModel: ContentViewModel(quoteGenerator: RandomQuoteGenerator(), pasteboard: .general))
        .preferredColorScheme(.dark)
}
