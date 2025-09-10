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

- **Widget Refactor:** Clean and unify card & chart widgets, main widgets (appbar, navbar, snackbar).
- **Page Refactor:** Optimize all pages, improve navigation & async handling.
- **Main Page:** Animated transitions, responsive navigation.
- **Bug Fixes:** Mounted checks, async DB query optimizations.
- **Docs:** Updated README, structured commits, prepared for backup.

## Example Commit History

- 💄 UI: Update snackbar for consistency  
- ✨ Feature: Add history, credit card CRUD, charts, settings  
- 🐛 Fix: Database, income model, build errors, async setState  
- ♻️ Refactor: Structure, naming, theme, widget/page cleaning  
- 🔧 Chore: Upgrade Gradle, dependencies, Android config  

## Next Steps

- Finalize export to PDF  
- Polish snackbar (default theme colors)  
- Document code for future contributors  

---

## 📦 Project Status
All main features and UI/UX are implemented, refactored, and stable.  
**Version: `1.0.0+1` — First stable release with APK & AAB build ready.**  

---

## 💖 Support & Sponsor

Jika kamu merasa project ini bermanfaat, kamu bisa mendukungku di GitHub Sponsors:  

[![Sponsor](https://img.shields.io/badge/Sponsor-TEUNGKU--ZULKIFLI-pink?logo=github-sponsors&style=for-the-badge)](https://github.com/sponsors/TEUNGKU-ZULKIFLI)
