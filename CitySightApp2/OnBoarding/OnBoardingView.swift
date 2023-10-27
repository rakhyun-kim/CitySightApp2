//
//  OnBoardingView.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/27/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        VStack {
            
            // Tab View
            TabView(selection: $tabSelection) {
                
                // First tab
                VStack (spacing: 20) {
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sights!")
                        .bold()
                        .font(.title)
                    Text("City Sights helps you find the best of the city!")
                        
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(.white)
                .tag(0)
                
                // Second Tab
                VStack (spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We will guide you to the finest dining establishments, event spaces, and beyond, tailored to your current location")
                        
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(.white)
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            // Button
            Button {
                // Dectect which tab it is
                if tabSelection == 0 {
                    tabSelection = 1
                } 
                else {
                   // Request for geolocation permission
                    // Request permissoin from the user
                    model.requestGeolocationPermission()
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next" : "Get my location")
                        .bold()
                        .padding()
                }
            }
            .padding()
            .accentColor(tabSelection == 0 ? blue: turquoise)

        }
        .ignoresSafeArea()
        .background(tabSelection == 0 ? blue : turquoise)
    }
}

#Preview {
    OnBoardingView()
}
