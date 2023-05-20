//
//  ImageSearchView.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import SwiftUI

struct ImageSearchView: View {
    @EnvironmentObject var imageSearchViewModel: ImageSearchViewModel
    @Binding var textFieldString: String
    
    var body: some View {
        VStack {
            List {
                ForEach($imageSearchViewModel.imageSearchResults.imageDocument, id: \.self) { $image in
                    ImageCell(imageResult: $image)
                }
                
            }
            
        }
    }
}

//struct ImageSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageSearchView()
//    }
//}

struct ImageCell: View {
    @Binding var imageResult: ImageDocumentPModel
    
    var body: some View {
        VStack {
            HStack {
                Text("\(imageResult.displaySitename)")
                
                
            }
        }
    }
}
