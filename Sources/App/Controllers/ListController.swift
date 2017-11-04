import Vapor
import HTTP

final class ListController: ResourceRepresentable {
    var lists = ["foo", "bar"]
    
    // 'GET ./lists'
    func index(_ req: Request) throws -> ResponseRepresentable {
        print("\(req)")
        return lists.joined()
    }
    
    func makeResource() -> Resource<List> {
        
        return Resource(
            index: index
        )
    }
}

extension ListController: EmptyInitializable { }
