# finance_tracker

A personal finance tracker app built with Flutter.  
This project helps users record daily expenses/income, manage credit cards, view history, and analyze financial data with charts.

## Features

- **Input Data**: Stepper form for daily expense & income, with currency formatting and validation.
- **Credit Card Management**: CRUD for credit cards, select bank brand, custom card widget.
- **History**: View all user actions (input, card CRUD), sortable by date/name/type, delete all history.
- **Charts**: Weekly and donut charts for financial analysis.
- **Settings**: Export to PDF (WIP), delete all input data, about page, version info, learning tutorials.
- **Custom Theme**: Unified color scheme for expense/income/success/error, supports dark mode.
- **Snackbar**: Consistent feedback for actions (success/error) across all pages.
- **Navigation**: Custom AppBar and NavigationBar for easy access to all features.

## Project Structure

- `lib/pages/` — Main app pages (input, card, chart, history, setting, home, main)
- `lib/models/` — Data models (expense, income, balance, equity, credit card, history)
- `lib/services/` — Database service (SQFlite) for all CRUD operations
- `lib/widgets/` — Reusable widgets (snackbar, appbar, navbar, cards, charts)
- `lib/utils/` — Utility functions (currency, chart sorting)
- `lib/theme.dart` — Custom theme and color scheme

## Maintenance & Refactor Log (Pre-OS Reinstall)

- **Widget Refactor:**  
  - Clean and unify all card & chart widgets (`card_balance`, `card_credits`, `chart_pie`, `chart_weekly`)
  - Refactor main widgets (`appbar`, `navbar`, `snackbar`) for consistent style and theme usage
- **Page Refactor:**  
  - Clean and optimize all main pages (`home_page`, `chart_page`, `input_page`, `card_page`, `history_page`, `setting_page`)
  - Add loading indicators, error handling, and mounted checks for async operations
  - Improve navigation and state management for smooth UX
- **Main Page Optimization:**  
  - Refactor `main_page.dart` for animated transitions and responsive navigation
  - Ensure all navigation and async calls are safe and efficient
- **Bug Fixes & Best Practices:**  
  - Fix setState after dispose errors with mounted checks
  - Optimize async database queries and UI responsiveness
  - Clean up unused code, improve naming, and add comments for maintainability
- **Documentation:**  
  - Update README with latest structure, features, and maintenance log
  - Prepare for backup and future development after system reinstall

## Example Commit History

- 💄 UI: Update snackbar for consistency
- ✨ Feature: Add history, credit card CRUD, charts, settings
- 🐛 Fix: Database, income model, build errors, async setState
- ♻️ Refactor: Structure, naming, theme, widget/page cleaning
- 🔧 Chore: Upgrade Gradle, dependencies, Android config

## Next Steps

- Finalize export to PDF
- Polish custom snackbar or switch fully to Flutter's native snackbar with theme colors
- Document code and usage for future development

---

**Project status:**  
All main features and UI/UX are implemented, refactored, and stable.  
Ready for backup, documentation, and further development after system reinstall.