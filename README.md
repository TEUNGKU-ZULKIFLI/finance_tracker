<a href="https://teungku-zulkifli.github.io/">
  <h1 align="center">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/TEUNGKU-ZULKIFLI/finance_tracker/master/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png">
      <img alt="Apok FinTrack" src="https://raw.githubusercontent.com/TEUNGKU-ZULKIFLI/finance_tracker/master/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png" width="280">
    </picture>
    <br/>
    Apok FinTrack
  </h1>
</a>

<p align="center">
  <b>Personal Finance Tracker built with Flutter</b><br/>
  Record your daily income & expenses, manage cards, view history, and analyze data with charts.
</p>

---

<p align="center">
  <!-- Custom Project Badges -->
  <a href="https://github.com/TEUNGKU-ZULKIFLI/finance_tracker/releases">
    <img src="https://img.shields.io/github/v/release/TEUNGKU-ZULKIFLI/finance_tracker?color=blue&style=for-the-badge" alt="Release"/>
  </a>
  <a href="https://github.com/TEUNGKU-ZULKIFLI/finance_tracker/actions">
    <img src="https://img.shields.io/github/actions/workflow/status/TEUNGKU-ZULKIFLI/finance_tracker/flutter.yml?branch=master&style=for-the-badge&logo=github-actions&label=Build" alt="CI Status"/>
  </a>
  <a href="https://github.com/TEUNGKU-ZULKIFLI/finance_tracker">
    <img src="https://img.shields.io/github/stars/TEUNGKU-ZULKIFLI/finance_tracker?style=for-the-badge&color=yellow&logo=github" alt="Stars"/>
  </a>
  <a href="https://github.com/sponsors/TEUNGKU-ZULKIFLI">
    <img src="https://img.shields.io/badge/Sponsor-Apok%20FinTrack-pink?logo=github-sponsors&style=for-the-badge" alt="Sponsor"/>
  </a>
</p>

---

## ✨ Features

- **Input Data**: Stepper form with currency formatting & validation  
- **Credit Card Management**: CRUD + custom card widget with bank brand  
- **History**: User actions sortable (date/name/type), delete all history  
- **Charts**: Weekly line & donut chart for analysis  
- **Settings**: Export PDF (WIP), clear data, about page, version info  
- **Custom Theme**: Dark/light mode, unified expense/income colors  
- **Snackbar**: Consistent success/error feedback across all pages  
- **Navigation**: Custom AppBar + NavigationBar  

---

## 📂 Project Structure

```

lib/
├─ pages/     → Main app pages (input, card, chart, history, setting, home)
├─ models/    → Data models (expense, income, balance, equity, card, history)
├─ services/  → SQFlite DB services (CRUD operations)
├─ widgets/   → Reusable widgets (snackbar, cards, charts, navbar, appbar)
├─ utils/     → Utility (currency, chart sorting)
└─ theme.dart → Custom theme & colors

```

---

## 📌 Commit Log Highlights

- 💄 UI polish: snackbar consistency, unified theme  
- ✨ New features: history, credit card CRUD, charts, settings  
- 🐛 Fixes: DB tables, models, build errors, async issues  
- ♻️ Refactors: structure, naming, widget/page cleanup  
- 🔧 Chores: upgraded Gradle, Kotlin, Flutter deps  

---

## 🚀 Project Status
✅ Stable release ready — **v1.0.0+1** (APK & AAB available)  
🎯 Next goals:  
- Export to PDF  
- Improve snackbar with default theme colors  
- Add full docs for contributors  

---

## 💖 Support & Sponsor
If this project helps you, consider supporting:  

[![Sponsor](https://img.shields.io/badge/Sponsor-TEUNGKU--ZULKIFLI-pink?logo=github-sponsors&style=for-the-badge)](https://github.com/sponsors/TEUNGKU-ZULKIFLI)

---

© 2025 — **Apok FinTrack** by TEUNGKU🧑🏻‍💻