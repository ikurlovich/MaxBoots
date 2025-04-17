// MapViewModel.swift
import Foundation
import Combine

final class MapViewModel: ObservableObject {
    @Published var currentShop: Shop = .сhineseShop
    @Published var isShowShopDetails: Bool = false
    @Published var showNoItemsAlert: Bool = false
    
    private let mainService: MainService = .shared
    private let soundManager = SoundManager()
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observedCurrentShop()
    }
    
    func closeDetails() {
        isShowShopDetails = false
    }
    
    func trySelectShop(_ shop: Shop) {
        switch shop {
        case .secondShop:
            mainService.selectSecondShop()
        case .trustedShop:
            mainService.selectTrustedShop()
        default:
            mainService.selectChineseShop()
        }
        
        // Получаем все товары из этого магазина
        let shopItems = shop.shoes
        // Получаем все купленные товары
        let boughtItems = mainService.galleryItems
        
        // Проверяем, все ли товары магазина куплены
        let allItemsBought = shopItems.allSatisfy { shopItem in
            boughtItems.contains(shopItem)
        }
        
        if allItemsBought {
            showNoItemsAlert = true
            soundManager.playMusic(named: "MapTap", loops: false)
        } else {
            isShowShopDetails = true
            soundManager.playMusic(named: "MapTap", loops: false)
        }
    }
    
    func selectChineseShop() {
        trySelectShop(.сhineseShop)
    }
    
    func selectSecondShop() {
        trySelectShop(.secondShop)
    }
    
    func selectTrustedShop() {
        trySelectShop(.trustedShop)
    }
    
    private func observedCurrentShop() {
        mainService
            .$currentShop
            .sink { [weak self] in
                self?.currentShop = $0
            }
            .store(in: &cancellables)
    }
}
