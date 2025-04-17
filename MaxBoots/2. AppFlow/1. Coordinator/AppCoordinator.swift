import Foundation

final class AppCoordinator: ObservableObject {
    enum ViewState {
        case preview, onboarding, menu, gallery, settings, storyMenu, job, map, game
    }
    
    @Published
    var isMuteIconShown: Bool = false
    
    @Published var isMuted: Bool = false {
        didSet {
            if isMuted {
                pauseSound()
            } else {
                resumeSound()
            }
        }
    }
    
    @Published
    var isShownOnboarding: Bool = false
    
    @Published
    private(set) var currentView: ViewState = .preview
    
    let soundManager = SoundManager()
    let soundManagerTwo = SoundManager()
    
    private let keyValueStorage: KeyValueStorage
    
    init(keyValueStorage: KeyValueStorage = DefaultsStorage()) {
        self.keyValueStorage = keyValueStorage
        self.isMuted = keyValueStorage.bool(forKey: .isMuted)
        self.isShownOnboarding = keyValueStorage.bool(forKey: .isShownOnboarding)
    }
    
    func chooseView(_ view: ViewState) {
        currentView = view
    }
    
    private func pauseSound() {
        soundManager.pause()
        keyValueStorage.set(true, forKey: .isMuted)
        if isMuteIconShown {
            soundManagerTwo.playMusic(named: "Duck", loops: false)
        }
    }
    
    private func resumeSound() {
        soundManager.resume()
        keyValueStorage.set(false, forKey: .isMuted)
        
        if !soundManager.isPlaying {
            soundManager.playMusic(named: "Music")
        }
    }
}
