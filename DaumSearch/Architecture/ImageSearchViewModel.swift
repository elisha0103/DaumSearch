//
//  ImageSearchViewModel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

final class ImageSearchViewModel: ObservableObject {
    @Published var imageSearchResults: ImageSearchResultsPModel
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
    
    init(imageSearchResults: ImageSearchResultsPModel, loadingResultDataState: LoadingState) {
        self.imageSearchResults = imageSearchResults
        self.loadingResultDataState = loadingResultDataState
    }
    
    func resetViewModelData() {
        self.loadingResultDataState = .done
        self.imageSearchResults.imageDocument = []
    }
    
    func fetchImageService(requestModel: RequestModel) async {
//        guard loadingResultDataState == LoadingState.done else { return }
        
        do {
            print("blog search view model start fetch")
            DispatchQueue.main.sync {
                self.loadingResultDataState = .isLoading
            }
            
            let result = try await WebService.fetchImageSearchResult(requestModel: requestModel)
            print("현재 페이지: \(String(describing: requestModel.page))")
            print("finish fetch")
            
            DispatchQueue.main.async { [weak self] in
                self?.imageSearchResults.meta = result.meta
                self?.imageSearchResults.imageDocument.append(contentsOf: result.imageDocument)
                self?.loadingResultDataState = (self?.imageSearchResults.meta.isEnd ?? false ? .loadedAll : .done)
                
                if self?.loadingResultDataState == .loadedAll {
                    print("데이터의 끝입니다. Results: \(self?.imageSearchResults.imageDocument.count ?? -1)")
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
