import UserNotifications

protocol NotificationManager {
    func scheduleDailyNotifications()
}

final class LocalNotificationManager: NotificationManager {
    
    func scheduleDailyNotifications() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.removeAllPendingNotificationRequests()
        notificationCenter.add(morningNotificationRequest())
        notificationCenter.add(eveningNotificationRequest())
    }
    
    private func morningNotificationRequest() -> UNNotificationRequest {
        // Schedule morning notification at 7 AM
        var dateComponents = DateComponents()
        dateComponents.hour = 7
        dateComponents.minute = 0
        dateComponents.timeZone = .current
        let morningTrigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: true
        )

        return UNNotificationRequest(
            identifier: "morningNotification",
            content: morningContent(),
            trigger: morningTrigger
        )
    }
    
    private func morningContent() -> UNMutableNotificationContent {
        let morningContent = UNMutableNotificationContent()
        morningContent.title = "Good Morning!"
        morningContent.body = "Start your day with a motivational quote. See quote here."
        morningContent.sound = .default
        return morningContent
    }
    
    private func eveningNotificationRequest() -> UNNotificationRequest {
        // Schedule evening notification at 8 PM
        var dateComponents = DateComponents()
        dateComponents.hour = 19
        dateComponents.minute = 27
        dateComponents.timeZone = .current
        let eveningTrigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: true
        )

        return UNNotificationRequest(
            identifier: "eveningNotification",
            content: eveningContent(),
            trigger: eveningTrigger
        )
    }
    
    private func eveningContent() -> UNMutableNotificationContent {
        let eveningContent = UNMutableNotificationContent()
        eveningContent.title = "Good Evening!"
        eveningContent.body = "End your day with a motivational quote. See quote here!"
        eveningContent.sound = .default
        return eveningContent
    }
}
