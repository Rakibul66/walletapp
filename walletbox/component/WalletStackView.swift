import SwiftUI

struct WalletStackView: View {
    @State private var selectedCardIndex: Int? = nil
    @State private var isBalanceHidden = false

    let cards: [WalletModel.WalletCard]
    let totalBalance: String

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: -40) {
                ForEach(Array(cards.enumerated()), id: \.offset) { index, card in
                    WalletCardView(card: card)
                        .padding(.horizontal, 40)
                        .scaleEffect(selectedCardIndex == index ? 1.03 : 1.0)
                        .rotation3DEffect(
                            .degrees(selectedCardIndex == index ? 0 : -6),
                            axis: (x: 1.0, y: 0.0, z: 0.0),
                            perspective: 0.6
                        )
                        .offset(y: selectedCardIndex == index ? -40 : 0)
                        .animation(.spring(response: 0.5, dampingFraction: 0.65), value: selectedCardIndex)
                        .onTapGesture {
                            withAnimation {
                                selectedCardIndex = (selectedCardIndex == index ? nil : index)
                            }
                        }
                }
            }
            .padding(.top, 10)

            // Wallet background
            WalletBackgroundShape()
                .fill(Color(red: 71/255, green: 40/255, blue: 25/255))
                .frame(height: isBalanceHidden ? 150 : 170)
                .overlay(
                    VStack(spacing: 3) {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isBalanceHidden.toggle()
                            }
                        }) {
                            Text(isBalanceHidden ? "Show balance 👁" : "Hide balance 🐕")
                                .font(.caption)
                                .foregroundColor(Color(red: 255/255, green: 216/255, blue: 200/255))
                        }

                        Text(isBalanceHidden ? "********" : totalBalance)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                            .transition(.opacity)

                        Text("Total balance")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 30)
                )
                .overlay(
                    Rectangle()
                        .fill(Color.black.opacity(0.1))
                        .frame(height: 10)
                        .blur(radius: 4)
                        .offset(y: -85),
                    alignment: .top
                )
                .padding(.horizontal, 24)
                .shadow(radius: 5)
                .offset(y: -30)
                .animation(.easeInOut(duration: 0.3), value: isBalanceHidden)
        }
    }
}
