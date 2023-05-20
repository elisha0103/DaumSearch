//
//  NetworkService.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

final class WebService {
    static private let session = URLSession.shared
    static private let baseUrl = "https://dapi.kakao.com/v2/search/"
    
    static private let coversAPIURL = "https://covers.openlibrary.org/b/id/" // Covers_API 값
    
    static let headers: [String: String] = [
        "Content-Type": "application/x-www-form-urlencoded;charset=utf-8",
        "Authorization": "KakaoAK 7984adb93764c2c7b5403544466dafbb",
    ]
    
    static let nomalNetworkResponseCodes: ClosedRange<Int> = 200...299
    
    static func makeUrl(requestModel: RequestModel, path: String) throws -> URL {
        let fullPath = "\(baseUrl)\(path)"
        guard var urlComponents = URLComponents(string: fullPath) else { throw NetworkError.componentsError }
        
        var urlQueryItems: [URLQueryItem] = []
        
            var queryParameters = try requestModel.toDictionary()
            queryParameters.forEach { key, value in
                urlQueryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            
            urlComponents.queryItems = urlQueryItems.isEmpty ? nil : urlQueryItems
            guard let url = urlComponents.url else { throw NetworkError.componentsError }
        
            return url
    }
    
    static func fetchBlogSearchResult(requestModel: RequestModel) async throws -> BlogSearchResultsPModel {
        let url = try makeUrl(requestModel: requestModel, path: "blog")
        print("요청 url: \(url.description)")
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        headers.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: "\(key)")
        }
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else { throw NetworkError.unknownError }
        
        guard nomalNetworkResponseCodes.contains(response.statusCode) else { throw NetworkError.serverError(ServerError(rawValue: response.statusCode) ?? .unknown) }
        
        let blogSearchResults = try JSONDecoder().decode(BlogSearchResults.self, from: data)
        
        return BlogSearchResultsPModel.convertTo(blogSearchResults: blogSearchResults)
    }
    
    static func fetchImageSearchResult(requestModel: RequestModel) async throws -> ImageSearchResultsPModel {
        let url = try makeUrl(requestModel: requestModel, path: "image")
        print("요청 url: \(url.description)")

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        headers.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: "\(key)")
        }
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else { throw NetworkError.unknownError }
        
        guard nomalNetworkResponseCodes.contains(response.statusCode) else { throw NetworkError.serverError(ServerError(rawValue: response.statusCode) ?? .unknown) }

        let imageSearchResults = try JSONDecoder().decode(ImageSearchResults.self, from: data)
        
        return ImageSearchResultsPModel.convertTo(imageSearchResults: imageSearchResults)
    }
    
    static func fetchVideoSearchResult(requestModel: RequestModel) async throws -> VideoSearchResultsPModel {
        let url = try makeUrl(requestModel: requestModel, path: "blog")
        print("요청 url: \(url.description)")
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        headers.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: "\(key)")
        }
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else { throw NetworkError.unknownError }
        
        guard nomalNetworkResponseCodes.contains(response.statusCode) else { throw NetworkError.serverError(ServerError(rawValue: response.statusCode) ?? .unknown) }

        let videoSearchResults = try JSONDecoder().decode(VideoSearchResults.self, from: data)
        
        return VideoSearchResultsPModel.convertTo(videoSearchResults: videoSearchResults)
    }
    
//    // MARK: - Cover 이미지 fetch 함수
//    static func fetchCoverImage(coverCode: Int?, size: String) async throws -> UIImage? {
//        let start = CFAbsoluteTimeGetCurrent()
//        guard let coverCode = coverCode else { return nil }
//        
//        let requestURL: String = "\(coversAPIURL)\(coverCode)-\(size).jpg"
//        
//        guard let url = URL(string: requestURL) else {
//            print("URL String Error")
//            return nil
//        }
//        
//        if let cachedImage = CacheManager.imageLoadCache(urlString: requestURL) { // 기기 메모리 혹은 디스크로부터 이미지 호출
//            print("이미지 캐시 반환")
//            let diff = CFAbsoluteTimeGetCurrent() - start
//            print("캐시 로드 시간: \(diff)")
//            return cachedImage
//        } else { // 기기에 캐시 파일 없으면 서버로부터 load
//            let urlRequest = URLRequest(url: url)
//            if session.dataTask(with: urlRequest).state == URLSessionTask.State.running {
//                
//            }
//            
//            let (data, _) = try await session.data(from: url)
//            
//            guard let image = UIImage(data: data) else {
//                return nil
//            }
//            let diff = CFAbsoluteTimeGetCurrent() - start
//            print("서버 로드 시간: \(diff)")
//            // 서버로 로드된 파일을 기기 메모리, disk 영역에 저장
//            CacheManager.imageSetDisk(image: image, urlString: requestURL)
//            CacheManager.imageSetMemory(image: image, urlString: requestURL)
//            
//            print("api 서버 이미지 반환")
//            return image
//        }
//        
//    }
}
