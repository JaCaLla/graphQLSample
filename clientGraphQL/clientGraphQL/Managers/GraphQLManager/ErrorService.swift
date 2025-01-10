//
//  Request.swift
//  clientGraphQL
//
//  Created by Javier Calatrava on 9/1/25.
//

import Foundation

enum ErrorService: Error {
    case errorResponse(Error)
    case invalidHTTPResponse
    case failedOnParsingJSON
    case noDataResponse
    case failedParallelFetching
    case fetchStopsFailed
    case badFormedURL
}




