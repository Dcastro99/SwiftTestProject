//
//  ForkliftChecklistInfoViewModel.swift
//  GenTest
//
//  Created by Danny Castro on 4/4/24.
//

import SwiftUI

class ForkliftChecklistInfoViewModel: ObservableObject {
    @Published var forkliftChecklistInfo = ForkliftChecklistInfo(assetNumber: "",
                                                                 inspectedDaily: false,
                                                                 hornOperational: false,
                                                                 seatbeltGood: false,
                                                                 loadCapacityChart: false,
                                                                 batteriesWatered: false,
                                                                 appearanceGood: false)
}
