import SwiftUI

struct GameView: View {
    @StateObject
    private var gameViewModel = GameViewModel()
    
    @State
    private var isShowDetails: Bool = false
    
    private let soundManager = SoundManager()
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    let goToGallery: () -> Void
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(gameViewModel.currentShop.shoes.shuffled(), id: \.id) { item in
                Button {
                    gameViewModel.buyShoes(shoes: item)
                    isShowDetails = true
                    soundManager.playMusic(named: item.isCool ? "Wow" : "Ups", loops: false)
                } label: {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .black, radius: 10)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .grayscale(gameViewModel.isShoesPurchased(item) ? 1 : 0)
                        .opacity(gameViewModel.isShoesPurchased(item) ? 0.5 : 1)
                }
                .disabled(gameViewModel.isShoesPurchased(item))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(customBackground())
        .overlay(content: detailsView)
    }
    
    @ViewBuilder
    private func detailsView() -> some View {
        if isShowDetails {
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 300, height: 500)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    VStack {
                        Text("Выбор сделан!")
                            .foregroundStyle(.customBrown)
                            .bold()
                            .italic()
                            .font(.title2)
                            .padding(.top)
                        
                        Image("\(gameViewModel.currentShoes.image)")
                            .resizable()
                            .scaledToFit()
                            .shadow(color: gameViewModel.currentShoes.isCool ? .customYellow : .red, radius: 10)
                            .padding()
                        
                        Text("\(gameViewModel.currentShoes.name)")
                            .foregroundStyle(.customBrown)
                            .bold()
                            .italic()
                            .font(.title2)
                        
                        Text("\(gameViewModel.currentShoes.description)")
                            .foregroundStyle(.customBrown)
                            .bold()
                            .italic()
                            .padding()
                    }
                }
            
            backButton()
        }
    }
    
    @ViewBuilder
    private func backButton() -> some View {
        Button {
            goToGallery()
            soundManager.playMusic(named: "Pay", loops: false)
        } label: {
            UniversalLabel(text: "Домой!")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom)
    }
    
    @ViewBuilder
    private func customBackground() -> some View {
        Image("\(gameViewModel.currentShop.background)")
            .resizable()
            .scaledToFill()
            .scaleEffect(1.05)
            .ignoresSafeArea()
            .overlay {
                Color.white.opacity(0.7)
                    .ignoresSafeArea()
            }
    }
}

#Preview {
    GameView(goToGallery: {})
}
