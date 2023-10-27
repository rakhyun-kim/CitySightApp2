//
//  DirectionView.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/25/23.
//

import SwiftUI

struct DirectionView: View {
    
    var business : Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // Business title
            HStack {
                BusinessTitle(business: business)
                
                Spacer()
                
                if let lat = business.coordinates?.latitude, 
                    let long = business.coordinates?.longitude,
                    let name = business.name {
                    
                    Link("Open in Maps", destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!)
                }
            }
            .padding()
            // Direction map
            DirectionsMap(business: business)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

