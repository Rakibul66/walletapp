//
//  TransactionItemView.swift
//  walletbox
//
//  Created by Roxy  on 29/4/25.
//


import SwiftUI

struct TransactionItemView: View {
    let icon: String
    let title: String
    let date: String
    let amount: String
    let cardInfo: String
    let iconBackground: Color

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(iconBackground.opacity(0.15))
                    .frame(width: 40, height: 40)
                Image(systemName: icon)
                    .foregroundColor(iconBackground)
                    .font(.system(size: 18))
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)

                Text(date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 2) {
                Text(amount)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(cardInfo)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}
