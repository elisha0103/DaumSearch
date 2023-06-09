//
//  SearchDataStore.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

final class BlogSearchViewModel: ObservableObject {
    @Published var blogSearchResults: BlogSearchResultsPModel
    @Published var loadingResultDataState: LoadingState = .done {
        didSet {
            print("state changed to: \(loadingResultDataState)")
        }
    }
        
    enum LoadingState: Comparable {
        case done
        case isLoading
        case loadedAll
        case error(String)
    }
    
    init(blogSearchResults: BlogSearchResultsPModel, loadingResultDataState: LoadingState) {
        self.blogSearchResults = blogSearchResults
        self.loadingResultDataState = loadingResultDataState
    }
    
    func resetViewModelData() {
        self.loadingResultDataState = .done
        self.blogSearchResults.blogDocument = []
    }
    
    func fetchBlogService(requestModel: RequestModel) async {
//        guard loadingResultDataState == LoadingState.done else { return }
        
        do {
            print("blog search view model start fetch")
            DispatchQueue.main.sync {
                self.loadingResultDataState = .isLoading
            }
            
            let result = try await WebService.fetchBlogSearchResult(requestModel: requestModel)
            print("현재 페이지: \(String(describing: requestModel.page))")
            print("finish fetch")
            
            DispatchQueue.main.async { [weak self] in
                self?.blogSearchResults.meta = result.meta
                self?.blogSearchResults.blogDocument.append(contentsOf: result.blogDocument)
                self?.loadingResultDataState = (self?.blogSearchResults.meta.isEnd ?? false ? .loadedAll : .done)
                
                if self?.loadingResultDataState == .loadedAll {
                    print("데이터의 끝입니다. Results: \(self?.blogSearchResults.blogDocument.count ?? -1)")
                }
            }
        } catch let error as NSError {
            print("JSON fetch Error: \(error.localizedDescription)")
            DispatchQueue.main.async { [weak self] in
                self?.loadingResultDataState = .error("Could not load: \(error.localizedDescription)")
            }
        }
    }
    
}
