//
//  VideoSearchResultsPodel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - VideoSearchResults
struct VideoSearchResultsPModel: Codable {
    let meta: MetaPModel
    var videoDocument: [VideoDocumentPModel]
    
    static func convertTo(videoSearchResults: VideoSearchResults) -> VideoSearchResultsPModel {
        return VideoSearchResultsPModel(
            meta: MetaPModel.convertTo(meta: videoSearchResults.meta),
            videoDocument: videoSearchResults.videoDocument.map {
                VideoDocumentPModel.convertTo(videoDocument: $0)
            }
        )
    }
}
