import SwiftUI

struct AppCoordinatorView: View {
    @StateObject
    private var coordinator = AppCoordinator()
    
    var body: some View {
        VStack {
            switch coordinator.currentView {
            case .preview:
                PreloaderView(goToMenu: preloaderFunc)
            case .onboarding:
                OnboardingView(goToMenu: { coordinator.chooseView(.menu) })
            case .menu:
                MenuView(
                    goToStory: { coordinator.chooseView(.storyMenu) },
                    goToGallery: { coordinator.chooseView(.gallery) },
                    goToSettings: { coordinator.chooseView(.settings) }
                )
            case .gallery:
                GalleryView(goToMenu: { coordinator.chooseView(.menu) })
            case .settings:
                SettingsView(goToMenu: { coordinator.chooseView(.menu) })
            case .storyMenu:
                StoryMenuView(
                    goToMenu: { coordinator.chooseView(.menu) },
                    goToMap: { coordinator.chooseView(.map) },
                    goToJob: { coordinator.chooseView(.job) }
                )
            case .job:
                JobView(goToStoryMenu: { coordinator.chooseView(.storyMenu) })
            case .map:
                MapView(
                    goToStoryMenu: { coordinator.chooseView(.storyMenu) },
                    goToGame: { coordinator.chooseView(.game) })
            case .game:
                GameView(goToGallery: { coordinator.chooseView(.gallery) })
            }
        }
        .overlay {
            MuteView(isMuted: $coordinator.isMuted)
                .opacity(coordinator.isMuteIconShown ? 1 : 0)
                .offset(x: coordinator.isMuteIconShown ? 0 : -100)
                .animation(.easeInOut(duration: 1), value: coordinator.isMuteIconShown)
        }
    }
    
    private func preloaderFunc() {
        if coordinator.isShownOnboarding {
            coordinator.chooseView(.menu)
        } else {
            coordinator.chooseView(.onboarding)
        }
        coordinator.isMuteIconShown = true
    }
}

#Preview {
    AppCoordinatorView()
}
