import SwiftUI

struct MenuView: View {
    @State
    private var isAnimating: [Bool] = [false, false, false]
    
    let goToStory: () -> Void
    let goToGallery: () -> Void
    let goToSettings: () -> Void

    var body: some View {
        VStack(spacing: 40) {
            menuItem(id: 0, name: "История", action: goToStory)
            menuItem(id: 1, name: "Прихожая", action: goToGallery)
            menuItem(id: 2, name: "Настройки", action: goToSettings)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(title())
        .background {
            Color.white.ignoresSafeArea()
        }
        .onAppear {
            for index in isAnimating.indices {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        isAnimating[index] = true
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func title() -> some View {
        Text("Меню")
            .foregroundStyle(.customBrown)
            .bold()
            .italic()
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 35)
            .opacity(isAnimating[2] ? 1 : 0)
    }

    @ViewBuilder
    private func menuItem(id: Int, name: String, action: @escaping () -> Void) -> some View {
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
            .offset(x: isAnimating[id] ? 0 : -200)
            .opacity(isAnimating[id] ? 1 : 0)
            .animation(.easeInOut(duration: 0.6), value: isAnimating[id])
        }
    }
}

#Preview {
    MenuView(
        goToStory: {},
        goToGallery: {},
        goToSettings: {}
    )
}
