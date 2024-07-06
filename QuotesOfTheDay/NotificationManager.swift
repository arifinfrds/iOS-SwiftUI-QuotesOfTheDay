import UserNotifications

protocol NotificationManager {
    func scheduleDailyNotifications()
}

final class LocalNotificationManager: NotificationManager {
    
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

}
