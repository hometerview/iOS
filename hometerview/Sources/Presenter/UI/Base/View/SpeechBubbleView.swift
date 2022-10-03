//
//  SpeechBubbleView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/10/02.
//

import SwiftUI

struct SpeechBubble: Shape {
    private let radius: CGFloat
    private let tailSize: CGFloat

    init(radius: CGFloat = 10) {
        self.radius = radius
        tailSize = 20
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY - radius))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - rect.height / 2))

            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: false
            )

            path.addLine(to: CGPoint(x: rect.minX + radius + 10, y: rect.minY - 10))

            path.addLine(to: CGPoint(x: rect.minX + radius + 17.5, y: rect.minY))


            path.addArc(
                center: CGPoint(x: radius + radius / 2, y: rect.minY),
                radius: 0,
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )

            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
        }
    }
}

struct SpeechBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SpeechBubble(radius: 17)
                .frame(width: 231, height: 34)
                .foregroundColor(.colorStyle(.blue300))
                .shadow(color: .gray, radius: 10, x: 0, y: 6)
            Text("다른 회사의 정보로 알아보시겠어요?")
                .foregroundColor(.white)
                .font(.pretendard(size: 14))
        }
    }
}
