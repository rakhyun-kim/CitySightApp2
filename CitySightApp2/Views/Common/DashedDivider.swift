//
//  DashedDivider.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/27/23.
//

import SwiftUI

struct DashedDivider: View {
    
    var body: some View {
        
        GeometryReader { geometry in
        
            Path { path in
                path.move(to: CGPoint.zero)
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundStyle(.gray)
        }
        .frame(height: 1)
    }
}

#Preview {
    DashedDivider()
}
