//
//  VideoListItem.swift
//  Africa
//
//  Created by Jasur Salimov on 7/19/22.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - Properties
    let video: Video
    
    var body: some View {
        HStack(spacing: 10){
            ZStack{
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//: ZStack
            
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }//: HStack
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
