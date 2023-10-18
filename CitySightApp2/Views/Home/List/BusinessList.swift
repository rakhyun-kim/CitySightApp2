//
//  BusinessList.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/17/23.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView() {
            
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSection(title: "Restaurants", businesses: model.restaurants)
                
                BusinessSection(title: "Sights", businesses: model.sights)
                    }
                }
        .scrollIndicators(.hidden)
                    }
                }

#Preview {
    BusinessList()
}
