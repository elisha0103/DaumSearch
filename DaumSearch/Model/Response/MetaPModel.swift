//
//  MetaPModel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

// MARK: - Meta
struct MetaPModel: Codable {
    let totalCount, pageableCount: Int
    let isEnd: Bool

    static func convertTo(meta: Meta) -> MetaPModel {
        return MetaPModel(totalCount: meta.totalCount, pageableCount: meta.pageableCount, isEnd: meta.isEnd)
    }
}
