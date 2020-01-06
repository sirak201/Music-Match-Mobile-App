//
//  LyricsModel.swift
//  MusicMatch
//
//  Created by Sirak on 1/4/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation



// MARK: - Welcome
struct Lyric: Codable {
    let message: LyricMessage
}

// MARK: - Message
struct LyricMessage: Codable {
    let header: LyricHeader
    let body: LyricBody
}

// MARK: - Body
struct LyricBody: Codable {
    let lyrics: Lyrics
}

// MARK: - Lyrics
struct Lyrics: Codable {
   
    let lyricsBody: String


    enum CodingKeys: String, CodingKey {

        case lyricsBody = "lyrics_body"

    }
}

// MARK: - Header
struct LyricHeader: Codable {
    let statusCode: Int
    let executeTime: Double

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case executeTime = "execute_time"
    }
}



