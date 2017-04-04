import Foundation
import Vapor
//Fluent is an object relational mapping (ORM) tool built for Swift that works with a variety of different database
import Fluent


final class Person: Model {
    
    let databaseName = "persons"
    let databaseColumnNameForID = "id"
    let databaseColumnNameForName = "name"
    let databaseColumnNameForBirthDay = "gebTag"
    let databaseColumnNameForBirthMonth = "gebMonat"
    let databaseColumnNameForBirthYear = "gebJahr"

        //Vapor uses 'Node' as their Model ids. This is the datatype that they use to make lookup and look at the primary key in the DB's.
    var id:Node?
    var personID: Int
    var name: String
    var birthDay: Int
    var birthMonth: Int
    var birthYear: Int
    
    
    init(personID: Int, name: String, birthDay: Int, birthMonth: Int, birthYear: Int) {
        self.personID = personID
        self.name = name
        self.birthDay = birthDay
        self.birthMonth = birthMonth
        self.birthYear = birthYear
    }
    
    //Adding one of Vapors protocols to conform to the 'Model' object. This basically makes sure that data is mapped correctly when getting extracted from a data source such as a DB.
    init(node: Node, in context: Context) throws {
        personID = try node.extract(databaseColumnNameForID)
        name = try node.extract(databaseColumnNameForName)
        birthDay = try node.extract(databaseColumnNameForBirthDay)
        birthMonth = try node.extract(databaseColumnNameForBirthMonth)
        birthYear = try node.extract(databaseColumnNameForBirthYear)
    }
    
        //makeNode makes sure that data can be saved into the given database (this is made super dynamic)
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "\(databaseColumnNameForID)": personID,
            "\(databaseColumnNameForName)": name,
            "\(databaseColumnNameForBirthDay)": birthDay,
            "\(databaseColumnNameForBirthMonth)": birthMonth,
            "\(databaseColumnNameForBirthYear)": birthYear,
            ])
    }
}

//This is Vapor way of making migrations
extension Person: Preparation {
    static func prepare(_ database: Database) throws {
        
        try database.create("persons") { personen in
            personen.id()
            personen.string("name")
            personen.int("gebTag")
            personen.int("gebMonat")
            personen.int("gebJahr")
        }
        
    }
    static func revert(_ database: Database) throws {
        try database.delete("persons")
    }
    
}
