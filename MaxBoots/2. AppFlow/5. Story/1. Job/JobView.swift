import SwiftUI

struct JobView: View {
    @StateObject
    private var jobViewModel = JobViewModel()
    
    let goToStoryMenu: () -> Void
    
    var body: some View {
        VStack {
            VStack {
                gameScene()
                finishedGame()
                    .opacity(jobViewModel.canIBuy ? 1 : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button() {
                jobViewModel.canIBuy
                ? goToStoryMenu()
                : jobViewModel.playGame()
            } label: {
                UniversalLabel(text: jobViewModel.canIBuy ? "Вернуться" : "Чистить")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func finishedGame() -> some View {
        Text("Ты отлично справился с работой, лари уже в кармане, идём за новой покупкой!")
            .multilineTextAlignment(.center)
            .foregroundStyle(.customBrown)
            .bold()
            .italic()
            .font(.title2)
            .padding()
    }
    
    @ViewBuilder
    private func gameScene() -> some View {
        Image(jobViewModel.canIBuy ? "Clean" : "Dirty")
            .resizable()
            .frame(width: 200, height: 330)
            .animation(.easeInOut(duration: 1), value: jobViewModel.canIBuy)
            .overlay {
                Image(.tool)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(x: jobViewModel.isMove ? +200 : -200)
                    .animation(.easeInOut(duration: 0.6), value: jobViewModel.isMove)
            }
    }
}

#Preview {
    JobView(goToStoryMenu: {})
}
