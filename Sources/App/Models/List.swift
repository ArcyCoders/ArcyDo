import Vapor
import FluentProvider
import HTTP


final class List: Model {
    let storage = Storage()
    var name: String
    
    struct Keys {
        static let id = "id"
        static let name = "name"
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Keys.name, name)
        return row
    }
    
    required init(row: Row) throws {
        name = try row.get(Keys.name)
    }
    
    init(name: String) {
        self.name = name
    }
}

// MARK: JSON
extension List: JSONConvertible {
    convenience init(json: JSON) throws {
        self.init(
            name: (try? json.get(List.Keys.name)) ?? "unknown"
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(List.Keys.id, id)
        try json.set(List.Keys.name, name)
        return json
    }
}

// MARK: Fluent
extension List: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Posts
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string(List.Keys.name)
        }
    }
    
    /// Undoes what was done in `prepare`
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

extension List: ResponseRepresentable { }

// MARK: Update

// This allows the List model to be updated
// dynamically by the request.
extension List: Updateable {
    // Updateable keys are called when `list.update(for: req)` is called.
    // Add as many updateable keys as you like here.
    public static var updateableKeys: [UpdateableKey<List>] {
        return [
            // If the request contains a String at key "name"
            // the setter callback will be called.
            UpdateableKey(List.Keys.name, String.self) { list, name in
                list.name = name
            }
        ]
    }
}

