//
//  BranchChecklistPage1Model.swift
//  GenTest
//
//  Created by Danny Castro on 3/28/24.
//

import SwiftUI

struct BranchChecklistPage1Model {
    //Page 1 Section 1
    var stateAndFederalLawPostersChecked = false
    var osha300AChecked = false
    var emergencyTelephoneNumbersPostedChecked = false
    var emergencyEvacuationPlanPostedChecked = false
    var numbersEmployeesNotCurrentChecked = false
    var layoutNotCurrentChecked = false
    var page1Sec1Comments = ""
    var fedPosterDate = Date()
    //Page 1 Section 2
    var page1Sec2Comments = ""
    var safetyMeetingDate = Date()
    var safetyMinuts = false
    var fallProtection = false
    var monthlySafetyMeeting = false
    var notCurrent = false
    var accidentPrevention = false
    var tmKnowWHereLocation = false
    var tmReportUnsafeConditions = false
    //Page 1 Section 3
    var k95Masks = false
    var eyeWashDate = Date()
    var frequency = 0
    var page1Sec3Comments = ""
    var firstAidkitsAreEasilyAccessible = false
    var firstAidKitsAreStocked = false
    var bloodBornePathogenKits = false
    var expiredMedication = false
    var replacementNeeded = false
    var eyewashStationPlacement = false
    var eyewashStationService = false
}

