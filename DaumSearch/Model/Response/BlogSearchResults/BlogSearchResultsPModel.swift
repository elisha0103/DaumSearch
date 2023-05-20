//
//  BlogSearchResultsPModel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - BlogSearchResults
struct BlogSearchResultsPModel: Codable {
    var meta: MetaPModel
    var blogDocument: [BlogDocumentPModel]
    
    static func convertTo(blogSearchResults: BlogSearchResults) -> BlogSearchResultsPModel {
        return BlogSearchResultsPModel(
            meta: MetaPModel.convertTo(meta: blogSearchResults.meta),
            blogDocument: blogSearchResults.blogDocument.map {
                BlogDocumentPModel.convertTo(blogDocument: $0)
            }
        )
    }
}
