import SwiftUI

struct MuteView: View {
    @Binding
    var isMuted: Bool
    
    var body: some View {
        VStack {
            Image(.mute)
                .resizable()
                .frame(width: 80, height: 80)
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
                .overlay {
                    Image(systemName: isMuted
                          ? "speaker.slash"
                          : "speaker.wave.1")
                    .resizable()
                    .scaledToFill()
                    .padding(30)
                    .foregroundStyle(.customBrown)
                }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isMuted.toggle()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

#Preview {
    MuteView(isMuted: .constant(false))
}
