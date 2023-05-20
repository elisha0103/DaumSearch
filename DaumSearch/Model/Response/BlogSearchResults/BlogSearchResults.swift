//
//  BlogSearchResults.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - BlogSearchResults
struct BlogSearchResults: Codable {
    let meta: Meta
    let blogDocument: [BlogDocument]
}
