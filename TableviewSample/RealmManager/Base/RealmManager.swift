//
//  RealmManager.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/05/05.
//

import Realm
import RealmSwift

/// Version realm database
enum RealmVersion: UInt64 {
    case version1 = 0
}

protocol RealmRepresentable: Object {
    var uid: String { get }
}

/// Realm service protocol
protocol RealmServiceProtocol {
    associatedtype Entity

    func queryAll() -> [Entity]
    func query(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> [Entity]

    func save(entity: Entity) -> Bool
    func save(entities: [Entity]) -> Bool

    func delete(entity: Entity) -> Bool
    func delete(entities: [Entity]) -> Bool
    func deleteAll() -> Bool
}

/// Base realm service
class RealmManager<T: RealmRepresentable>: RealmServiceProtocol {
    typealias Entity = T

    private let configuration: Realm.Configuration

    private var realm: Realm? {
        return try? Realm(configuration: self.configuration)
    }

    /// Init realm config and realm
    init() {
        // Config
        self.configuration = Realm.Configuration(
            schemaVersion: RealmVersion.version1.rawValue,
            migrationBlock: { (migration, oldVersion) in
                guard let oldVersionQuickGooco = RealmVersion(rawValue: oldVersion) else {
                    return
                }

                migration.enumerateObjects(ofType: "") { (_, _) in
                    if oldVersionQuickGooco == .version1 {

                    }
                }
            }
        )
        // Local of file realm
        print("File 📁 url: \(RLMRealmPathForFile("default.realm"))")
    }

    /// Query all entity
    /// - Returns: list entity
    func queryAll() -> [Entity] {
        guard let realm = self.realm else {
            return []
        }
        let objects = realm.objects(Entity.self)
        return Array(objects)
    }

    /// Query with condititon
    /// - Parameters:
    ///   - predicate: predicate
    ///   - sortDescriptors: sort descriptor list
    /// - Returns: list result
    func query(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> [Entity] {
        guard let realm = self.realm else {
            return []
        }
        let objects = realm.objects(Entity.self).filter(predicate)
        return Array(objects)
    }

    /// Save 1 entity
    /// - Parameter entity: entity to save
    /// - Returns: success or no
    func save(entity: Entity) -> Bool {
        guard let realm = self.realm else {
            return false
        }

        do {
            try realm.write {
                realm.add(entity, update: .all)
                realm.refresh()
            }
            return true
        } catch {
            print("save \(entity) eror")
            return false
        }
    }

    /// Save list entities
    /// - Parameter entities: list entities
    /// - Returns: success or no
    func save(entities: [Entity]) -> Bool {
        guard let realm = self.realm else {
            return false
        }

        let entitiesAsRealm = entities.map({ $0 })
        do {
            try realm.write {
                realm.add(entitiesAsRealm, update: .all)
                realm.refresh()
            }
            return true
        } catch {
            print("save \(entities) eror")
            return false
        }
    }

    /// Delete 1 entity
    /// - Parameter entity: entity
    /// - Returns: success or no
    func delete(entity: Entity) -> Bool {
        guard let realm = self.realm else {
            return false
        }

        do {
            guard let object = realm.object(ofType: Object.self, forPrimaryKey: entity.uid) else {
                return false
            }

            try realm.write {
                realm.delete(object)
                realm.refresh()
            }
            return true
        } catch {
            print("delete \(entity) eror")
            return false
        }
    }

    /// Delete list entities
    /// - Parameter entities: list entities
    /// - Returns: success or no
    func delete(entities: [Entity]) -> Bool {
        guard let realm = self.realm else {
            return false
        }

        let objects = realm.objects(Entity.self).filter { (object) -> Bool in
            return entities.contains(where: { (entity) -> Bool in
                return entity.uid == object.uid
            })
        }

        do {
            try realm.write {
                realm.delete(objects)
                realm.refresh()
            }
            return true
        } catch {
            print("delete \(entities) eror")
            return false
        }
    }

    /// Delete all
    /// - Returns: success or no
    func deleteAll() -> Bool {
        guard let realm = self.realm else {
            return false
        }

        do {
            try realm.write {
                realm.delete(realm.objects(Entity.self))
                realm.refresh()
            }
            return true
        } catch {
            print("deleteAll eror")
            return false
        }
    }
}


