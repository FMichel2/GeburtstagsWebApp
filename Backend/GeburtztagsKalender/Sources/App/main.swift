import Vapor
import VaporMySQL

//The Droplet is a service container that gives you access to many of Vapor's facilities. It is responsible for registering routes, starting the server, appending middleware, and more.
let drop = Droplet()

// Add providers. This tells Vapor that we are using the VaporMySQL provider, this will bind the data to the database and the models automatically down the line
try drop.addProvider(VaporMySQL.Provider.self)
    drop.preparations.append(Person.self)


drop.get("") { request in
    return try drop.view.make("index.html")
}

//Creating a route group, in this way you won't have to add the same slugs over and over again
drop.group("api") { api in
        //Adding a sub slug to our URL and redirecting all requests to the PersonController.
    api.resource("personen", PersonController())
}

drop.run()
