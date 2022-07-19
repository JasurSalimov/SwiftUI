//
//  VideoListView.swift
//  Africa
//
//  Created by Jasur Salimov on 7/18/22.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - Properties
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    
    //MARK: - Body
    var body: some View {
        NavigationView{
            List{
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)){
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }//: For each
            }//: List
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.insetGrouped)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }){
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//: Navigation
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
