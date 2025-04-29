//
//  WalletModel.swift
//  walletbox
//
//  Created by Roxy  on 29/4/25.
//


import SwiftUI

enum WalletModel {
    struct WalletCard: Identifiable {
        let id = UUID()
        let currency: String
        let amount: String
        let color: Color
    }
}
