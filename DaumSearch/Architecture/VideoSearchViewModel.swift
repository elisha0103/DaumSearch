//
//  VideoSearchViewModel.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import Foundation

final class VideoSearchViewModel: ObservableObject {
    @Published var videoSearchResults: VideoSearchResultsPModel
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
    
    init(videoSearchResults: VideoSearchResultsPModel, loadingResultDataState: LoadingState) {
        self.videoSearchResults = videoSearchResults
        self.loadingResultDataState = loadingResultDataState
    }
    
    func resetViewModelData() {
        self.loadingResultDataState = .done
        self.videoSearchResults.videoDocument = []
    }
    
    func fetchVideoService(requestModel: RequestModel) async {
//        guard loadingResultDataState == LoadingState.done else { return }
        
        do {
            print("blog search view model start fetch")
            DispatchQueue.main.sync {
                self.loadingResultDataState = .isLoading
            }
            
            let result = try await WebService.fetchVideoSearchResult(requestModel: requestModel)
            print("현재 페이지: \(String(describing: requestModel.page))")
            print("finish fetch")
            
            DispatchQueue.main.async { [weak self] in
                self?.videoSearchResults.meta = result.meta
                self?.videoSearchResults.videoDocument.append(contentsOf: result.videoDocument)
                self?.loadingResultDataState = (self?.videoSearchResults.meta.isEnd ?? false ? .loadedAll : .done)
                
                if self?.loadingResultDataState == .loadedAll {
                    print("데이터의 끝입니다. Results: \(self?.videoSearchResults.videoDocument.count ?? -1)")
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
