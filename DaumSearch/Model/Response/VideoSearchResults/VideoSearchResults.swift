//
//  SearchResultWithImage.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - VideoSearchResults
struct VideoSearchResults: Codable {
    let meta: Meta
    let videoDocument: [VideoDocument]
    
    enum CodingKeys: String, CodingKey {
        case videoDocument = "documents"
        case meta
    }
}
