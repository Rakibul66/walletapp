
import SwiftUI

enum WalletModel {
    struct WalletCard: Identifiable {
        let id = UUID()
        let currency: String
        let amount: String
        let color: Color
    }
}

struct WalletStackView: View {
    @State private var selectedCardIndex: Int? = nil
    @State private var animateBounce = false

    let cards: [WalletModel.WalletCard] = [
        WalletModel.WalletCard(currency: "Euros", amount: "€25,000.00", color: .orange),
        WalletModel.WalletCard(currency: "Pounds", amount: "£20,000.00", color: .purple),
        WalletModel.WalletCard(currency: "Dollars", amount: "$46,000.00", color: .green)
    ]

    var totalBalance: String {
        return "$98,000.00"
    }

    var body: some View {
        VStack {
            Spacer(minLength: 60)
            
            ZStack {
                // Wallet Background
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color(red: 71/255, green: 40/255, blue: 25/255))
                    .frame(height: 280)
                    .overlay(
                        VStack {
                            Spacer()
                            Text(totalBalance)
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Text("Total balance")
                                .font(.footnote)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .padding(.bottom, 40)
                    )
                    .overlay(
                        Text("Hide balance 🐾")
                            .font(.caption)
                            .foregroundColor(.white)
                            .offset(y: -90),
                        alignment: .top
                    )
                    .overlay(
                        Circle()
                            .fill(Color.green)
                            .frame(width: 36, height: 36)
                            .offset(y: 130),
                        alignment: .bottom
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .shadow(radius: 5)
                    .padding(.horizontal)

                // Cards Stack
                ZStack {
                    ForEach(Array(cards.enumerated()), id: \.offset) { index, card in
                        CardView(card: card, isSelected: selectedCardIndex == index)
                            .scaleEffect(selectedCardIndex == index ? 1.05 : 1.0)
                            .rotation3DEffect(.degrees(selectedCardIndex == index ? 0 : 0),
                                              axis: (x: 1, y: 0, z: 0))
                            .offset(y: CGFloat(-110 - index * 30))
                            .animation(.spring(response: 0.4, dampingFraction: 0.6), value: selectedCardIndex)
                            .onTapGesture {
                                if selectedCardIndex == index {
                                    selectedCardIndex = nil
                                } else {
                                    selectedCardIndex = index
                                }
                            }
                    }
                }
                .padding(.horizontal, 36)
            }

            Spacer()
        }
        .background(Color.white.ignoresSafeArea())
    }
}

struct CardView: View {
    let card: WalletModel.WalletCard
    let isSelected: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(card.color)
                .frame(height: 80)
                .shadow(radius: isSelected ? 10 : 3)

            HStack {
                Text(card.currency)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Text(card.amount)
                    .foregroundColor(.white)
                    .bold()
            }
            .padding(.horizontal)
        }
        .zIndex(isSelected ? 100 : 0)
    }
}

struct WalletStackView_Previews: PreviewProvider {
    static var previews: some View {
        WalletStackView()
    }
}
