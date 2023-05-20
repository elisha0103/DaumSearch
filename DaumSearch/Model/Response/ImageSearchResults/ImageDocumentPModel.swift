//
//  ImageDocumentPModel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - Document
struct ImageDocumentPModel: Codable, Hashable {
    let collection: String
    let thumbnailURL: String
    let imageURL: String
    let width, height: Int
    let displaySitename: String
    let docURL: String
    let datetime: String
    
    static func convertTo(imageDocument: ImageDocument) -> ImageDocumentPModel {
        return ImageDocumentPModel(
            collection: imageDocument.collection,
            thumbnailURL: imageDocument.thumbnailURL,
            imageURL: imageDocument.imageURL,
            width: imageDocument.width,
            height: imageDocument.height,
            displaySitename: imageDocument.displaySitename,
            docURL: imageDocument.docURL,
            datetime: imageDocument.datetime
        )
    }
}
