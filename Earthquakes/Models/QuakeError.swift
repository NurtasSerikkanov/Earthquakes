//
//  QuakeError.swift
//  Earthquakes
//
//

import Foundation

enum QuakeError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Found and will discard a quake missing a valid code, magnitude, place, or time.",
                comment: ""
            )
        case .networkError:
            return NSLocalizedString(
                "Unable to fetch quake data over the network.",
                comment: ""
            )
        case .unexpectedError(let error):
            return NSLocalizedString(
                "An unexpected error occured: \(error.localizedDescription)",
                comment: ""
            )
        }
    }
}
