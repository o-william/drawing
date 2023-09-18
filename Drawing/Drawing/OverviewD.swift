//
//  OverviewD.swift
//  Drawing
//
//  Created by Oluwapelumi Williams on 15/09/2023.
//

import SwiftUI

struct OverviewD: View {
    @State private var amount = 0.0
    
    var body: some View {
//        VStack {
//            Image("Example")
//                .colorMultiply(.red)
//                .frame(width: 300, height: 300)
//                .clipped()
//
//            ZStack {
//                Image("Example")
//
//                Rectangle()
//                    .fill(.red)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
//            .clipped()
//        }
        
        VStack {
            ZStack {
                Circle()
                    // .fill(.red) // not truly red. But is SwftUI's version of red, adaptive for both light and dark modes
                    .fill(Color(red: 1, green: 0, blue: 0)) // true red
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                // .fill(.green) // not truly green. But is SwftUI's version of green, adaptive for both light and dark modes
                    .fill(Color(red: 0, green: 1, blue: 0)) // true green
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                // .fill(.blue) // not truly blue. But is SwftUI's version of blue, adaptive for both light and dark modes
                    .fill(Color(red: 0, green: 0, blue: 1)) // true blue
                    .frame(width: 200 * amount)
                    // .offset(x: -50, y: -80)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
            
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct OverviewD_Previews: PreviewProvider {
    static var previews: some View {
        OverviewD()
    }
}
