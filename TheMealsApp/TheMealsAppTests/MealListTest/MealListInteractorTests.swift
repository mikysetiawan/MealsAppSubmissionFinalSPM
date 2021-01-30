//
//  MealListInteractorTests.swift
//  TheMealsAppTests
//
//  Created by Testing on 28/01/21.
//

import XCTest
@testable import TheMealsApp

class MealListInteractorTests: XCTestCase {

    class MockInteracotr: MovieListInteractor {
        override func loadMovies(endPoint: Endpoint) {
        }
    }
    
    class MockRouter: MovieListRouting {

        var container: MovieDetailDependencyContainer = MovieDetailDependencyContainer()
        var movie: Movie?
        var sortCompletion: ((SortType) -> ())?
        var alertController: AlertController = AlertController()

        func presentSortOptions(sortCompletion: ((SortType) -> ())?) {
            self.sortCompletion = sortCompletion
        }

        func presentMovieDetailView(with movie: Movie) {
            self.movie = movie
        }
    }

}
