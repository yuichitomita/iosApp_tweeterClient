//
//  TimelineParser.swift
//  sampleApp
//
//  Created by Tomi on 2017/05/27.
//  Copyright © 2017年 slj. All rights reserved.
//

import Foundation

struct TimelineParser {
    func parser(data: Data) -> [Tweet] {
        let serializedData = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        let json = serializedData as! [Any]
        
        let timeline: [Tweet] = json.flatMap {
            Tweet(json: $0)
        }
        
        return timeline
    }
}
