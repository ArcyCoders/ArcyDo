import Vapor
import FluentProvider
import HTTP


final class List: Model {
    let storage = Storage()
    
    func makeRow() throws -> Row {
        let row = Row()
        
        return row
    }
    
    required init(row: Row) throws {
        
    }

}
