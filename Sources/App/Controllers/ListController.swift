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

    /// When the consumer calls 'GET' on a specific resource, ie:
    /// '/lists/1234' we should show that specific list
    func show(_ req: Request, list: List) throws -> ResponseRepresentable {
        return list
    }
    
    /// When the consumer calls 'DELETE' on a specific resource, ie:
    /// 'lists/l2jd9' we should remove that resource from the database
    func delete(_ req: Request, list: List) throws -> ResponseRepresentable {
        try list.delete()
        return Response(status: .ok)
    }
    
    /// When the user calls 'PATCH' on a specific resource, we should
    /// update that resource to the new values.
    func update(_ req: Request, list: List) throws -> ResponseRepresentable {
        try list.update(for: req)
        try list.save()
        return list
    }
    
    /// WTF is below?!
    func makeResource() -> Resource<List> {
        return Resource(
            index: index,
            store: store,
            show: show,
            update: update,
            destroy: delete
        )
    }
}

extension ListController: EmptyInitializable { }
