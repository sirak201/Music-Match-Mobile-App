//
//  Music.swift
//  MusicMatch
//
//  Created by Sirak on 1/3/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation
import Alamofire




class Music {
    
    let url = "\(API.api.baseUrl)chart.tracks.get?chart_name=top&page=1&page_size=10&country=us&f_has_lyrics=1&apikey=\(API.api.apiKey)"
    
    
    
    func signInRequest (completionHandler: @escaping (Result<[Track]>) -> Void) {
           
           
        Alamofire.request(url, method: .get)
                           .validate(statusCode: 200...300)
                           .responseData { (dataResponse) in
    
    
                   if (dataResponse.error != nil) {
                       completionHandler(.failure(dataResponse.error!))
                       print(dataResponse.error!)
                       return
                   }
    
                   do {
                   let data  = try JSONDecoder().decode(MusicModel.self, from: dataResponse.data!)
                    var holder = [Track]()
                    
                    data.message.body.trackList.forEach{
                        holder.append($0.track)
                    }
                    completionHandler(.success(holder))

                   } catch {
                       print(error)
                       completionHandler(.failure(error))
                   }
    
                  }
    }
    
    
    func getMusic (id : Int , completionHandler: @escaping (Result<Lyric>) -> Void) {
        
        let url = "\(API.api.baseUrl)track.lyrics.get?track_id=\(id)&apikey=\(API.api.apiKey)"

           
           
        Alamofire.request(url, method: .get)
                           .validate(statusCode: 200...300)
                           .responseData { (dataResponse) in
    
    
                   if (dataResponse.error != nil) {
                       completionHandler(.failure(dataResponse.error!))
                       print(dataResponse.error!)
                       return
                   }
    
                   do {
                   let data  = try JSONDecoder().decode(Lyric.self, from: dataResponse.data!)
                    
          
                    
                    completionHandler(.success(data))

                   } catch {
                       print(error)
                       completionHandler(.failure(error))
                   }
    
                  }
              }
    
    
    func searchByLyric(searchString : String , completionHandler: @escaping (Result<[Track]>) -> Void) {
        
        let url = "\(API.api.baseUrl)track.search?f_has_lyrics=\(searchString)&page_size=3&page=1&s_track_rating=desc&apikey=\(API.api.apiKey)"
        
        Alamofire.request(url, method: .get)
                                 .validate(statusCode: 200...300)
                                 .responseData { (dataResponse) in
          
          
                         if (dataResponse.error != nil) {
                             completionHandler(.failure(dataResponse.error!))
                             print(dataResponse.error!)
                             return
                         }
          
                         do {
                         let data  = try JSONDecoder().decode(MusicModel.self, from: dataResponse.data!)
                          var holder = [Track]()
                          
                          data.message.body.trackList.forEach{
                              holder.append($0.track)
                          }
                          completionHandler(.success(holder))

                         } catch {
                             print(error)
                             completionHandler(.failure(error))
                         }
          
                        }
        
        
        
        
    }
    
    
    
    
}





