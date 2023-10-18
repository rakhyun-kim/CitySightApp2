//
//  BusinessSection.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/17/23.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        Section (header: BusinessSectionHeaders(title: title)) {
            
            ForEach(businesses) { business in
                BusinessRow(business: business)
                
            }
        }
    }
}
