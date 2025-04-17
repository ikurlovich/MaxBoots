import SwiftUI

struct StoryMenuView: View {
    @StateObject
    private var storyMenuViewModel = StoryMenuViewModel()
    
    let goToMenu: () -> Void
    let goToMap: () -> Void
    let goToJob: () -> Void
    
    var body: some View {
        VStack(spacing: 40) {
            Button(action: goToJob) {
                UniversalLabel(text: storyMenuViewModel.canIBuy ? "Деньги есть 👇" : "Пойти на работу")
            }
            .disabled(storyMenuViewModel.canIBuy)
            
            Button(action: goToMap) {
                UniversalLabel(text: storyMenuViewModel.canIBuy ? "Карта шопов" : "Нет лари 👆")
            }
            .disabled(!storyMenuViewModel.canIBuy)
            
            Button(action: goToMenu) {
                UniversalLabel(text: "Вернуться")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    StoryMenuView(goToMenu: {}, goToMap: {}, goToJob: {})
}
