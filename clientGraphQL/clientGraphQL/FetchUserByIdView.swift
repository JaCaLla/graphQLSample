//
//  ContentView.swift
//  clientGraphQL
//
//  Created by Javier Calatrava on 9/1/25.
//

import SwiftUI

struct FetchUserByIdView: View {
    @State private var userId: String = ""
    @StateObject private var viewModel: FetchUserByIdViewModel = .init()

    var body: some View {
        VStack {
            TextField("User ID:", text: $userId)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if let user = viewModel.user {
                Text("User Name: \(user.name)")
                    .padding()
            } else if let error = viewModel.error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
            } 
            Button {
                viewModel.user = nil
                Task {
                    await viewModel.fetch(userId: userId)
                }
            } label: {
                VStack {
                    Image(systemName: "1.magnifyingglass")
                    Text("Fetch!")
                        .padding(.horizontal)
                }
                .padding()
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 25))
               
            }
        }.padding()
            .tint(Color.blue)
            .font(.title)
    }
}

#Preview {
    FetchUserByIdView()
}
