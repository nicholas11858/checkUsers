//
//  User.swift
//  checkUsers
//
//  Created by NIKOLAY OSIPOV on 29.05.2021.
//
struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> [User] {
        [User(
            login: "admin",
            password: "Password",
            person: Person(
                name: "Nicholas",
                surname: "Osipov",
                gender: "Male",
                hobby: "I'm like programming and networking technologies"
            )
        )]
    }
    
    static func getEmptyUserData() -> User {
        User(
            login: "",
            password: "",
            person: Person(
                name: "",
                surname: "",
                gender: "",
                hobby: ""
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let gender: String
    let hobby: String
}
