import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }
        get("description") { req in return req.description }
        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }
        
        let api = grouped("api")
        try api.resource("posts", PostController.self)
        try api.resource("lists", ListController.self)
    }
}
