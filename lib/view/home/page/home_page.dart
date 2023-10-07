import 'package:flutter/material.dart';
// import 'package:flutter_coffee_shop/presentation/pages/menu_detail.dart';
import 'package:flutter_coffee_shop/utils/components/buttons/primary_button.dart';
import 'package:flutter_coffee_shop/utils/components/field/search_field.dart';
import 'package:flutter_coffee_shop/utils/state/finite_state.dart';
import 'package:flutter_coffee_shop/view/home/page/menu_detail.dart';
import 'package:flutter_coffee_shop/view/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/components/navigation/bottom_navbar.dart';
import '../widgets/card_menu.dart';
import '../widgets/card_promo.dart';
import '../widgets/header_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    // final provider = Provider.of<HomeViewModel>(context, listen: false);

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
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 30),
                  PrimaryButton(
                    teks: 'Cappuccino',
                    customWidth: 150,
                    customHeight: 50,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  PrimaryButton(
                    teks: 'Machiato',
                    customWidth: 125,
                    customHeight: 50,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  PrimaryButton(
                    teks: 'Latte',
                    customWidth: 90,
                    customHeight: 50,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  PrimaryButton(
                    teks: 'Arabica',
                    customWidth: 115,
                    customHeight: 50,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),
            Consumer<HomeViewModel>(
              builder: (context, value, child) {
                if (value.state == MyState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (value.state == MyState.loaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: GridView.builder(
                      itemCount: homeProvider.coffeeList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        final coffee = homeProvider.coffeeList[index];
                        return CardMenu(
                          menu: coffee.menu ?? 'default menu',
                          rating: coffee.rating ?? 0.0,
                          category: coffee.category ?? 'default category',
                          reviewer: coffee.reviewer ?? '000',
                          price: coffee.price!.toDouble(),
                          imageUrl: coffee.imgUrl ?? '',
                          onPressedCard: () {
                            Navigator.pushNamed(
                              context,
                              MenuDetailPage.routeName,
                              arguments: coffee,
                            );
                          },
                          onPressedIcon: () {
                            //! buat disini untuk menambahkan item ke cart
                          },
                        );
                      },
                    ),
                  );
                } else if (value.state == MyState.failed) {
                  return Center(
                    child: Image.asset(
                      'assets/images/404-error.png',
                      width: 200,
                      height: 200,
                    ),
                  );
                } else {
                  return Center(
                    child: Image.asset(
                      'assets/images/404-error.png',
                      width: 200,
                      height: 200,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        currentIndex: 0,
      ),
    );
  }
}
