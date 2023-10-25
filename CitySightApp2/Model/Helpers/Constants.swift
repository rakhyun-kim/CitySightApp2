//
//  Constants.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/17/23.
//

import Foundation

struct Constants {
    
    static var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    static var apirUrl = "https://api.yelp.com/v3/businesses/search"
    static var restaurantsKey = "restaurants"
    static var sightsKey = "arts"
    static var annotationReuseId = "business"
}
