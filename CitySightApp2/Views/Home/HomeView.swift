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
                            Text("Chicago")
                            
                            Spacer()
                            
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                            }
                        Divider()
                        
                        BusinessList()
                    }.padding([.horizontal, .top])
                        
                    
                } else {
                    // Show map
                    BusinessMap(selectedBusiness: $selectedBusiness)
                        .ignoresSafeArea()
                        .sheet(item: $selectedBusiness) { business in
                            
                            // Create a business detail view instance
                            // Pass in the selected business
                            BusinessDetail(business: business)
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
