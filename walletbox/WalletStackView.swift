import SwiftUI

struct WalletCard: Identifiable {
    let id = UUID()
    let currency: String
    let amount: String
    let color: Color
}
