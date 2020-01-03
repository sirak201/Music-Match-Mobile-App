//
//  ContentView.swift
//  MusicMatch
//
//  Created by Sirak on 1/3/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var trackList = [Track]()
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Top 10 Tracks")
                    .font(.system(size: 23))
                    .bold()
                    .padding()
                
                HStack {
                    Spacer()
                    List(trackList) { track in
                         CardView(track: track).frame(width: 300, height: 250)
                    }
                     Spacer()
                }

                Spacer()
            }
              
             .navigationBarTitle("Music Match")
            
            
         
            
        }.onAppear{
            self.callFetchTracks()
        
        }
    }
    
    
    func callFetchTracks () {
        let music = Music()
        music.signInRequest { (res) in
            switch res {
                
            case .success(let list):
                self.trackList = list
            case .failure(_):
                print("Failed To print")
         
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
