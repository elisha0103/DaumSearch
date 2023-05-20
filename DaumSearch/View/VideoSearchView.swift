//
//  SearchView.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import SwiftUI

struct VideoSearchView: View {
    @EnvironmentObject var videoSearchViewModel: VideoSearchViewModel
    @Binding var textFieldString: String
    
    var body: some View {
        VStack {
            List {
                ForEach($videoSearchViewModel.videoSearchResults.videoDocument, id: \.self) { $video in
                    VideoCell(videoResult: $video)
                }
                
            }
        }
    }
}

struct VideoCell: View {
    @Binding var videoResult: VideoDocumentPModel
    
    var body: some View {
        VStack {
            HStack {
                Text("제목: \(videoResult.title)")
                Spacer()
                Text("업로더: \(videoResult.author)")
            }
            Text("재생시간: \(videoResult.playTime)")
            
            
        }
    }
}
