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

- `lib/pages/` — Main app pages (input, card, chart, history, setting, home)
- `lib/models/` — Data models (expense, income, balance, equity, credit card, history)
- `lib/services/` — Database service (SQFlite) for all CRUD operations
- `lib/widgets/` — Reusable widgets (snackbar, appbar, navbar, cards, charts)
- `lib/utils/` — Utility functions (currency, chart sorting)
- `lib/theme.dart` — Custom theme and color scheme

## Development Log

- **UI/UX**: Major refresh for all pages, unify colors, improve stepper input, and snackbar consistency.
- **Database**: Switch from dev to production, stabilize tables, optimize queries.
- **Features**: Add history table/model, credit card CRUD, input validation, equity calculation, export/delete all data.
- **Internationalization**: All menus and texts switched to English.
- **Assets**: Add bank logos, developer info, and update pubspec.
- **Refactor**: Rename files/models for clarity, restructure widgets, optimize code.
- **Chore**: Upgrade dependencies, fix build issues, support Android.

## Example Commit History

- 💄 UI: Update snackbar for consistency
- ✨ Feature: Add history, credit card CRUD, charts, settings
- 🐛 Fix: Database, income model, build errors
- ♻️ Refactor: Structure, naming, theme
- 🔧 Chore: Upgrade Gradle, dependencies, Android config

## Next Steps

- Finalize export to PDF
- Polish custom snackbar or switch fully to Flutter's native snackbar with theme colors
- Document code and usage for future development

---

**Project status:**  
All main features and UI/UX are implemented and stable.  
Ready for backup, documentation, and further development after system reinstall.
