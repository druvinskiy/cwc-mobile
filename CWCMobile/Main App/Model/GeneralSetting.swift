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
