//
//  VideoSearchResults.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - ImageSearchResults
struct ImageSearchResults: Codable {
    let meta: Meta
    let imageDocument: [ImageDocument]
    
    enum CodingKeys: String, CodingKey {
        case imageDocument = "documents"
        case meta
    }
}
