//
//  BranchChecklistPage8Model.swift
//  GenTest
//
//  Created by Danny Castro on 4/3/24.
//

import SwiftUI

struct BranchChecklistPage8Model {
    //Page 8 Section 1
    var operatorsCertified = false
    var fallProtection = false
    var dailyChecklist = false
    var batteriesCharged = false
    var spillKitAvailable = false
    var page8sec1Comments = ""
    //Page 8 Section 2
    var isAddingForklift = false
    var inspectedDaily = false
    var hornOperational = false
    var seatbeltGood = false
    var loadCapacityChart = false
    var batteriesWatered = false
    var appearanceGood = false
    var viewForkliftInfo = false
    var newForkliftNumber = ""
    var selectedForklift: ForkliftChecklistInfo
    var forkliftList: [ForkliftChecklistInfo] = []
    //Page 8 Section 3
    var isAddingPicker = false
    var viewPickerInfo = false
    var laynardGood = false
    var newPickerNumber = ""
    var selectedPicker: PickerChecklistInfo
    var pickerList: [PickerChecklistInfo] = []
    //Page 8 Section 4
    var isAddingOtherEquip = false
    var viewOtherEquipInfo = false
    var inspectedRegularly = false
    var maintainedRegularly = false
    var newEquipNumber = ""
    var selectedEquipment: OtherEquipChecklistInfo
    var otherEquipList: [OtherEquipChecklistInfo] = []
    
    //Page 8 Section 5
    var isAddingDV = false
    var viewDVInfo = false
    var exteriorGood = false
    var windShieldGoodCondition = false
    var slipResistant = false
    var wideTurnStickers = false
    var interiorGood = false
    var registrationCurrent = false
    var insuranceCurrent = false
    var dotUAFormL = false
    var truckHeightSticker = false
    var phoneMount = false
    var dashCamConnected = false
    var cellControlPresent = false
    var buckledStorage = false
    var resQmeTool = false
    var preTripCompleted = false
    var hoursLoggedManually = false
    var hoursLoggedELD = false
    var fireExtinguisher = false
    var firstAidKit = false
    var bloodBorneKit = false
    var roadsidereflectors = false
    var hardHat = false
    var reflectiveVest = false
    var newDeliveryVehicleNumber = ""
    var selectedDV: DeliveryVehiclesChecklistInfo
    var DVList: [DeliveryVehiclesChecklistInfo] = []
    var page8sec5Comments = ""
    
}
