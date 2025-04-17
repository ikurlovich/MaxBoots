import SwiftUI
import Lottie

struct PreloaderView: View {
    let goToMenu: () -> Void
    
    var body: some View {
        VStack {
            LottieView(animationName: "preloader", loopMode: .playOnce)
                .frame(width: 400, height: 200)
            
            Text("Max's Boots")
                .foregroundStyle(.customBrown)
                .bold()
                .italic()
                .font(.largeTitle)
                .offset(y: -50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.white
                .ignoresSafeArea()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.goToMenu()
            }
        }
    }
}

#Preview {
    PreloaderView(goToMenu: {})
}
