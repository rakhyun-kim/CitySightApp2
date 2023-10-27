//
//  BusinessTitle.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/25/23.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            // Business Name
            Text(business.name!)
                .font(.largeTitle)
            
            // Loop through display Address
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0)")
        }
    }
}

