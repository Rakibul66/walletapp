//
//  SummaryCardView.swift
//  walletbox
//
//  Created by Roxy  on 29/4/25.
//


import SwiftUI

struct SummaryCardView: View {
    let title: String
    let amountText: String
    let subtitle: String
    let progress: Double
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)

            Text(amountText)
                .font(.title3)
                .bold()

            Text(subtitle)
                .font(.footnote)
                .foregroundColor(.gray)

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 8)

                RoundedRectangle(cornerRadius: 4)
                    .fill(color)
                    .frame(width: CGFloat(progress) * 100, height: 8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.04), radius: 3, x: 0, y: 2)
    }
}
