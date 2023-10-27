//
//  DeniedView.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/27/23.
//

import SwiftUI

struct DeniedView: View {
    
    let bgColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    var body: some View {
        
        VStack(spacing: 10) {
            
            Spacer()
            
            Text("Oh no!")
                .font(.title2)
            
            Spacer()
            
            Text("To offer you the city's top attractions, we require access to your location. You can modify your choice in settings at any time")
            
            Spacer()
            
            Button {
                // Open settings by getting the settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        // If we can open this settings url, then open it
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                        
                    Text("Go to settings")
                        .bold()
                        .foregroundStyle(bgColor)
                        .padding()
                }

            }
            .padding()

            Spacer()
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
        .background(bgColor)
        .ignoresSafeArea()
    }
}

#Preview {
    DeniedView()
}
