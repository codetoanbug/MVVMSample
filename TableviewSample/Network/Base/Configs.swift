//
//  Configs.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Foundation

struct Configs {
    struct Network {
        // set true for tests and generating screenshots with fastlane
        public static let useStaging = false
        #if DEBUG
        public static let baseUrl = "https://api.github.com/"
        #else
        public static let baseUrl = "https://api.github.com/"
        #endif
    }
}
