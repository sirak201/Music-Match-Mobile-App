//
//  CardView.swift
//  MusicMatch
//
//  Created by Sirak on 1/3/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
   var track : Track
 
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.white)
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
                
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color.init(#colorLiteral(red: 0.8549019694, green: 0.4193620483, blue: 0.7387417899, alpha: 1)))
                            .padding()
                        Text("View Lyrics")
                            .font(.system(size: 17, weight: .bold, design: .default))
                            .foregroundColor(Color.white)
                        
                    }
                }
                    
                   
                Spacer()
            }
            .padding(.top)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    
    
    @State var artist : String = ""
    @State var track : String = "Yummy"
    @State var album : String = "Yummy"
    static var previews: some View {
        
        CardView(track: Track(id: 190333863, trackName: "Yummy", trackRating: 1, commontrackID: 3, instrumental: 3, explicit: 3, hasLyrics: 3, hasSubtitles: 3, hasRichsync: 3, numFavourite: 3, albumID: 3, albumName: "Yummy", artistID: 3, artistName: "Justin Biber", trackShareURL: "d", trackEditURL: "h", restricted: 4)).previewLayout(.fixed(width: 400, height: 250))
    }
}
