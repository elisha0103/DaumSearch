//
//  ImageSearchResultsPModel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - ImageSearchResults
struct ImageSearchResultsPModel: Codable {
    let meta: Meta
    let imageDocument: [ImageDocumentPModel]
    
    static func convertTo(imageSearchResults: ImageSearchResults) -> ImageSearchResultsPModel {
        return ImageSearchResultsPModel(
            meta: imageSearchResults.meta,
            imageDocument: imageSearchResults.imageDocument.map {
                ImageDocumentPModel.convertTo(imageDocument: $0)
            }
        )
    }
}
