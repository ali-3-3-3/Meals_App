import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitchListTile(
            filterSet: activeFilters[Filter.glutenFree]!,
            settingState: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            option: 'Gluten-free',
            detail: 'Only include gluten-free meals.',
          ),
          FilterSwitchListTile(
            filterSet: activeFilters[Filter.lactoseFree]!,
            settingState: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            option: 'Lactose-free',
            detail: 'Only include lactose-free meals.',
          ),
          FilterSwitchListTile(
            filterSet: activeFilters[Filter.vegetarian]!,
            settingState: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            option: 'Vegetarian',
            detail: 'Only include vegetarian meals.',
          ),
          FilterSwitchListTile(
            filterSet: activeFilters[Filter.vegan]!,
            settingState: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            option: 'Vegan',
            detail: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}

class FilterSwitchListTile extends StatelessWidget {
  const FilterSwitchListTile(
      {super.key,
      required this.filterSet,
      required this.settingState,
      required this.option,
      required this.detail});

  final bool filterSet;
  final void Function(bool isChecked) settingState;
  final String option;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterSet,
      onChanged: settingState,
      title: Text(
        option,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        detail,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
