//
//  ContentView.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: Int = 1
    @State private var blogStepToggle: Bool = true
    @State private var videoStepToggle: Bool = false
    @State private var imageStepToggle: Bool = false
    @Namespace var namespace
    @StateObject var imageSearchViewModel: ImageSearchViewModel = ImageSearchViewModel(imageSearchResults: ImageSearchResultsPModel(meta: MetaPModel(totalCount: 0, pageableCount: 0, isEnd: true), imageDocument: []), loadingResultDataState: .done)
    @StateObject var blogSearchViewModel: BlogSearchViewModel = BlogSearchViewModel(blogSearchResults: BlogSearchResultsPModel(meta: MetaPModel(totalCount: 0, pageableCount: 0, isEnd: true), blogDocument: []), loadingResultDataState: .done)
    @StateObject var videoSearchViewModel: VideoSearchViewModel = VideoSearchViewModel(videoSearchResults: VideoSearchResultsPModel(meta: MetaPModel(totalCount: 0, pageableCount: 0, isEnd: true), videoDocument: []), loadingResultDataState: .done)

    @State var textFieldString: String = ""
    
    var body: some View {
        VStack {
            Header(blogStepToggle: $blogStepToggle, videoStepToggle: $videoStepToggle, imageStepToggle: $imageStepToggle, namespace: namespace.self)
                .padding(.horizontal, 10)
            
            TextField("검색어를 입력해주세요", text: $textFieldString, onCommit: {
                let requestModel: RequestModel = RequestModel(query: "\(textFieldString)")
                
                Task {
                    if blogStepToggle {
                        print("blog")
                        print("\(blogSearchViewModel.loadingResultDataState)")
                        await blogSearchViewModel.fetchBlogService(requestModel: requestModel)
                    } else if videoStepToggle {
                        print("video")
                        print("\(videoSearchViewModel.loadingResultDataState)")
                        await videoSearchViewModel.fetchVideoService(requestModel: requestModel)
                    } else {
                        print("image")
                        print("\(imageSearchViewModel.loadingResultDataState)")
                        await imageSearchViewModel.fetchImageService(requestModel: requestModel)
                    }
                }
            })
            
            if blogStepToggle == true && videoStepToggle == false && imageStepToggle == false {
                BlogSearchView(textFieldString: $textFieldString)
                    .environmentObject(blogSearchViewModel)
                    .task {
                        let requestModel: RequestModel = RequestModel(query: "\(textFieldString)")

                        await blogSearchViewModel.fetchBlogService(requestModel: requestModel)

                    }
            } else if blogStepToggle == false && videoStepToggle == true && imageStepToggle == false {
                VideoSearchView(textFieldString: $textFieldString)
                    .environmentObject(videoSearchViewModel)
                    .task {
                        let requestModel: RequestModel = RequestModel(query: "\(textFieldString)")

                        await videoSearchViewModel.fetchVideoService(requestModel: requestModel)

                    }

            } else {
                ImageSearchView(textFieldString: $textFieldString)
                    .environmentObject(imageSearchViewModel)
                    .task {
                        let requestModel: RequestModel = RequestModel(query: "\(textFieldString)")

                        await imageSearchViewModel.fetchImageService(requestModel: requestModel)

                    }

            }
        }
        
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
