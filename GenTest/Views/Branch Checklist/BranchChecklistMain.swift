//
//  BranchChecklistMain.swift
//  GenTest
//
//  Created by Danny Castro on 3/27/24.
//

import SwiftUI

struct BranchChecklistMain: View {
    @State private var currentPage: Int = 0
    @State private var branchChecklistPage1Model = BranchChecklistPage1Model()
    @State private var branchChecklistPage2Model = BranchChecklistPage2Model()
    @State private var branchChecklistPage3Model = BranchChecklistPage3Model()
    @State private var branchChecklistPage4Model = BranchChecklistPage4Model()
    @State private var branchChecklistPage5Model = BranchChecklistPage5Model()
    @State private var branchChecklistPage6Model = BranchChecklistPage6Model()
    @State private var branchChecklistPage7Model = BranchChecklistPage7Model()
    @State private var branchChecklistPage8Model = BranchChecklistPage8Model(
        //--------------------FORKLIFTS---------------------//
        selectedForklift: ForkliftChecklistInfo(assetNumber: "", inspectedDaily: false, hornOperational: false, seatbeltGood: false, loadCapacityChart: false, batteriesWatered: false, appearanceGood: false),
        //---------------------PICKERS--------------------//
        selectedPicker: PickerChecklistInfo(assetNumber: "", inspectedDaily: false, hornOperational: false, laynardGood: false, loadCapacityChart: false, batteriesWatered: false, appearanceGood: false),
        //-----------------OTHER EQUIPMENT-------------------//
        selectedEquipment: OtherEquipChecklistInfo(assetNumber: "", inspectedRegularly: false, maintainedRegularly: false, appearanceGood: false),
        //----------------DELIVERY VEHICLES------------------//
        selectedDV: DeliveryVehiclesChecklistInfo(assetNumber: "", exteriorGood: false, windShieldGoodCondition: false, slipResistant: false, wideTurnStickers: false, interiorGood: false, registrationCurrent: false, insuranceCurrent: false, dotUAFormL: false, truckHeightSticker: false, phoneMount: false, dashCamConnected: false, cellControlPresent: false, buckledStorage: false, resQmeTool: false, preTripCompleted: false, hoursLoggedManually: false, hoursLoggedELD: false, fireExtinguisher: false, firstAidKit: false, bloodBorneKit: false, roadsidereflectors: false, hardHat: false, reflectiveVest: false))

   
    var body: some View {
        ScrollView{
            ScrollViewReader{ scrollView in
                VStack{
                    
                    if currentPage == 0 {
                        
                        BCPageOne(currentPage: $currentPage, branchChecklistPage1Model: $branchChecklistPage1Model).id(0)
                        
                    } else if currentPage == 1 {
                        BCPageTwo(currentPage: $currentPage, branchChecklistPage2Model: $branchChecklistPage2Model).id(1)
                    } else if currentPage == 2 {
                        BCPageThree(currentPage: $currentPage,branchChecklistPage3Model: $branchChecklistPage3Model).id(2)
                    } else if currentPage == 3 {
                        BCPageFour(currentPage: $currentPage, branchChecklistPage4Model: $branchChecklistPage4Model).id(3)
                    } else if currentPage == 4 {
                        BCPageFive(currentPage: $currentPage, branchChecklistPage5Model: $branchChecklistPage5Model ).id(4)
                    } else if currentPage == 5 {
                        BCPageSix(currentPage: $currentPage, branchChecklistPage6Model:$branchChecklistPage6Model).id(5)
                    }else if currentPage == 6 {
                        BCPageSeven(currentPage: $currentPage, branchChecklistPage7Model:$branchChecklistPage7Model).id(6)
                    }else if currentPage == 7 {
                        BCPageEight(currentPage: $currentPage, branchChecklistPage8Model:$branchChecklistPage8Model).id(7)
                        
                    }
                    else {
                        Text("Branch Checklist Main Page")
                    }
                    
                }
                .onChange(of: currentPage) {_ in
                    withAnimation(.easeInOut(duration: 10)){
                        if currentPage == 0 {
                            scrollView.scrollTo(0, anchor: .top)
                        } else if currentPage == 1 {
                            scrollView.scrollTo(1, anchor: .top)
                        } else if currentPage == 2 {
                            scrollView.scrollTo(2, anchor: .top)
                        } else if currentPage == 3 {
                            scrollView.scrollTo(3, anchor: .top)
                        } else if currentPage == 4 {
                            scrollView.scrollTo(4, anchor: .top)
                        } else if currentPage == 5 {
                            scrollView.scrollTo(5, anchor: .top)
                        } else if currentPage == 6 {
                            scrollView.scrollTo(6, anchor: .top)
                        }else if currentPage == 7 {
                            scrollView.scrollTo(7, anchor: .top)
                        }
                        
                    }
                }
                
            }
        }

    }
}

#Preview {
    BranchChecklistMain()
}
