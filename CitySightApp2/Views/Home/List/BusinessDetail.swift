//
//  BusinessDetail.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/20/23.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
            GeometryReader() { geometry in
                
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .ignoresSafeArea(.all, edges: .top)
            
            
            ZStack (alignment: .leading) {
                
                Rectangle()
                    .frame(height: 36)
                    .foregroundStyle(business.isClosed! ? .gray : . blue)
                
                Text(business.isClosed! ? "Closed" : "Open")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.leading)
            }
            
            
            Group {
                // Business Name
                Text(business.name!)
                    .font(.largeTitle)
                    .padding()
                
                // Loop through display Address
                if business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                        Text(displayLine)
                            .padding(.horizontal)
                    }
                }
                
                // Rating
                Image("regular_\(business.rating ?? 0)")
                    .padding()
                
                Divider()
                
                // Phone
                HStack {
                    Text("Phone:")
                        .bold()
                    Text(business.displayPhone ??
                         "")
                    Spacer()
                    Link("Call", destination: URL(string: "Tel: \(business.phone ?? "")")!)
                }
                .padding()
                
                Divider()
                
                // Reviews
                HStack {
                    Text("Reviews:")
                        .bold()
                    Text(String(business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "tel:\(business.url ?? "")")!)
                }
                .padding()
                
                Divider()
                
                // Website
                HStack {
                    Text("Website:")
                        .bold()
                    Text(business.url ??
                         "")
                    .lineLimit(1)
                    Spacer()
                    Link("Vist", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                
                Divider()
            }
            
            // Get directions button
            Button {
                
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundStyle(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundStyle(.white)
                        .bold()
                }
            }
            .padding()
        }
    }
}