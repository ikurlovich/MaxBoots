import SwiftUI

@main
struct MaxBootsApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
                .preferredColorScheme(.light)
        }
    }
}
