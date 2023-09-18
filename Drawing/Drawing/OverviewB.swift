//
//  OverviewB.swift
//  Drawing
//
//  Created by Oluwapelumi Williams on 15/09/2023.
//

import SwiftUI

// ARC ALREADY IN OVERVIEW FILE
//struct Arc: Shape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockwise: Bool
//
//    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//
//        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//
//        return path
//    }
//}
struct Flower: Shape {
    // How much to move this petal away from the center by
    var petalOffset: Double = -20
    
    // How wide to make each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        // The path that will contain all the petals
        var path = Path()
        
        // count from 0 up to 2pi, moving up pi/8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // rotate the petal by the current value of the loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to the center of the view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for the current petal using the properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            // apply the rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add it to the main path
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct OverviewB: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        Form {
            VStack {
                Circle()
                    .strokeBorder(.blue, lineWidth: 40)
                
                Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                    .strokeBorder(.blue, lineWidth: 40)
            }
            VStack {
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                    .fill(.red, style: FillStyle(eoFill: true))
                    //.stroke(.red, lineWidth: 2)
                
                Text("Offset")
                Slider(value: $petalOffset, in: -40...40)
                    .padding([.horizontal, .bottom])
                
                Text("Width")
                Slider(value: $petalWidth, in: 0...100)
                    .padding(.horizontal)
            }
            Text("Hello World")
                .frame(width: 300, height: 300)
                //.border(.red, width: 30)
                //.background(Image("Example"))
                
                // .border(Image("Example"), width: 30) // border as an image: won't work, but we can use ImagePaint
                // .border(ImagePaint(image: Image("Example"), scale: 0.1), width: 30)
            Capsule()
                .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 200)
        }
    }
}

struct OverviewB_Previews: PreviewProvider {
    static var previews: some View {
        OverviewB()
    }
}
