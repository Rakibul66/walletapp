import SwiftUI

struct WalletBackgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cornerRadius: CGFloat = 32
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))

        // Top slot cutout
        let slotWidth: CGFloat = 140
        let slotHeight: CGFloat = 30
        let slotX = rect.midX - slotWidth / 2

        var slotPath = Path()
        slotPath.move(to: CGPoint(x: slotX, y: rect.minY))
        slotPath.addQuadCurve(
            to: CGPoint(x: slotX + slotWidth, y: rect.minY),
            control: CGPoint(x: rect.midX, y: rect.minY + slotHeight)
        )

        // Bottom green curve
        let bottomWidth: CGFloat = 60
        let bottomHeight: CGFloat = 20
        let bottomX = rect.midX - bottomWidth / 2

        var bottomPath = Path()
        bottomPath.move(to: CGPoint(x: bottomX, y: rect.maxY))
        bottomPath.addQuadCurve(
            to: CGPoint(x: bottomX + bottomWidth, y: rect.maxY),
            control: CGPoint(x: rect.midX, y: rect.maxY - bottomHeight)
        )

        path.addPath(slotPath)
        path.addPath(bottomPath)
        return path
    }
}
