//
//  ContentView.swift
//  WebUrlLoadingInSwiftUI
//
//  Created by Balaji A on 01/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showImage = false
    @State private var showWebPage = false
    @State private var showData = false
    @State private var showVideo = false
    @StateObject private var dataViewModel = DataViewModel()
    private var youtubeChannelUrl: URL {
        URL(string: "https://www.youtube.com/channel/UCwePLxwase4e6xN_73dTT8w")!
    }
    private var videoUrl: URL {
        URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")!
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                //MARK: Load Image
                if showImage {
                    RemoteImageView()
                }
                Button("Load Image") {
                    showImage.toggle()
                }
                
                Divider()
                
                //MARK: Load Web Page
                if showWebPage {
                    WebView(url: youtubeChannelUrl)
                        .frame(height: 350)
                }
                Button("Load Web Page - (YouTube)") {
                    showWebPage.toggle()
                }
                
                Divider()
                
                //MARK: Fetch JSON Data
                if showData {
                    List(dataViewModel.users) { user in
                        Text(user.name)
                    }
                }
                Button("Fetch JSON Data") {
                    dataViewModel.fetchData()
                    showData.toggle()
                }
                
                Divider()
                
                //MARK: Play Video
                if showVideo {
                    VideoPlayerView(url: videoUrl)
                        .frame(height: 200)
                }
                Button("Play Video") {
                    showVideo.toggle()
                }
                
            }
            .padding()
            .navigationTitle("Load URL Examples")
        }
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}

