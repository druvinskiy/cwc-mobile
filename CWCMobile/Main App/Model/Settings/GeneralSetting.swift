//
//  GeneralSetting.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/22/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class GeneralSetting {
    let description: String
    
    init(description: String) {
        self.description = description
    }
}

class SwitchSetting: GeneralSetting {
    var isOn: Bool
    
    init(description: String, isOn: Bool) {
        self.isOn = isOn
        
        super.init(description: description)
    }
}

class ImageSetting: GeneralSetting {
    let image: UIImage
    
    init(description: String, image: UIImage) {
        self.image = image
        
        super.init(description: description)
    }
}

class URLImageSetting: ImageSetting {
    let url: URL?
    
    init(description: String, image: UIImage, url: URL?) {
        self.url = url
        
        super.init(description: description, image: image)
    }
}

class SocialSetting: ImageSetting {
    fileprivate let socialNetworkUrl: SocialNetworkUrl
    
    init(description: String, image: UIImage, socialNetworkUrl: SocialNetworkUrl) {
        self.socialNetworkUrl = socialNetworkUrl
        
        super.init(description: description, image: image)
    }
    
    func openPage() {
        socialNetworkUrl.openPage()
    }
}
