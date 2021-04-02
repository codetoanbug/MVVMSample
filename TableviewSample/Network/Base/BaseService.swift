//
//  BaseService.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Foundation

class BaseService {
    var provider: NetworkProvider!

    public init(isTest: Bool = false) {
        provider = isTest ? NetworkProvider.stubbingNetworking() : NetworkProvider.defaultNetworking()
    }
}
