import SwiftUI

struct OnboardingStep: View {
    let numImage: Int
    let text: String
    
    var body: some View {
        VStack {
            customImage()
                .padding(.top, 50)
            
            customText()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    @ViewBuilder
    private func customImage() -> some View {
        Image(.mute)
            .resizable()
            .frame(width: 350, height: 350)
            .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .padding()
            .overlay {
                Image("Onboarding\(numImage)")
                    .resizable()
                    .frame(width: 250)
                    .clipShape(Circle())
                    .padding(60)
                    .shadow(color: .gray, radius: 2, x: 2, y: 2)
            }
    }
    
    @ViewBuilder
    private func customText() -> some View {
        Text(text)
            .foregroundStyle(.customBrown)
            .italic()
            .bold()
            .padding(.horizontal)
    }
}

#Preview {
    OnboardingStep(
        numImage: 1,
        text: "Жизнь в Кутаиси прекрасна! ☀️ \nМой день идеален: солнце светит, птицы поют, и даже хачапури в руке как никогда вкусный. Но всё может измениться в один момент...")
}
