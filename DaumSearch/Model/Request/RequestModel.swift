//
//  SearchRequest.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

struct RequestModel: Codable {
    var query: String
    var sort: String
    var page: Int
    var size: Int
    
    enum CodingKeys: String, CodingKey {
        case query = "query"
        case sort = "sort"
        case page = "page"
        case size = "size"
    }
}
