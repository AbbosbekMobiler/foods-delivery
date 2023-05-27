import 'package:flutter/material.dart';
import 'package:foods_delivery/api/model/category.dart';
import 'package:foods_delivery/api/model/for_you_model.dart';
import 'package:foods_delivery/api/networking/api_service.dart';
import 'package:foods_delivery/screens/components/by_categories_widget.dart';
import 'package:foods_delivery/screens/components/category_item_screen.dart';
import 'package:foods_delivery/screens/components/for_you_widget.dart';
import 'package:foods_delivery/screens/components/my_app_bar.dart';
import 'package:foods_delivery/screens/components/top_headline_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> _categories = [];
  List<ForYouModel> _forYouList = [];
  List<ForYouModel> _dessertList = [];
  List<ForYouModel> _byCategoryList = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData(){
    _getCategories();
    _getForYouMeals();
    _getDesserts();
    _getByCategories("Chicken");
  }

  void _getCategories() async {
    final response = await ApiService().getAllCategory();
    setState(() {
      _categories = response!.categories;
    });
  }

  void _getByCategories(String str) async {
    final response = await ApiService().getByCategories(str);
    setState(() {
      _byCategoryList = response!.meals;
    });
  }

  void _getDesserts() async {
    final response = await ApiService().getDessert();
    setState(() {
      _dessertList = response!.meals;
    });
  }

  void _getForYouMeals() async{
    final response = await ApiService().getForYou();
    setState(() {
      _forYouList = response!.meals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const MyAppBar(),
                const SizedBox(height: 24,),
                const TopHeadlineWidget(headlineName: "Categories",),
                const SizedBox(height: 12,),
                SizedBox(
                  height: 112,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final item = _categories[index];
                      return CategoryItemScreen(category: item,callback:(){
                        _byCategoryList.clear();
                        debugPrint(item.idCategory);
                        setState(() {
                          _getByCategories(item.strCategory);
                        });
                      });
                    },
                  ),
                ),
                const TopHeadlineWidget(headlineName: "For You Tasty Recipes",),
                const SizedBox(height: 12,),
                SizedBox(
                  height: 230,
                  child: ForYouWidget(lists :_forYouList),
                ),
                const TopHeadlineWidget(headlineName: "Cook like a Pro",),
                const SizedBox(height: 12,),
                SizedBox(
                  height: 230,
                  child: ForYouWidget(lists :_dessertList),
                ),
                const TopHeadlineWidget(headlineName: "ByCategories",),
                const SizedBox(height: 12,),
                ByCategoriesWidget(lists: _byCategoryList)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadData,
        child: const Icon(Icons.sync),
      ),
    );
  }
}
