import SwiftUI

struct GalleryView: View {
    @StateObject
    private var galleryViewModel = GalleryViewModel()
    
    @State
    private var isAnimating: Bool = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    let goToMenu: () -> Void
    
    var body: some View {
        VStack {
            title()
            customScroll()
            
            Button(action: goToMenu) {
                UniversalLabel(text: "Вернуться")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.6)) {
                isAnimating = true
            }
        }
    }
    
    @ViewBuilder
    private func customScroll() -> some View {
        if galleryViewModel.galleryItems.isEmpty {
            phrases()
        } else {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(galleryViewModel.galleryItems, id: \.id) { item in
                        Image(.galleryItemBack)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                VStack {
                                    Image("\(item.image)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: .infinity)
                                        .shadow(color: item.isCool ? .customYellow : .red, radius: 10)
                                    
                                    Text("\(item.name)")
                                        .multilineTextAlignment(.center)
                                        .bold()
                                        .foregroundStyle(.white)
                                        .italic()
                                }
                                .padding()
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    @ViewBuilder
    private func phrases() -> some View {
        Text("\(galleryViewModel.randomFrazes())")
            .multilineTextAlignment(.center)
            .foregroundStyle(.customBrown)
            .bold()
            .italic()
            .font(.title2)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func title() -> some View {
        Text("Прихожая")
            .foregroundStyle(.customBrown)
            .bold()
            .italic()
            .font(.largeTitle)
            .padding(.top, 35)
            .opacity(isAnimating ? 1 : 0)
    }
}

#Preview {
    GalleryView(goToMenu: {})
}
