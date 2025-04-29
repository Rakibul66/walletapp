import SwiftUI

struct WalletCardView: View {
    let card: WalletModel.WalletCard

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(card.color)
                .frame(height: 80)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0.3), .clear]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .blur(radius: 4)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                )
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)

            HStack {
                Text(card.currency)
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text(card.amount)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
    }
}
