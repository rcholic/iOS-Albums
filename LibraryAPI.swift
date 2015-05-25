//
//  LibraryAPI.swift
//  BlueLibrarySwift
//
//  Created by Guoliang Wang on 5/19/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    private let persistencyManager: PersistencyManager
    private let httpClient: HTTPClient
    private let isOnline: Bool
    
    override init() {
        persistencyManager = PersistencyManager()
        httpClient = HTTPClient()
        isOnline = false
        
        super.init()
    }
    
    func getAlbums() -> [Album] {
        return persistencyManager.getAlbums()
    }
    
    func addAlbum(album: Album, index: Int) {
        persistencyManager.addAlbum(album, index: index)
        
        if isOnline {
            httpClient.postRequest("/api/addAlbum", body: album.description)
        }
    }
    
    func deleteAlbum(index: Int) {
        persistencyManager.deleteAlbumAtIndex(index)
        if isOnline {
            httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }
    }
    
    //class variable as a computed type property
    class var sharedInstance: LibraryAPI {
        //struct
        struct Singleton {
            //static constant variable - exists only once
            static let instance = LibraryAPI()
        }
        //singleton design pattern
        return Singleton.instance
    }
   
}
