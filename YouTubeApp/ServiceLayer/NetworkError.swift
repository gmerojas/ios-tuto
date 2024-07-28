//
//  NetworkError.swift
//  YouTubeApp
//
//  Created by Gmeruvia on 27/7/24.
//

import Foundation

enum NetworkError : String, Error {
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "ocurrio un error al tratar de consultar el API: status code"
    case jsonDecoder = "Error al intentar extraer datos de JSON."
    case unauthorized
}
