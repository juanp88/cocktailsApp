import 'package:cocktails_app/config/api_constants.dart';
import 'package:cocktails_app/presentation/widgets/grid_view.dart';
import 'package:cocktails_app/presentation/widgets/drink_list_header.dart';
import 'package:cocktails_app/presentation/widgets/drink_stats_section.dart';
import 'package:cocktails_app/presentation/widgets/error_state_widget.dart';
import 'package:cocktails_app/presentation/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/drink_entity.dart';
import '../controllers/ordinary_controller.dart';
import '../../config/app_constants.dart';

final drinkListFutureProvider =
    FutureProvider.autoDispose<List<DrinkEntity>>((ref) async {
  final listControllerProvider = ref.watch(ordinaryDrinksControllerProvider);
  return listControllerProvider.getDrinks(ApiConstants.cocktailEndpoint);
});

class CocktailsPage extends ConsumerStatefulWidget {
  const CocktailsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CocktailsPageState();
}

class _CocktailsPageState extends ConsumerState<CocktailsPage> {
  @override
  Widget build(BuildContext context) {
    final drinkListRef = ref.watch(drinkListFutureProvider);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primary,
              accent,
              const Color.fromARGB(255, 20, 20, 30),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom Header
              DrinkListHeader(
                title: 'Cocktails',
                subtitle: 'Premium cocktails & mixed drinks',
                icon: Icons.local_bar,
                iconColor: Colors.pink,
                onBackPressed: () => Navigator.pop(context),
              ),

              // Content
              Expanded(
                child: drinkListRef.when(
                  data: (data) {
                    return Column(
                      children: [
                        // Stats Section
                        DrinkStatsSection(
                          count: data.length,
                          drinkType: 'cocktails',
                          accentColor: Colors.pink,
                        ),

                        // Grid View
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GridViewList(data),
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error, _) {
                    return ErrorStateWidget(
                      title: 'Oops! Something went wrong',
                      subtitle: 'Unable to load cocktails',
                      buttonColor: Colors.pink,
                      onRetry: () => setState(() {}),
                    );
                  },
                  loading: () {
                    return LoadingStateWidget(
                      message: 'Loading cocktails...',
                      accentColor: Colors.pink,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
