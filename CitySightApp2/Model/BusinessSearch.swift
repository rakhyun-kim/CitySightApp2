//
//  BusinessSearch.swift
//  CitySightApp2
//
//  Created by Rakhyun Kim on 10/16/23.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}

struct Region: Decodable {
    
    var center = Coordinate()
}
