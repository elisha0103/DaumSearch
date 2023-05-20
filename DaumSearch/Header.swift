//
//  Header.swift
//  DaumSearch
//
//  Created by 진태영 on 2023/05/20.
//

import SwiftUI

struct Header: View {
    @Binding var blogStepToggle: Bool
    @Binding var videoStepToggle: Bool
    @Binding var imageStepToggle: Bool
    let namespace: Namespace.ID
    @State private var animation: Bool = true
    
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 25) {
                VStack(spacing: 5) {
                    Text("블로그")
                        .foregroundColor(blogStepToggle ? .black : .gray)
                        .fontWeight(.bold)
                        .onTapGesture {
                            blogStepToggle = true
                            videoStepToggle = false
                            imageStepToggle = false
                        }
                    if blogStepToggle {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: blogStepToggle ? 85 : 70, height: 2)
                            .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                    }
                } // 블로그
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text("동영상")
                        .foregroundColor(videoStepToggle ? .black : .gray)
                        .fontWeight(.bold)
                        .onTapGesture {
                            blogStepToggle = false
                            videoStepToggle = true
                            imageStepToggle = false
                        }
                    if videoStepToggle {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: videoStepToggle ? 85 : 70, height: 2)
                            .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                    }
                } // 동영상
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text("사진")
                        .foregroundColor(imageStepToggle ? .black : .gray)
                        .fontWeight(.bold)
                        .onTapGesture {
                            blogStepToggle = false
                            videoStepToggle = false
                            imageStepToggle = true
                        }
                    if imageStepToggle {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: imageStepToggle ? 70 : 60, height: 2)
                            .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                    }
                } // 동영상
            }
            .animation(.linear(duration: 0.08))
            .padding(.top, 10)
        }
        
    }
}

//struct Header_Previews: PreviewProvider {
//    static var previews: some View {
//        Header(blogStepToggle: <#Binding<Bool>#>, videoStepToggle: <#Binding<Bool>#>, ImageStepToggle: <#Binding<Bool>#>)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
