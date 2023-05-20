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
    
    var body: some View {
        VStack {
            Header(blogStepToggle: $blogStepToggle, videoStepToggle: $videoStepToggle, imageStepToggle: $imageStepToggle, namespace: namespace.self)
                .padding(.horizontal, 10)
        }
        
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
