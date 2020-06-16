//
//  CacheManager.swift
//  News
//
//  Created by David Ruvinskiy on 6/19/18.
//  Copyright © 2018 David Ruvinskiy. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String: Data]()
    
    static func saveImageData(_ url: String, data: Data) {
        
        //Saving the image data to our image dictionary
        imageDictionary[url] = data
    }
    
    static func retrieveImageData(_ url: String) -> Data? {
        
        //Try to retrieve the value for the key passed into this method
        return imageDictionary[url]
    }
}
