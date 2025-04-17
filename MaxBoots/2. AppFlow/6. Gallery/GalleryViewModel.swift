import Foundation
import Combine

final class GalleryViewModel: ObservableObject {
    @Published
    var isShowDetails: Bool = false
    @Published
    var selectedItem: Shoes = .initialShoes
    @Published
    var galleryItems: [Shoes] = []
    
    private let mainService: MainService = .shared
    
    private var cancellables: Set<AnyCancellable> = []
    
    
    init() {
        observedGalleryItems()
    }
    
    func closeDetails() {
        isShowDetails = false
    }
    
    func selectItem(_ item: Shoes) {
        selectedItem = item
        isShowDetails = true
    }
    
    func randomFrazes() -> String {
        return [
            "Ты чего в прихожей? Протектора на подошве осталось не так много, дуй в магаз!",
            "Снова ты тут, забыл очки? Держи и скорее в магаз, пока не закрылся!",
            "Пока ты не купишь новую обувь, тут ничего не появится!",
            "Полочки уже ждут твоего выбора!",
            "Скоро тут будет целая коллекция!"
        ].randomElement()!
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
