import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            FilterSwitchListTile(
              filterSet: _glutenFreeFilterSet,
              settingState: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              option: 'Gluten-free',
              detail: 'Only include gluten-free meals.',
            ),
            FilterSwitchListTile(
              filterSet: _lactoseFreeFilterSet,
              settingState: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              option: 'Lactose-free',
              detail: 'Only include lactose-free meals.',
            ),
            FilterSwitchListTile(
              filterSet: _vegetarianFilterSet,
              settingState: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              option: 'Vegetarian',
              detail: 'Only include vegetarian meals.',
            ),
            FilterSwitchListTile(
              filterSet: _veganFilterSet,
              settingState: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              option: 'Vegan',
              detail: 'Only include vegan meals.',
            ),
          ],
        ),
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
