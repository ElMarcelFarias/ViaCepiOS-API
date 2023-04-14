//
//  Cep.swift
//  apiViaCep
//
//  Created by Marcel Leite de Farias on 13/04/23.
//

import Foundation

struct CepModel: Codable {
    let cep: String
    let logradouro: String
    let complemento: String
    let bairro: String
    let localidade: String
    let uf: String
    let ddd: String
}
