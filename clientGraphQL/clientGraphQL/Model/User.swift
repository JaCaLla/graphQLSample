//
//  User.swift
//  clientGraphQL
//
//  Created by Javier Calatrava on 9/1/25.
//

import Foundation

// Estructura que mapea el JSON de la respuesta
struct GraphQLResponse<T: Decodable>: Decodable {
    let data: T
}

// Modelo de los datos que esperamos recibir
struct User: Decodable {
    let id: String
    let name: String
}

struct GraphQLQuery: Decodable {
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case user = "getUser"
    }
}

