//
//  BlogDocument.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - Document
struct BlogDocument: Codable {
    let title, contents: String
    let url: String
    let blogname: String
    let thumbnail: String
    let datetime: String
}
