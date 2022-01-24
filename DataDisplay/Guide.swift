//
//  Guide.swift
//  DataDisplay
//
//  Created by Trevor Steele on 1/23/22.
//

import Foundation

struct Guide {
    let name: String
    let city: String?
    let state: String?
    let startDate: Date
    let endDate: Date
}

extension Guide: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name, startDate, endDate, venue
    }
    
    enum VenueKeys: String, CodingKey {
        case city, state
    }
    
    init(from decoder: Decoder) throws {
        
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        let startDateString = try values.decode(String.self, forKey: .startDate)
        startDate = dateFormatter.date(from: startDateString) ?? Date()

        let endDateString = try values.decode(String.self, forKey: .endDate)
        endDate = dateFormatter.date(from: endDateString) ?? Date()
        
        let venue = try values.nestedContainer(keyedBy: VenueKeys.self, forKey: .venue)
        city = try venue.decodeIfPresent(String.self, forKey: .city)
        state = try venue.decodeIfPresent(String.self, forKey: .state)
    }
}

struct APIResponse: Decodable {
    let data: [Guide]
}
