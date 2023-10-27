//
//  ContentView.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/16/23.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // Detect the authorization status of geolocating the user
        
        if model.authorizationState == .notDetermined {
            // If undetermined, show onboard
            OnBoardingView()
        }
        else if model.authorizationState == CLAuthorizationStatus.authorizedAlways || 
                    model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse {
            // IF approved, show home view
            HomeView()
        }
        else {
            // If denied show denied view
            DeniedView()
        }
    }
}

#Preview {
    LaunchView()
}
