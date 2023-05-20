//
//  BlogSearchView.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import SwiftUI

struct BlogSearchView: View {
    @EnvironmentObject var blogSearchViewModel: BlogSearchViewModel
    @Binding var textFieldString: String

    var body: some View {
        VStack {
            List {
                ForEach($blogSearchViewModel.blogSearchResults.blogDocument, id: \.self) { $blog in
                    BlogCell(blogResult: $blog)
                }
                
            }

        }
    }
}

//struct BlogSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        BlogSearchView()
//            .environmentObject(BlogSearchViewModel(blogSearchResults: BlogSearchResultsPModel(meta: MetaPModel(totalCount: 0, pageableCount: 0, isEnd: false), blogDocument: []), loadingResultDataState: .done))
//    }
//}
struct BlogCell: View {
    @Binding var blogResult: BlogDocumentPModel
    
    var body: some View {
        VStack {
            HStack {
                Text("제목: \(blogResult.title)")
                Spacer()
                Text("블로그 이름: \(blogResult.blogname)")
            }
            
        }
    }
}
