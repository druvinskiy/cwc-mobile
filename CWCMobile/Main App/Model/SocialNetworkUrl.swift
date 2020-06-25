//
//  SocialNetworkUrl.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/25/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

struct SocialNetworkUrl {
    let scheme: String
    let page: String

    func openPage() {
        if let schemeUrl = URL(string: scheme), UIApplication.shared.canOpenURL(schemeUrl) {
            UIApplication.shared.open(schemeUrl)
        } else {
            guard let url = URL(string: page) else { return }
            UIApplication.shared.open(url)
        }
    }
}
