//
//  Extensions.swift
//  CinemaApi
//
//  Created by Nurzhan Saktaganov on 29.07.2023.
//

import Foundation

extension String {
    func capitilizedFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
