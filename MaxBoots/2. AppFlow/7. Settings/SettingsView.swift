import SwiftUI

struct SettingsView: View {
    @StateObject
    private var settingsViewModel = SettingsViewModel()
    
    @State
    private var isAnimating: Bool = false
    @State
    private var isShowAlert: Bool = false
    
    let goToMenu: () -> Void
    
    var body: some View {
        VStack(spacing: 40) {
            menuStoryItem()
            menuItem(name: "Удалить прогресс", action: { isShowAlert.toggle() })
            menuItem(name: "Вернуться", action: goToMenu)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(content: title)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.6)) {
                isAnimating = true
            }
        }
        .alert("Удалить прогресс?", isPresented: $isShowAlert) {
            Button("Нет", role: .cancel) { }
            Button("Да", role: .destructive) { settingsViewModel.deleteProgress() }
        } message: {
            Text("Это необратимый процесс, все покупки вернуться в магазин!")
        }
    }
    
    @ViewBuilder
    private func title() -> some View {
        Text("Настройки")
            .foregroundStyle(.customBrown)
            .bold()
            .italic()
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 35)
            .opacity(isAnimating ? 1 : 0)
    }
    
    @ViewBuilder
    private func menuItem(name: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack {
                Image(.menuRow)
                    .resizable()
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .shadow(color: .gray, radius: 2, x: 2, y: 2)
                    .overlay {
                        Text(name)
                            .foregroundStyle(.customBrown)
                            .bold()
                            .italic()
                            .font(.largeTitle)
                    }
            }
        }
    }
    
    @ViewBuilder
    private func menuStoryItem() -> some View {
        VStack {
            Image(.menuRow)
                .resizable()
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
                .overlay {
                    Toggle(isOn: $settingsViewModel.isShownOnboarding) {
                        Text("Откл. истории")
                            .foregroundStyle(.customBrown)
                            .bold()
                            .italic()
                            .font(.largeTitle)
                    }
                    .padding(.horizontal, 40)
                }
        }
    }
}

#Preview {
    SettingsView(goToMenu: {})
}
