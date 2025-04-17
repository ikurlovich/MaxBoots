import Foundation
import Combine

final class MainService {
    static let shared = MainService()
    
    @Published var canIBuy: Bool = false
    @Published var currentShoes: Shoes = .initialShoes
    @Published var currentShop: Shop = .сhineseShop
    @Published var galleryItems: [Shoes] = []
    
    private let keyValueStorage: KeyValueStorage
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(keyValueStorage: KeyValueStorage = DefaultsStorage()) {
        self.keyValueStorage = keyValueStorage
        
        self.canIBuy = keyValueStorage.bool(forKey: .canIBuy)
        self.galleryItems = (try? keyValueStorage.entity(forKey: .galleryItems)) ?? []
        
        observeCanIBuy()
        observeGalleryItems()
    }
    
    func deleteProgress() {
        galleryItems = []
        canIBuy = false
    }
    
    func earnedLary() {
        canIBuy = true
    }
    
    func spendLary() {
        canIBuy = false
    }
    
    func selectChineseShop() {
        currentShop = .сhineseShop
    }
    
    func selectSecondShop() {
        currentShop = .secondShop
    }
    
    func selectTrustedShop() {
        currentShop = .trustedShop
    }
    
    func buyShoes(shoes: Shoes) {
        guard !galleryItems.contains(shoes) else { return }
        currentShoes = shoes
        galleryItems.append(currentShoes)
        spendLary()
    }
    
    private func observeCanIBuy() {
        $canIBuy
            .sink { [weak self] in
                self?.keyValueStorage.set($0, forKey: .canIBuy)
            }
            .store(in: &cancellables)
    }
    
    private func observeGalleryItems() {
        $galleryItems
            .sink { [weak self] in
                try? self?.keyValueStorage.set(entity: $0, forKey: .galleryItems)
            }
            .store(in: &cancellables)
    }
}
