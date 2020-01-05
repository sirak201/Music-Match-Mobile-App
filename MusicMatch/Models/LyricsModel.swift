//
//  LyricsModel.swift
//  MusicMatch
//
//  Created by Sirak on 1/4/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation


struct Welcome: Codable {
    let message: LyricsMessage
}

// MARK: - Message
struct LyricsMessage: Codable {
    let header: Header
    let body: LyricsBody
}

// MARK: - Body
struct LyricsBody: Codable {
    let lyrics: Lyrics
}

// MARK: - Lyrics
struct Lyrics: Codable {
    let lyricsID, restricted, instrumental: Int
    let lyricsBody, lyricsLanguage: String
    let scriptTrackingURL, pixelTrackingURL: String
    let lyricsCopyright: String

    enum CodingKeys: String, CodingKey {
        case lyricsID = "lyrics_id"
        case restricted, instrumental
        case lyricsBody = "lyrics_body"
        case lyricsLanguage = "lyrics_language"
        case scriptTrackingURL = "script_tracking_url"
        case pixelTrackingURL = "pixel_tracking_url"
        case lyricsCopyright = "lyrics_copyright"
    }
}


