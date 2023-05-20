//
//  ApiEndpoints.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

struct APIEndpoints {
    
    static func getBlog(with requestModel: RequestPModel) -> EndPoint<RequestModel> {
        return EndPoint(baseURL: "https://dapi.kakao.com/v2/search/", path: "blog", method: .get, queryParameters: requestModel)
    }
    
    static func getImage(with requestModel: RequestPModel) -> EndPoint<RequestModel> {
        return EndPoint(baseURL: "https://dapi.kakao.com/v2/search/", path: "image", method: requestModel)
    }
    
    static func getVideo(with requestModel: requestPModel) -> EndPoint<RequestModel> {
        return EndPoint(baseURL: "https://dapi.kakao.com/v2/search/", path: "vclip", method: requestModel)
    }
    static func getPoster(path: String, width: Int) -> EndPoint<Data> {
        let sizes = [92, 154, 185, 342, 500, 780]
        let closesWidth = sizes.enumerated().min {abs($0.1 - width) < abs($1.1 - width)}?.element ?? sizes.first
        
        return EndPoint(baseURL: path, path: "", method: .get)
    }
}

