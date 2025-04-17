import Foundation
import Combine

final class GameViewModel: ObservableObject {
    @Published var currentShop: Shop = .сhineseShop
    @Published var currentShoes: Shoes = .initialShoes
    @Published var galleryItems: [Shoes] = []
    
    private let mainService: MainService = .shared
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observedCurrentShop()
        observedCurrentShoes()
        observedGalleryItems()
    }
    
    func isShoesPurchased(_ shoes: Shoes) -> Bool {
        galleryItems.contains(shoes)
    }
    
    func buyShoes(shoes: Shoes) {
        mainService.buyShoes(shoes: shoes)
    }
    
    private func observedCurrentShop() {
        mainService
            .$currentShop
            .sink { [weak self] in
                self?.currentShop = $0
            }
            .store(in: &cancellables)
    }
    
    private func observedCurrentShoes() {
        mainService
            .$currentShoes
            .sink { [weak self] in
                self?.currentShoes = $0
            }
            .store(in: &cancellables)
    }
    
    private func observedGalleryItems() {
        mainService
            .$galleryItems
            .sink { [weak self] in
                self?.galleryItems = $0
            }
            .store(in: &cancellables)
    }
}
