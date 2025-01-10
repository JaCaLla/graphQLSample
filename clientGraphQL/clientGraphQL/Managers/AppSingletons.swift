//
//  AppSingletons.swift
//  LocationSampleApp
//
//  Created by Javier Calatrava on 1/12/24.
//

import Foundation

@MainActor
struct AppSingletons {
    var graphQLManager: GraphQLManager
    
    init(graphQLManager: GraphQLManager = GraphQLManager.shared) {
        self.graphQLManager = graphQLManager
    }
}

@MainActor var appSingletons = AppSingletons()
