//
//  BusinessRow.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/18/23.
//

import SwiftUI

struct BusinessRow: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                // Image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(5)
                    .scaledToFit()
                
                // Name and distance
                VStack(alignment: .leading){
                    Text(business.name ?? "")
                        .bold()
                    Text(String(format: "%.1f km away", (business.distance ?? 0)/1000))
                        .font(.caption)
                }
                                  
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Image("regular_\(business.rating ?? 0)")
                        Text("\(business.reviewCount ?? 0) Reviews")
                            .font(.caption)
                    }
            }
            
            Divider()
        }
        .foregroundStyle(Color.black)
    }
}
