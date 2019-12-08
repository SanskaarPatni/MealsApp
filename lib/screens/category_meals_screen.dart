import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
class CategoryMealsScreen extends StatelessWidget {
  final List<Meal>availableMeals;
  CategoryMealsScreen(this.availableMeals);
  static const routeName = '/category-meals';
  //commented because not using the constructor method rather using routednames  method
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);
  @override
  Widget build(BuildContext context) {
  final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
  final categoryTitle=routeArgs['title'];
  final categoryId=routeArgs['id'];
  //Important
  final categoryMeals=availableMeals.where((meal){
    return meal.categories.contains(categoryId);
  }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(id:categoryMeals[index].id,title:categoryMeals[index].title,affordability:categoryMeals[index].affordability,complexity:categoryMeals[index].complexity,duration:categoryMeals[index].duration,imageUrl:categoryMeals[index].imageUrl);
      },
      itemCount: categoryMeals.length,

      ),
    );
  }
}
