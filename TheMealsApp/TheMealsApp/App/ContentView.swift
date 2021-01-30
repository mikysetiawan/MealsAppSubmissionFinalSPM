//
//  ContentView.swift
//  TheMealsApp
//
//  Created by Testing on 24/09/20.
//

import SwiftUI
import Category
import Meal
import CoreModuleMealApps

struct ContentView: View {
    @EnvironmentObject var homePresenter: GetListPresenter<Any, CategoryDomainModel, Interactor<Any, [CategoryDomainModel], GetCategoriesRepository<GetCategoriesLocaleDataSource, GetCategoriesRemoteDataSource, CategoryTransformer>>>
    @EnvironmentObject var favoritePresenter: GetListPresenter<String, MealModel, Interactor<String, [MealModel], GetFavoriteMealsRepository<GetFavoriteMealsLocaleDataSource, MealsTransformer<MealTransformer<IngredientTransformer>>>>>
    @EnvironmentObject var searchPresenter: SearchPresenter<MealModel, Interactor<String, [MealModel], SearchMealsRepository<GetMealsRemoteDataSource, MealsTransformer<MealTransformer<IngredientTransformer>>>>>

  var body: some View {
    TabView {
      NavigationView {
        HomeView(presenter: homePresenter)
      }.tabItem {
        TabItem(imageName: "house", title: "Home")
      }

      NavigationView {
        SearchView(presenter: searchPresenter)
      }.tabItem {
        TabItem(imageName: "magnifyingglass", title: "Search")
      }

      NavigationView {
        FavoriteView(presenter: favoritePresenter)
      }.tabItem {
        TabItem(imageName: "heart", title: "Favorite")
      }
    }
  }
}
