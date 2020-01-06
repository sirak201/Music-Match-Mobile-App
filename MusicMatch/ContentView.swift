//
//  ContentView.swift
//  MusicMatch
//
//  Created by Sirak on 1/3/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SwiftUI
class ViewModel: ObservableObject {
    
    @Published var tracks = [Track]()
    @Published var searchText = "" {
        didSet {
            if searchText != "" {
                searchForText(search: searchText)
            } else {
                callFetchTracks()
            }
        }
    }
    
    func callFetchTracks () {
        let music = Music()
        music.signInRequest { (res) in
            switch res {
                
            case .success(let list):
                self.tracks = list
            case .failure(_):
                print("Failed To print")
         
            }
        }
        
    }
    
    
    func searchForText (search : String) {
          let music = Music()
          music.searchByLyric(searchString: search) { (res) in
              switch res {
                  
              case .success(let list):
                  self.tracks = list
              case .failure(_):
                  print("Failed To print")
           
              }
          }
          
      }
}

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()


    var body: some View {
        NavigationView {
            
            VStack {
                Text("Top 10 Tracks")
                    .font(.system(size: 23))
                    .bold()
                    .padding()
                
                TextField("Type your search",text: self.$viewModel.searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
              
                
                HStack {
                    List(viewModel.tracks) { track in
                        
                       

                        NavigationLink(destination: LyricsView(track: track)) {
                            CardView(track: track).frame(width: 400, height: 250)
                       }
                    }
               
                }

                Spacer()
            }
              
             .navigationBarTitle("Music Match")
            
            
         
            
        }.onAppear{
            self.viewModel.callFetchTracks()
        
        }
    }
    
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
