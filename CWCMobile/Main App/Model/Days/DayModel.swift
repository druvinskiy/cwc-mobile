//
//  DayModel.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/22/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

protocol DayProtocol: AnyObject {
    func daysRetrieved(days: [Day])
}

class DayModel {
    weak var delegate: DayProtocol?
    
    func loadDays() {
        getRemoteJSONFile()
    }
    
    private func getLocalJSONFile() {
        let result = JSONService.shared.decode("days.json") as DayData
        let days = result.days.map({ Day(day: $0) })
        
        delegate?.daysRetrieved(days: days)
    }
    
    private func getRemoteJSONFile() {
        JSONService.shared.fetchGenericJSONData(urlString: "https://codewithchris.com/cwcmobile/days.json") { (result: DayData?, error) in
            
            if error != nil {
                self.getLocalJSONFile()
                return
            }
            
            guard let result = result else {
                self.getLocalJSONFile()
                return
            }
            
            let days = result.days.map({ Day(day: $0) })
            self.delegate?.daysRetrieved(days: days)
        }
    }
}
