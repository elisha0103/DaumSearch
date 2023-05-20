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
    
    var page = 1
    
    enum LoadingState: Comparable {
        case done
        case isLoading
        case loadedAll
        case error(String)
    }
    
    init(blogSearchResults: BlogSearchResultsPModel, loadingResultDataState: LoadingState, page: Int = 1) {
        self.blogSearchResults = blogSearchResults
        self.loadingResultDataState = loadingResultDataState
        self.page = page
    }
    
    func resetViewModelData() {
        self.loadingResultDataState = .done
        self.blogSearchResults
    }
    
}
