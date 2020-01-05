//
//  LyricsView.swift
//  MusicMatch
//
//  Created by Sirak on 1/4/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SwiftUI

struct LyricsView: View {
    var track : Track
    var body: some View {
        
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color.clear)
                    VStack {
                        HStack {
                            Text(track.artistName)
                                .font(.system(size: 20, weight: .heavy, design: .default))
                            Spacer()
                        }.padding()
                        
                        HStack {
                           Text("Track: ")
                               .font(.system(size: 17, weight: .bold, design: .default))
                            Text(track.trackName)
                                .font(.system(size: 17, weight: .semibold, design: .default))
                           Spacer()
                        }.padding()
                        
                        HStack {
                             Text("Album: ")
                                 .font(.system(size: 17, weight: .bold, design: .default))
                            Text(track.albumName)
                                  .font(.system(size: 17, weight: .semibold, design: .default))
                             Spacer()
                        }.padding(.leading)
                        
                        Spacer()

                        Spacer()
                        }.background(Color.clear)
                        
                    .padding(.top)
                }.foregroundColor(Color.white)
               
                .frame(width: 400, height: 150)
                    
                   

                 ScrollView {
                     Text("Hello , is it me you are looking for ")
                         .font(.system(size: 40, weight: .heavy, design: .rounded))
                         .foregroundColor(Color.white)
                     .padding()
                         .lineLimit(nil)
                 }
                 .lineSpacing(5)
                 .background(Color.green)
                 .padding([.top , .leading , .trailing])
                 .edgesIgnoringSafeArea(.bottom)
            }
            
     
        }
        
    }
}

struct LyricsView_Previews: PreviewProvider {
    static var previews: some View {
        LyricsView(track: Track(id: 190333863, trackName: "Yummy", trackRating: 1, commontrackID: 3, instrumental: 3, explicit: 3, hasLyrics: 3, hasSubtitles: 3, hasRichsync: 3, numFavourite: 3, albumID: 3, albumName: "Yummy", artistID: 3, artistName: "Justin Biber", trackShareURL: "d", trackEditURL: "h", restricted: 4))
    }
}
