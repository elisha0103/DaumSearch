//
//  ImageDocument.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - Document
struct VideoDocument: Codable {
    let title: String
    let playTime: Int
    let thumbnail: String
    let url: String
    let datetime: Date
    let author: String

    enum CodingKeys: String, CodingKey {
        case title
        case playTime = "play_time"
        case thumbnail, url, datetime, author
    }
}
