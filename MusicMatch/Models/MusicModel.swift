//
//  TrackModel.swift
//  MusicMatch
//
//  Created by Sirak on 1/4/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation
   
struct MusicModel: Codable {
    let message: Message
}

// MARK: - Message
struct Message: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let trackList: [TrackList]

    enum CodingKeys: String, CodingKey {
        case trackList = "track_list"
    }
}

// MARK: - TrackList
struct TrackList: Codable {
    let track: Track
}

// MARK: - Track
struct Track: Codable ,Identifiable{
    let id: Int
    let trackName: String
    let trackRating, commontrackID, instrumental, explicit: Int
    let hasLyrics, hasSubtitles, hasRichsync, numFavourite: Int
    let albumID: Int
    let albumName: String
    let artistID: Int
    let artistName: String
    let trackShareURL, trackEditURL: String
    let restricted: Int

    enum CodingKeys: String, CodingKey {
        case id = "track_id"
        case trackName = "track_name"
        case trackRating = "track_rating"
        case commontrackID = "commontrack_id"
        case instrumental, explicit
        case hasLyrics = "has_lyrics"
        case hasSubtitles = "has_subtitles"
        case hasRichsync = "has_richsync"
        case numFavourite = "num_favourite"
        case albumID = "album_id"
        case albumName = "album_name"
        case artistID = "artist_id"
        case artistName = "artist_name"
        case trackShareURL = "track_share_url"
        case trackEditURL = "track_edit_url"
        case restricted
    }
}

// MARK: - PrimaryGenres

// MARK: - Header
struct Header: Codable {
    let statusCode: Int
    let executeTime: Double

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case executeTime = "execute_time"
    }
}

// MARK: - Encode/decode helpers
