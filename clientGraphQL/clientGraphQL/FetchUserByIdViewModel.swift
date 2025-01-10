//
//  FetchUserByIdViewModel.swift
//  clientGraphQL
//
//  Created by Javier Calatrava on 9/1/25.
//

import SwiftUI

@MainActor
final class FetchUserByIdViewModel: ObservableObject {
    @Published var user: User?
    @Published var error: String?
    
    let graphQLManager = appSingletons.graphQLManager
    
    func fetch(userId: String) async {
        switch await graphQLManager.fetchData(userId: userId) {
                        case .success(let fetchedUser):
                            self.user = fetchedUser
                        case .failure(let fetchError):
                            self.error = fetchError.localizedDescription
        }
    }
}
