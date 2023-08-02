//
//  YouTubeSearchResponse.swift
//  CinemaApi
//
//  Created by Nurzhan Saktaganov on 01.08.2023.
//

import Foundation



struct Item: Codable {
    let kind: String
    let videoId: String
}

struct VideElems: Codable {
    let id: Item
}

struct YouTubeSearchResponse: Codable{
    let items: [VideElems]
}


/*    items =     (
 {
etag = "uV2UPJ8N2E9z5D8UpJy-XE1zQCM";
id =             {
 kind = "youtube#video";
 videoId = 5Np8vUzHrpA;
};
kind = "youtube#searchResult";
},*/
