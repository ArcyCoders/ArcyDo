import Vapor
import HTTP

final class ListController: ResourceRepresentable {
    
    /// When users call 'GET' on '/lists'
    /// it should return an index of all available lists
    func index(_ req: Request) throws -> ResponseRepresentable {
        return try List.all().makeJSON()
    }
    
    
    /// When consumers call 'POST' on '/lists' with valid JSON
    /// construct and save the list
    func store(_ req: Request) throws -> ResponseRepresentable {
        guard let json = req.json else { throw Abort.badRequest }
        let list = try List(json: json)
        try list.save()
        return list
    }

    /// WTF is below?!
    func makeResource() -> Resource<List> {
        return Resource(
            index: index,
            store: store
        )
    }
}

extension ListController: EmptyInitializable { }
