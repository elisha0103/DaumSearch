//
//  VideoDocumentPModel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - Document
struct VideoDocumentPModel: Codable, Hashable {
    let title: String
    let playTime: Int
    let thumbnail: String
    let url: String
    let datetime: Date
    let author: String

    static func convertTo(videoDocument: VideoDocument) -> VideoDocumentPModel {
        return VideoDocumentPModel(
            title: videoDocument.title,
            playTime: videoDocument.playTime,
            thumbnail: videoDocument.thumbnail,
            url: videoDocument.url,
            datetime: videoDocument.datetime,
            author: videoDocument.author
        )
    }
}
