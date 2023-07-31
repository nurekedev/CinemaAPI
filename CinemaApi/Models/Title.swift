//
//  Tv.swift
//  CinemaApi
//
//  Created by Nurzhan Saktaganov on 30.07.2023.
//

import Foundation


struct TrendingResponse: Codable{
    let results:[Title]
}

struct Title: Codable{
    let id: Int
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let vote_average: Double?
}


/* id = 71915;
 "media_type" = tv;
 name = "Good Omens";
 "origin_country" =             (
     GB
 );
 "original_language" = en;
 "original_name" = "Good Omens";
 overview = "Aziraphale, an angel, and Crowley, a demon, join forces to find the Antichrist and stop Armageddon.";
 popularity = "189.479";
 "poster_path" = "/1ibIjP6puA4y2SfCn9icSehHrBu.jpg";
 "vote_average" = "8.005000000000001";
 "vote_count" = 1544;*/
