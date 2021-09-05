//
//  File.swift
//  
//
//  Created by Trent Guillory on 9/5/21.
//

import Foundation

public struct ScrollViewConfiguration {
    
    public init(showStatusBar: Bool) {
        
        self.showStatusBar = showStatusBar
    }
    
    let showStatusBar: Bool
}
