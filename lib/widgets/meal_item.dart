import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    Key key,
    @required this.meal,
  }) : super(key: key);

  String getComplexity(){
    switch(meal.complexity){
      case Complexity.Simple : return 'Simple'; break;
      case Complexity.Challenging : return 'Challenging'; break;
      case Complexity.Hard : return 'Hard'; break;
      default : return 'Unknown'; break;
    }
  }

  String getAffordability(){
    switch(meal.affordability){
      case Affordability.Affordable : return 'Affordable'; break;
      case Affordability.Pricey : return 'Pricey'; break;
      case Affordability.Luxurious : return 'Luxurious'; break;
      default : return 'Unknown'; break;
    }
  }

  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
        MealDetailScreen.routeName,
        arguments: {
          'meal' : meal,
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    '${meal.imageUrl}',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      )
                    ),
                    child: Text(
                      '${meal.title}',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 4,),
                      Text("${meal.duration} min")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 4,),
                      Text("${getComplexity()}")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 4,),
                      Text("${getAffordability()}")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
