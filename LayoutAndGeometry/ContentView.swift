//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Amit Shrivastava on 01/02/22.
//

import SwiftUI


struct ContentView: View {
    //hue represnts a color value in terms of number
    // let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow ]
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        //here the minY as now being used with geometry reader continuously gives us the distance of minY from the current view
                        Text("Row #\(index) scale \( geo.frame(in: .global).minY))")
                        
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: min(1,geo.frame(in: .global).minY / fullView.size.height), saturation: 1, brightness: 1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(geo.frame(in: .global).minY / 200)
                            .scaleEffect(max(0.5,geo.frame(in: .global).minY / 400))
                        
                    }
                    .frame(height: 40)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
