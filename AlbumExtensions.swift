//
//  AlbumExtensions.swift
//  BlueLibrarySwift
//
//  Created by Guoliang Wang on 5/21/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//

import Foundation

extension Album {
    //ae: album extension
    func ae_tableRepresentation() -> (titles: [String], values: [String]) {
        return (["Artist", "Album", "Genre", "Year"],
        [artist, title, genre, year]
        )
    }
}