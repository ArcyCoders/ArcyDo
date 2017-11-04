import Vapor
import HTTP

final class ListController: ResourceRepresentable {
    var lists = ["foo", "bar"]
    var counter = 0
    
    // 'GET ./lists'
    func index(_ req: Request) throws -> ResponseRepresentable {
        let list = List(name: "List_\(counter)")
        counter+=1
        
        try list.save()
        return try List.all().makeJSON()
    }
    
    func makeResource() -> Resource<List> {
        return Resource(
            index: index
        )
    }
}

extension ListController: EmptyInitializable { }
