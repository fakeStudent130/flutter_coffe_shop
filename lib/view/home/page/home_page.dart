import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/utils/components/field/search_field.dart';
import 'package:flutter_coffee_shop/view/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../utils/components/navigation/bottom_navbar.dart';
import '../../../utils/theme/my_color.dart';
import '../widgets/by_category_widget.dart';
import '../widgets/card_promo.dart';
import '../widgets/header_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _homeProvider = HomeViewModel();
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final FocusNode _searchFocusNode = FocusNode();

  late HomeViewModel homeProvider;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeProvider.fetchAllCoffee();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 360,
              child: Stack(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 24, 24, 24),
                    height: 280,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 30, left: 30, top: 65),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const HeaderBar(
                              name: 'User Name',
                              urlProfile: 'assets/images/Image.png',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: SearchField(
                              textEditingController: _searchController,
                              hintText: 'Search coffee',
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CardPromo(),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 2),
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    buttonBuilder(const MenuByCategoryWidget(), "AII", 0),
                    const SizedBox(width: 10),
                    buttonBuilder(
                        const MenuByCategoryWidget(), "Cappuchino", 1),
                    const SizedBox(width: 10),
                    buttonBuilder(const MenuByCategoryWidget(), "Machiato", 2),
                    const SizedBox(width: 10),
                    buttonBuilder(const MenuByCategoryWidget(), "Latte", 3),
                    const SizedBox(width: 10),
                    buttonBuilder(const MenuByCategoryWidget(), "Americano", 4),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
            ),
            if (provider.selectedIndex == 0) const MenuByCategoryWidget(),
            if (provider.selectedIndex == 1) const MenuByCategoryWidget(),
            if (provider.selectedIndex == 2) const MenuByCategoryWidget(),
            if (provider.selectedIndex == 3) const MenuByCategoryWidget(),
            if (provider.selectedIndex == 4) const MenuByCategoryWidget(),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        currentIndex: 0,
      ),
    );
  }

  Widget buttonBuilder(Widget selectedButton, String title, int myIndex) {
    final homeProvider = Provider.of<HomeViewModel>(context);

    return GestureDetector(
      onTap: () async {
        homeProvider.selectedIndex = myIndex;
        _homeProvider.selectedIndex = myIndex;
        await homeProvider.getMenuByCategory(title);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: homeProvider.selectedIndex == myIndex ? kBrown : kWhite,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: Color.fromARGB(0.25.toInt(), 0, 0, 0).withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: homeProvider.selectedIndex == myIndex
                    ? kWhite
                    : const Color(0xff2F4B4E),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
