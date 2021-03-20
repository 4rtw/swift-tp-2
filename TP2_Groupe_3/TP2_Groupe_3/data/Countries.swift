//
//  Countries.swift
//  TP2_Groupe_3
//
//  Created by Andy Randrianirina on 20/03/2021.
//

import Foundation

extension Sequence {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        return Dictionary.init(grouping: self, by: key)
    }
}

let countries = [
    Country(isoCode: "at", name: "Austria", continent: "Europe"),
    Country(isoCode: "be", name: "Belgium", continent: "Europe"),
    Country(isoCode: "de", name: "Germany", continent: "Europe"),
    Country(isoCode: "el", name: "Greece", continent: "Europe"),
    Country(isoCode: "fr", name: "France", continent: "Europe"),
    Country(isoCode: "mg", name: "Madagascar", continent: "Afrique"),
    Country(isoCode: "af", name: "Afghanistan", continent: "Asie")
]

let countriesByContinent = countries.group(by: { $0.continent })
