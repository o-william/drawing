//
//  Arrow.swift
//  Drawing
//
//  Created by Oluwapelumi Williams on 18/09/2023.
//

// Challenge from WrapUp
// Create an Arrow shape
// Make the thick ness of the Arrow animatable.
// Create a ColorCyclingRectangle shape that is the rectangular cousin of ColorCyclingCircle, allowing us to control the position of the gradient using one of r more properties.

import SwiftUI

struct ArrowShape: Shape {
    var thickness: Double
    var direction: Double = 0.0
    var size = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX * 0.3, y: rect.maxY * 0.75))
            
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX * 0.7, y: rect.maxY * 0.75))
        
        let displacedPath = path.applying(CGAffineTransform(translationX: 0, y: rect.height * -0.5))
        let rotation = ((direction / 360) * 2 * Double.pi) - Double.pi
        
        return displacedPath.applying(CGAffineTransform(rotationAngle: rotation))
    }
}

struct Arrow: View {
    @State private var arrowThickness: Double = 20.0
    @State private var arrowDirection: Double = 0.0
    @State private var arrowSize = 100.0
    
    var body: some View {
        VStack {
            Spacer()
            ArrowShape(thickness: arrowThickness, direction: arrowDirection, size: arrowSize)
                .stroke(.red, style: StrokeStyle(lineWidth: arrowThickness, lineCap: .round, lineJoin: .round))
                .frame(width: arrowSize, height: arrowSize)
                .padding([.bottom])
            Spacer()
            
            Text("Thickness")
            Slider(value: $arrowThickness, in: 20...40)
                .padding([.horizontal, .bottom])
            
            Text("Direction")
            Slider(value: $arrowDirection, in: 0...360)
                .padding([.horizontal, .bottom])
            
            Text("Size")
            Slider(value: $arrowSize, in: 50...400, step: 1)
                .padding([.horizontal, .bottom])
            
        }
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow()
    }
}
