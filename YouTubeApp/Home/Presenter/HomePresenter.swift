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
        
        async let channel = try await provider.getChannels(channelId: Constants.channelId).items
        async let playlist = try await provider.getPlaylists(channelId: Constants.channelId).items
        async let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId).items
        //async let playlistItems = try await provider.getPlaylistItems(playlistId: playlist.first?.id ?? "").items
        
        do{
            let (responseChannel, responsePlaylist, responseVideos) = await (try channel, try playlist, try videos)
            
            objectList.append(responseChannel)
            
            if let playlistId = responsePlaylist.first?.id, let playlistItems = await getPlaylistItems(playlistId: playlistId){
                
                objectList.append(playlistItems.items)
            }

            objectList.append(responseVideos)
            objectList.append(responsePlaylist)
            
            delegate?.getData(list: objectList)
            
        }catch{
            print(error)
            objectList.removeAll()
        }
        
    }
    
    func getPlaylistItems(playlistId : String) async -> PlaylistItemsModel?{
        do{
            let playlistItems = try await provider.getPlaylistItems(playlistId: playlistId)
            return playlistItems
        }catch{
            print("error: ",error)
            return nil
        }
    }
}
