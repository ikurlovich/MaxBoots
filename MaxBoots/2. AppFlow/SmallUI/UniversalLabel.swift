import SwiftUI

struct UniversalLabel: View {
    let text: String
    
    var body: some View {
        VStack {
            Image(.menuRow)
                .resizable()
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
                .overlay {
                    Text(text)
                        .foregroundStyle(.customBrown)
                        .bold()
                        .italic()
                        .font(.largeTitle)
                }
        }
    }
}

#Preview {
    UniversalLabel(text: "Test")
}
