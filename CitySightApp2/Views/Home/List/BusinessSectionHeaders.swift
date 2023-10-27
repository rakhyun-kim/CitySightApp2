//
//  BusinessSectionHeaders.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/17/23.
//

import SwiftUI

struct BusinessSectionHeaders: View {
    
    var title: String
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(height: 45)
            
            Text(title)
                .font(.headline)
        }
    }
}

#Preview {
    BusinessSectionHeaders(title: "Restaurants")
}
