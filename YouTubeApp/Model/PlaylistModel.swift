//
//  PlaylistModel.swift
//  YouTubeApp
//
//  Created by Gmeruvia on 26/7/24.
//

import Foundation

struct PlaylistModel: Decodable {
    let kind: String
    let etag: String
    let pageInfo: PageInfo
    let items : [Item]
    
    struct Item : Decodable {
        let kind : String
        let etag : String
        let id : String
        let snippet : Snippet
        let contentDetails : ContentDetails
        
        struct Snippet : Decodable {
            let publishedAt : String
            let channelId : String
            let title :String
            let description : String
            
            let channelTitle : String
            let localized : Localized
            let thumbnails : Thumbnails
            
            struct Thumbnails : Decodable {
                let medium : Medium
                
                struct Medium : Decodable {
                    let url : String
                    let width : Int
                    let height : Int
                }
            }
            
            struct Localized : Decodable {
                let title : String
                let description : String
            }
        }
        
        struct ContentDetails : Decodable {
            let itemCount : Int
        }
    }
    
    struct PageInfo:Decodable {
        let totalResults : Int
        let resultsPerPage : Int
    }
}
