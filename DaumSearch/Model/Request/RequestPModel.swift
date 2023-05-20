//
//  RequestPModel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

struct RequestPModel {
    var query: String
    var sort: String
    var page: Int
    var size: Int
    
    static func convertTo(requestModel: RequestModel) -> RequestPModel {
        return RequestPModel(query: requestModel.query, sort: requestModel.sort, page: requestModel.page, size: requestModel.size)
    }
}
