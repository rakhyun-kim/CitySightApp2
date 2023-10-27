//
//  HomeView.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/17/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness:Business?
    
    var body: some View {
        
        if model.restaurants.count != 0  || model.sights.count != 0 {
            
            NavigationStack {
                // Determine if we should show list or map
                if !isMapShowing {
                    // Show list
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text(model.placeMark?.locality ?? "")
                            
                            Spacer()
                            
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                            }
                        Divider()
                        ZStack(alignment: .top){
                            BusinessList()
                            
                            HStack {
                                Spacer()
                                YelpAttribution(link: "http://yelp.com")
                            }
                            .padding(.trailing, -20)
                        }
                    }.padding([.horizontal, .top])
                        
                    
                } else {
                    
                    ZStack(alignment:.top) {
                        
                        // Show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                
                                // Create a business detail view instance
                                // Pass in the selected business
                                BusinessDetail(business: business)
                            }
                        // Rectangle overlay
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            
                            HStack {
                                Image(systemName: "location")
                                    .padding()
                                Text(model.placeMark?.locality ?? "")
                                
                                Spacer()
                                
                                Button("Switch to list view") {
                                    self.isMapShowing = false
                                }.padding()
                            }
                        }
                        .padding()
                    }
                }
            }
        } else {
            // Still waiting for data so show spinner
            ProgressView()
        }
    }
}

#Preview {
    HomeView()
}
