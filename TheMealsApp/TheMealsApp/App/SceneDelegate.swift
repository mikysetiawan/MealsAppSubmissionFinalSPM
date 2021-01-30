//
//  SceneDelegate.swift
//  TheMealsApp
//
//  Created by Testing on 24/09/20.
//

import UIKit
import SwiftUI
import RealmSwift
import CoreModuleMealApps
import Category
import Meal

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    let injection = Injection()
    
    let categoryUseCase: Interactor<
            Any,
            [CategoryDomainModel],
            GetCategoriesRepository<
                GetCategoriesLocaleDataSource,
                GetCategoriesRemoteDataSource,
                CategoryTransformer>
        > = injection.provideCategory()
    
    let favoriteUseCase: Interactor<
        String,
        [MealModel],
        GetFavoriteMealsRepository<
            GetFavoriteMealsLocaleDataSource,
            MealsTransformer<MealTransformer<IngredientTransformer>>>
    > = injection.provideFavorite()
    
    let searchUseCase: Interactor<
        String,
        [MealModel],
        SearchMealsRepository<
            GetMealsRemoteDataSource,
            MealsTransformer<MealTransformer<IngredientTransformer>>>
    > = injection.provideSearch()

    let homePresenter = GetListPresenter(useCase: categoryUseCase)
    let favoritePresenter = GetListPresenter(useCase: favoriteUseCase)
    let searchPresenter = SearchPresenter(useCase: searchUseCase)

    let contentView = ContentView()
      .environmentObject(homePresenter)
      .environmentObject(favoritePresenter)
      .environmentObject(searchPresenter)
    
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: contentView)
      self.window = window
      window.makeKeyAndVisible()
    }
  }
  
}
