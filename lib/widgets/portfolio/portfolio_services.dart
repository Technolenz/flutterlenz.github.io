import 'package:flutterlenz_portfolio/exports.dart';

class PortfolioSec extends StatefulWidget {
  final ScrollController portfolioScrollController;
  final Function(int, double) scrollToPortfolioIndex;
  final Function(int) updateCurrentIndex;

  const PortfolioSec({
    super.key,
    required this.portfolioScrollController,
    required this.scrollToPortfolioIndex,
    required this.updateCurrentIndex,
  });

  @override
  _PortfolioSecState createState() => _PortfolioSecState();
}

class _PortfolioSecState extends State<PortfolioSec> {
  int _currentPortfolioIndex = 0;
  PortfolioCategory? selectedCategory;
  UseCase? selectedUseCase;
  TechStack? selectedTechStack;

  List<PortfolioItem> getFilteredItems() {
    return AppConstants.portfolioItems.where((item) {
      final categoryMatch = selectedCategory == null || item.category == selectedCategory;
      final useCaseMatch = selectedUseCase == null || item.useCase == selectedUseCase;
      final techStackMatch = selectedTechStack == null || item.techStack == selectedTechStack;
      return categoryMatch && useCaseMatch && techStackMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600; // Adjust breakpoint as needed

    return Container(
      color: Colors.deepPurple,
      width: double.infinity, // Take full width
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: isSmallScreen ? 10 : 20),
      child: Column(
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
              fontSize: isSmallScreen ? 28 : 36, // Smaller font for small screens
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
          ),
          SizedBox(height: 20),
          // Filter Dropdowns
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text('Filter by:', style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                // Stack dropdowns vertically on small screens
                if (isSmallScreen) ...[
                  _buildDropdown<PortfolioCategory>(
                    label: 'Category',
                    value: selectedCategory,
                    items: PortfolioCategory.values,
                    onChanged: (value) => setState(() {
                      selectedCategory = value;
                      _currentPortfolioIndex = 0;
                    }),
                  ),
                  SizedBox(height: 10),
                  _buildDropdown<UseCase>(
                    label: 'Use Case',
                    value: selectedUseCase,
                    items: UseCase.values,
                    onChanged: (value) => setState(() {
                      selectedUseCase = value;
                      _currentPortfolioIndex = 0;
                    }),
                  ),
                  SizedBox(height: 10),
                  _buildDropdown<TechStack>(
                    label: 'Tech Stack',
                    value: selectedTechStack,
                    items: TechStack.values,
                    onChanged: (value) => setState(() {
                      selectedTechStack = value;
                      _currentPortfolioIndex = 0;
                    }),
                  ),
                ] else ...[
                  // Display dropdowns in a row on larger screens
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown<PortfolioCategory>(
                          label: 'Category',
                          value: selectedCategory,
                          items: PortfolioCategory.values,
                          onChanged: (value) => setState(() {
                            selectedCategory = value;
                            _currentPortfolioIndex = 0;
                          }),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildDropdown<UseCase>(
                          label: 'Use Case',
                          value: selectedUseCase,
                          items: UseCase.values,
                          onChanged: (value) => setState(() {
                            selectedUseCase = value;
                            _currentPortfolioIndex = 0;
                          }),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildDropdown<TechStack>(
                          label: 'Tech Stack',
                          value: selectedTechStack,
                          items: TechStack.values,
                          onChanged: (value) => setState(() {
                            selectedTechStack = value;
                            _currentPortfolioIndex = 0;
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: 20),
          // Responsive card sizing
          LayoutBuilder(
            builder: (context, constraints) {
              final maxCardWidth = constraints.maxWidth > 600 ? 400.0 : constraints.maxWidth * 0.8;
              return Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      controller: widget.portfolioScrollController,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 10 : 20),
                      itemCount: getFilteredItems().length,
                      itemBuilder: (context, index) {
                        return MouseRegion(
                          onEnter: (_) {
                            setState(() => _currentPortfolioIndex = index);
                            widget.updateCurrentIndex(index);
                          },
                          child: SizedBox(
                            width: maxCardWidth,
                            child: PortfolioCard(
                              project: getFilteredItems()[index],
                              isHighlighted: index == _currentPortfolioIndex,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Page indicators
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: List.generate(
                      getFilteredItems().length,
                      (index) => GestureDetector(
                        onTap: () => widget.scrollToPortfolioIndex(index, maxCardWidth),
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _currentPortfolioIndex
                                ? Colors.orangeAccent
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required Function(T?) onChanged,
  }) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      dropdownColor: Colors.deepPurple,
      value: value,
      items: [
        DropdownMenuItem(
          value: null,
          child: Text('All', style: TextStyle(color: Colors.white)),
        ),
        ...items.map((item) => DropdownMenuItem(
              value: item,
              child: Text(
                item.toString().split('.').last,
                style: TextStyle(color: Colors.white),
              ),
            )),
      ],
      onChanged: (value) => onChanged(value),
    );
  }
}
