import Foundation
import Combine

final class SettingsViewModel: ObservableObject {
    @Published
    var isShownOnboarding: Bool = false
    
    private let mainService: MainService = .shared
    
    private let keyValueStorage: KeyValueStorage
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(keyValueStorage: KeyValueStorage = DefaultsStorage()) {
        self.keyValueStorage = keyValueStorage
        self.isShownOnboarding = keyValueStorage.bool(forKey: .isShownOnboarding)
        
        observedIsShownOnboarding()
    }
    
    func deleteProgress() {
        mainService.deleteProgress()
    }
    
    private func observedIsShownOnboarding() {
        $isShownOnboarding
            .sink { [weak self] in
                self?.keyValueStorage.set($0, forKey: .isShownOnboarding)
            }
            .store(in: &cancellables)
    }
}
