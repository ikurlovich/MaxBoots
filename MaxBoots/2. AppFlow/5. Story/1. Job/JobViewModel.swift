import Foundation
import Combine

final class JobViewModel: ObservableObject {
    @Published
    var canIBuy: Bool = false
    @Published
    var amountDeal: Int = 0
    @Published
    var isMove: Bool = false
    
    private let mainService: MainService = .shared
    
    private let soundManager = SoundManager()
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observedCanIBuy()
    }
    
    func playGame() {
        if amountDeal < 5 {
            isMove.toggle()
            amountDeal += 1
        } else {
            isMove.toggle()
            earnedLary()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.soundManager.playMusic(named: "Clean", loops: false)
            }
        }
        
        soundManager.playMusic(named: "OneMove", loops: false)
    }
    
    func earnedLary() {
        mainService.earnedLary()
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
