import Foundation
import Combine

final class StoryMenuViewModel: ObservableObject {
    @Published
    var canIBuy: Bool = false
    
    private let mainService: MainService = .shared
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observedCanIBuy()
    }
    
    private func observedCanIBuy() {
        mainService
            .$canIBuy
            .sink { [weak self] in
                self?.canIBuy = $0
            }
            .store(in: &cancellables)
    }
}
