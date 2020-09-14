

import SwiftUI

struct ItemRow: View {
    let text: String
    let maxWidthRatio: CGFloat = 0.75
    let color = Color(red: 253/255, green: 254/255, blue: 253/255)
    let offsetX: CGFloat = 20
    let textXOffset: CGFloat = 10
    var body: some View {
            VStack(alignment: .leading) {
                Text(text)
                    .font(Font.custom("SFProText-Light", size: 17))
                    .foregroundColor(Color.black)
                    .background(Color(red: 253/255, green: 254/255, blue: 253/255))
                    .padding(EdgeInsets(top: textXOffset, leading: 31 + textXOffset, bottom: textXOffset, trailing: UIScreen.main.bounds.width * (1 - maxWidthRatio) - offsetX + textXOffset))
                
            }
            .background(color)
                .clipShape(Bubble(maxWidth: maxWidthRatio))
            .shadow(color: Color(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)), radius: 5, x: 1, y: 1)
                .background(Bubble(maxWidth: maxWidthRatio)
            .foregroundColor(.clear)
            .blur(radius: 4)
            )
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
    
}

struct Bubble: Shape {
    let maxWidth: CGFloat
    func path(in rect: CGRect) -> Path {
        let offsetX: CGFloat = 20
        let radius: CGFloat = 5
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: rect.width * maxWidth + offsetX - radius, y: rect.height - radius), radius: radius , startAngle: 0 , endAngle: .pi/2  , clockwise: true)
        path.addArc(withCenter: CGPoint(x:offsetX + radius, y: rect.height - radius + 3), radius:3, startAngle: 2 * .pi / 3, endAngle: 1.3 * .pi , clockwise: true)
        path.addArc(withCenter: CGPoint(x: offsetX + radius , y: rect.height - 15 - radius), radius: radius, startAngle:  .pi / 5, endAngle: 6 * .pi / 3, clockwise: false)
        path.addArc(withCenter: CGPoint(x: offsetX + 15, y: 10), radius:radius, startAngle: .pi, endAngle: 3 * .pi / 2, clockwise: true)
        path.addArc(withCenter: CGPoint(x: rect.width * maxWidth + offsetX - radius, y: 10), radius: radius, startAngle: 3 * .pi / 2, endAngle: 2 * .pi, clockwise: true)
        path.addLine(to: CGPoint(x:rect.width * maxWidth + offsetX, y:rect.height - radius))
        path.close()
    
        return Path(path.cgPath)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(text: "Tex g hg")
    }
}

