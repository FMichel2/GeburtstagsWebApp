import Vapor
import HTTP
import Foundation

final class PersonController: ResourceRepresentable {
    
    //This will get called if the index in 'makeResource()' below will be called.
    func index(request: Request) throws -> ResponseRepresentable {
        
        return try Person.all().makeNode().converted(to: JSON.self)
    }
    
    //This is where the 'post' request gets redirected to
    //Create a person and add it to the Database
    func create(request: Request) throws -> ResponseRepresentable {
        
        let id = 0
        
        //Throw a Abort response, using the custom status to make sure the frontends have the correct message and response code
        guard let name = request.data["name"]?.string else {

            throw Abort.custom(status: Status.preconditionFailed, message: "Missing name")
        }
        guard let birthDay = request.data["birthDay"]?.int else {
            throw Abort.custom(status: Status.preconditionFailed, message: "Missing Day of Birth")
        }
        guard let birthMonth = request.data["birthMonth"]?.int else {
            throw Abort.custom(status: Status.preconditionFailed, message: "Missing Month of Birth")
        }
        guard let birthYear = request.data["birthYear"]?.int else {
            throw Abort.custom(status: Status.preconditionFailed, message: "Missing Year of Birth")
        }
        
        var person = Person(personID: id, name: name, birthDay: birthDay, birthMonth: birthMonth, birthYear: birthYear)
        
        //Add it to our Database
        try person.save()
        return try drop.view.make("index.html")
    }
    
    //This is the function the figure out what method that should be called depending on the HTTP request type.
    //Add the store: create to tell Vapor that if a 'post' http requst comes in to redirect it there.
    func makeResource() -> Resource<Person> {
        return Resource(
            index: index,
            store: create
        )
    }
}
