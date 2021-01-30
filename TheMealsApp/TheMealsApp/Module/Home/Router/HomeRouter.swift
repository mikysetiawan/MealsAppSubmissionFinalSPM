//
//  HomeRouter.swift
//  MealsApps
//
//  Created by Testing on 12/08/20.
//

import SwiftUI
import Category
import CoreModuleMealApps
import Meal

class HomeRouter {
    func makeDetailView(for category: CategoryDomainModel) -> some View {
        
        let useCase: Interactor<
            String,
            [MealModel],
            GetMealsRepository<
                GetMealsLocaleDataSource,
                GetMealsRemoteDataSource,
                MealsTransformer<MealTransformer<IngredientTransformer>>>
        > = Injection.init().provideMeals()
        
        let presenter = GetListPresenter(useCase: useCase)
        
        return DetailView(presenter: presenter, category: category)
    }
}
