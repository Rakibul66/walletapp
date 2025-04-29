import SwiftUI


struct HomeScreen: View {
    let cards: [WalletModel.WalletCard] = [
        WalletModel.WalletCard(currency: "Euros", amount: "€25,000.00", color: .orange),
        WalletModel.WalletCard(currency: "Pounds", amount: "£20,000.00", color: .purple),
        WalletModel.WalletCard(currency: "Dollars", amount: "$46,000.00", color: .green)
    ]

    var body: some View {
        GeometryReader { geometry in
            let topFixedHeight: CGFloat = 12 + 42 + 12 + 150 // Top padding + avatar + spacing + wallet

            ZStack(alignment: .top) {
                // Scrollable content
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                  

                        // Summary + Transactions
                        VStack(spacing: 10) {
                            HStack(spacing: 16) {
                                SummaryCardView(
                                    title: "Apr Expense",
                                    amountText: "$2310",
                                    subtitle: "Spent out of\n$5000",
                                    progress: 0.46,
                                    color: .red
                                )
                                SummaryCardView(
                                    title: "Savings",
                                    amountText: "$7310",
                                    subtitle: "out of $10,000\nSaved",
                                    progress: 0.73,
                                    color: .blue
                                )
                            }
                            .padding(.horizontal)

                            HStack {
                                Text("Transactions")
                                    .font(.headline)
                                Spacer()
                                Button(action: {}) {
                                    Text("See more")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding(.horizontal)

                            VStack(spacing: 0) {
                                TransactionItemView(
                                    icon: "f.circle.fill", title: "Figma", date: "April 20",
                                    amount: "$30.00", cardInfo: "USD card", iconBackground: .green
                                )
                                TransactionItemView(
                                    icon: "a.circle.fill", title: "Adobe", date: "April 16",
                                    amount: "$35.00", cardInfo: "GBP card • £26.18", iconBackground: .purple
                                )
                                TransactionItemView(
                                    icon: "apple.logo", title: "AppleTV", date: "April 15",
                                    amount: "$10.00", cardInfo: "Euro card • €8.70", iconBackground: .orange
                                )
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 60)
                    }
                    .padding(.top, topFixedHeight + 20) // dynamically push content
                }

                // Fixed Top AppBar + Wallet
                VStack(spacing: 12) {
                    // App bar
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.brown)
                                .frame(width: 42, height: 42)
                            Text("R")
                                .font(.headline)
                                .foregroundColor(.white)
                        }

                        Spacer()

                        Button(action: {}) {
                            Image(systemName: "bell.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color(.systemGray5))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)

                    // Wallet
                    WalletStackView(cards: cards, totalBalance: "$98,000.00")
                        .padding(.horizontal)
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, Color(.systemGray6)]),
                                   startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                )
            }
        }
    }
}


struct ActionCircleButton: View {
    let title: String
    let iconName: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 64, height: 64)
                Image(systemName: iconName)
                    .font(.system(size: 28))
                    .foregroundColor(color)
            }
            Text(title)
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
    }
}
