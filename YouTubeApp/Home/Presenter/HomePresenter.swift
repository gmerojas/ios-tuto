//
//  HomePresenter.swift
//  YouTubeApp
//
//  Created by Gmeruvia on 27/7/24.
//

import Foundation

protocol HomeViewProtocol : AnyObject{
    func getData(list : [[Any]])
}

class HomePresenter{
    
    var provider : HomeProviderProtocol
    weak var delegate : HomeViewProtocol?
    private var objectList : [[Any]] = []
    
    init(delegate : HomeViewProtocol, provider : HomeProvider = HomeProvider()){
        self.provider = provider
        self.delegate = delegate
    }
    
    func getHomeObjects() async{
        objectList.removeAll()
        do{
            let channel = try await provider.getChannels(channelId: Constants.channelId).items
            //let playlist = try await provider.getPlaylists(channelId: Constants.channelId).items
            //let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId).items
            
            //let playlistItems = try await provider.getPlaylistItems(playlistId: playlist.first?.id ?? "").items
            
            objectList.append(channel)
            //objectList.append(playlistItems)
            //objectList.append(videos)
            //objectList.append(playlist)
            
        }catch{
            print(error)
        }
        
    }
}
