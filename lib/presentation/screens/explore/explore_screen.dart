import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:groceries_app/presentation/bloc/explore/explore_bloc.dart';
import 'package:groceries_app/presentation/bloc/explore/explore_event.dart';
import 'package:groceries_app/presentation/bloc/explore/explore_state.dart';
import 'package:groceries_app/presentation/screens/category/category_screen.dart';
import 'package:groceries_app/presentation/screens/explore/widgets/explore_category_card_widget.dart';
import 'package:groceries_app/presentation/shared/common_dialogs.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<ExploreBloc>()..add(const OnLoadCategoriesEvent()),
      child: const ExploreView(),
    );
  }
}

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<ExploreBloc>().add(
      OnSearchCategoriesEvent(_searchController.text),
    );
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<ExploreBloc>().add(const OnSearchCategoriesEvent(''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSchemes.white,
      body: BlocListener<ExploreBloc, ExploreState>(
        listener: (context, state) {
          if (state.isLoading) {
            CommonDialogs.showLoadingDialog(context);
          } else {
            CommonDialogs.hideLoadingDialog(context);
            if (state.apiErrorMessage.isNotEmpty) {
              CommonDialogs.showErrorDialog(
                context: context,
                message: state.apiErrorMessage,
                onTap: () => context.read<ExploreBloc>().add(
                  const OnClearExploreErrorMessage(),
                ),
              );
            }
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                // Header
                Center(
                  child: Text(
                    'Find Products',
                    style: AppTypography.textFont22W600.copyWith(
                      color: AppColorSchemes.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // Search Bar
                Container(
                  height: 51.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: AppColorSchemes.grey.withAlpha(38),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, size: 20, color: AppColorSchemes.grey),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search categories...',
                            hintStyle: AppTypography.textFont14W500.copyWith(
                              color: AppColorSchemes.grey,
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            // Trigger search on every text change
                            context.read<ExploreBloc>().add(
                              OnSearchCategoriesEvent(value),
                            );
                          },
                        ),
                      ),
                      BlocBuilder<ExploreBloc, ExploreState>(
                        builder: (context, state) {
                          if (state.searchQuery.isNotEmpty) {
                            return GestureDetector(
                              onTap: _clearSearch,
                              child: Icon(
                                Icons.clear,
                                size: 20,
                                color: AppColorSchemes.grey,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                // Categories Grid
                Expanded(
                  child: BlocBuilder<ExploreBloc, ExploreState>(
                    builder: (context, state) {
                      final categoriesToShow =
                          state.filteredCategories.isNotEmpty
                          ? state.filteredCategories
                          : (state.categoriesListEntity?.categories ?? []);

                      if (categoriesToShow.isEmpty &&
                          state.searchQuery.isNotEmpty) {
                        // Show "No results found" when search returns empty
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 64,
                                color: AppColorSchemes.grey,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'No categories found',
                                style: AppTypography.textFont16W500.copyWith(
                                  color: AppColorSchemes.grey,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Try searching with different keywords',
                                style: AppTypography.textFont14W500.copyWith(
                                  color: AppColorSchemes.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      if (categoriesToShow.isNotEmpty) {
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 174 / 189,
                                crossAxisSpacing: 15.w,
                                mainAxisSpacing: 15.h,
                              ),
                          itemCount: categoriesToShow.length,
                          itemBuilder: (context, index) {
                            final category = categoriesToShow[index];
                            return ExploreCategoryCardWidget(
                              categoryName: category.name,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryScreen(
                                      categoryName: category.name,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
