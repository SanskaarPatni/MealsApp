import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

//defaultTabController statefull widget is required!!
//Tabs need a new Screen in Flutterv
class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

//DefaultTabControllerautomatically switches between screens
class _TabsScreenState extends State<TabsScreen> {
  
  
  List<Map<String, Object>> _pages=[] ;
  //Have to use initState to initialize kyuki widget. is allowed in build bu not in any other function initially
  @override
  void initState(){
    _pages= [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavouritesScreen(widget.favouriteMeals),
      'title': 'Favourties',
    }
  ];
  super.initState();
  }
  //Tis wont be used because we need to change appBar title also
  //final List<Widget> _pages = [CategoriesScreen(), FavouritesScreen()];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        //Flutter automatically passes the index very very important
        onTap: _selectPage,
      ),
    );
  }
}
