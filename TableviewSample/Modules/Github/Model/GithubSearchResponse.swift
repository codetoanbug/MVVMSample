//
//  GithubSearchResponse.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Realm
import RealmSwift

// MARK: - GithubSearchResponse
@objcMembers class GithubSearchResponse: Object {
    dynamic var totalCount: Int?
    dynamic var incompleteResults: Bool = true
    let items = RealmSwift.List<GithubSearchItem>()

    // Custom key
    dynamic var keyword: String = ""

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        totalCount = try? container.decode(Int.self, forKey: .totalCount)
        incompleteResults = try container.decode(Bool.self, forKey: .incompleteResults)
        if let list = try? container.decode([GithubSearchItem].self, forKey: .items) {
            items.append(objectsIn: list)
        }
        super.init()
    }

    override static func primaryKey() -> String? {
        return "keyword"
    }

    required override init() {
        super.init()
    }
}

extension GithubSearchResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
@objcMembers class GithubSearchItem: Object {
    dynamic var id: Int = 0
    dynamic var name: String?
    dynamic var htmlURL: String?
    dynamic var itemDescription: String?

    override class func primaryKey() -> String? {
        return "id"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // init value object
        id = try container.decode(Int.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        htmlURL = try? container.decode(String.self, forKey: .htmlURL)
        itemDescription = try? container.decode(String.self, forKey: .itemDescription)

        // init realm
        super.init()
    }

    required override init() {
        super.init()
    }
}

extension GithubSearchItem: Codable {
    enum CodingKeys: String, CodingKey {
        case id, name
        case htmlURL = "html_url"
        case itemDescription = "description"
    }
}
