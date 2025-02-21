import 'package:flutterlenz_portfolio/exports.dart';

Widget buildCategoryFilter(PortfolioCategory? selectedCategory, Function(PortfolioCategory?) onCategorySelected) {
  return Wrap(
    children: PortfolioCategory.values.map((category) {
      return FilterChip(
        label: Text(category.toString().split('.').last),
        selected: selectedCategory == category,
        onSelected: (selected) => onCategorySelected(selected ? category : null),
      );
    }).toList(),
  );
}