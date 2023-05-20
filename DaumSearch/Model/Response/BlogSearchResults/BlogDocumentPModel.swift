//
//  BlogDocumentPModel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - Document
struct BlogDocumentPModel: Codable {
    let title, contents: String
    let url: String
    let blogname: String
    let thumbnail: String
    let datetime: String
    
    static func convertTo(blogDocument: BlogDocument) -> BlogDocumentPModel {
        return BlogDocumentPModel(
            title: blogDocument.title,
            contents: blogDocument.contents,
            url: blogDocument.url,
            blogname: blogDocument.blogname,
            thumbnail: blogDocument.thumbnail,
            datetime: blogDocument.datetime
        )
    }
}
