import SwiftUI

struct OnboardingView: View {
    @State
    private var currentStep: Int = 0
    @State
    private var isAnimating: Bool = false
    
    let goToMenu: () -> Void
    
    var body: some View {
        VStack {
            TabView(selection: $currentStep) {
                OnboardingStep(
                    numImage: currentStep,
                    text: storyText()
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(0)
                
                OnboardingStep(
                    numImage: currentStep,
                    text: storyText()
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(1)
                
                OnboardingStep(
                    numImage: currentStep,
                    text: storyText()
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .disabled(true)
            .animation(.default, value: currentStep)
            .opacity(isAnimating ? 1 : 0 )
            
            Button(action: nextStep) {
                UniversalLabel(text: "Продолжить")
            }
            .padding(.bottom)
            .offset(y: isAnimating ? 0 : 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.6)) {
                isAnimating = true
            }
        }
    }
    
    private func nextStep() {
        if currentStep != 2 {
            currentStep += 1
        } else {
            goToMenu()
        }
    }
    
    private func storyText() -> String {
        switch currentStep {
        case 0:
            "Жизнь в Кутаиси прекрасна! ☀️\nМой день идеален: солнце светит, птицы поют, и даже хачапури в руке как никогда вкусный. Но всё может измениться в один момент..."
        case 1:
            "О нет...  😱 \nМой верный ботинок внезапно объявил забастовку и решил, что его подошве пора на пенсию. Теперь моя миссия — найти достойную замену!"
        default:
            "Время на исходе! ⏳ \nГород большой, магазинов много, а ноги всё ближе к асфальту. Выбирай с умом — от твоего решения зависит станешь ли ты королём улиц или… босым философом."
        }
    }
}

#Preview {
    OnboardingView(goToMenu: {})
}
