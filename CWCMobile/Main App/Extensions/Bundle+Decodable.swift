//
//  Bundle+Decodable.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 7/25/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

// swiftlint:disable all

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
