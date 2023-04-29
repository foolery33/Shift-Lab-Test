//
//  ContestModel.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import Foundation

struct ContestModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case startTime = "startTime"
        case endTime = "endTime"
        case link = "link"
    }
    
    init(name: String, startTime: String, endTime: String, link: String) {
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.link = link
    }
    
    var name: String
    var startTime: String
    var endTime: String
    var link: String
}
