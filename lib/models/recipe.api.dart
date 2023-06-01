import 'dart:convert';
import 'package:recetas_caseras/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{

    static Future<List<Recipe>> getRecipe() async{
      
      var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

      final response = await http.get(uri, headers: {
        	"X-RapidAPI-Key": "2924d3e9cemshff3db77af669340p1fe047jsn810a85cec0d4",
	        "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
          "useQueryString": "true"        
      }
      );
      Map data=jsonDecode(response.body);
      List _temp =[];

      for (var i in data['feed']){
        _temp.add(i['content']['details']);
      }
      return Recipe.recipesFromSnapshot(_temp);
    }

}