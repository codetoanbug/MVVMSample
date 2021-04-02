//
//  GithubAPI.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Foundation
import Moya

enum GithubAPI {
    case searchRepositories(q: String, sort: String, order: String)
}

extension GithubAPI: TargetType {
    var baseURL: URL {
        let url = URL(string: Configs.Network.baseUrl)!
        return url
    }

    var path: String {
        switch self {
        case .searchRepositories:
            return "search/repositories"      
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        var dataUrl: URL?

        switch self {
        case .searchRepositories:
            if let file = Bundle.main.url(forResource: "SearchRepositoriesResponse", withExtension: "json") {
                dataUrl = file
            }
        }
        if let url = dataUrl, let data = try? Data(contentsOf: url) {
            return data
        }

        return Data()
    }

    var task: Task {
        switch self {
        case .searchRepositories:
            if let parameters = parameters {
                return .requestParameters(parameters: parameters, encoding: parameterEncoding)
            }
        }
        return .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    var parameters: [String: Any]? {
        var params: [String: Any] = [:]

        switch self {
        case .searchRepositories(let q, let sort, let order):
            params["q"] = q
            params["sort"] = sort
            params["order"] = order
        }

        return params
    }

    // For json encode. Use in post request
    var jsonEncoding: JSONEncoding {
        return JSONEncoding.default
    }

    // For param encode. Use in get request
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}
