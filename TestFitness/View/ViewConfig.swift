//
//  ViewConfig.swift
//  FitnessEMS
//
//  Created by Ruslan Dalgatov on 11.10.2022.
//

import Foundation

protocol ViewConfig {
    var name: String { get }
    var minValue: Int { get }
    var maxValue: Int { get }
    var measurementUnits: String { get }
    var currentValue: Int? { get set }
}

struct SliderViewConfig: ViewConfig {
    var name: String
    var minValue: Int
    var maxValue: Int
    var measurementUnits: String
    var currentValue: Int?
}

struct ChannelViewConfig: ViewConfig {
    var name: String
    var minValue: Int
    var maxValue: Int
    var measurementUnits: String
    var currentValue: Int? = nil
}
