//
//  TheMealDBTests.swift
//  TheMealDBTests
//
//  Created by Madison Perniciaro on 11/11/23.
//

import XCTest
@testable import TheMealDB

class TheMealDBTests: XCTestCase {

    func testFetchRecipe() throws {
        Service.service.fetchRecipe(id: "52894") { (meals, err) in
            if let err = err {
                print("Failed to fetch recipe:", err)
                return
            }
            let recipe = meals?[0].strMeal
            XCTAssertEqual(recipe, "Bateenberg Cake")
        }
    }
    
    func testFetchDesserts() throws {
        Service.service.fetchDesserts() { (meals, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            let recipe = meals?[0].title
            XCTAssertEqual(recipe, "Apam balik")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
