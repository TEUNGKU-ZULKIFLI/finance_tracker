import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../models/date_model.dart';
import '../models/expense_model.dart';
import '../models/income_model.dart';
import '../models/balance_model.dart';
import '../models/user_history_model.dart';
import '../models/equity_model.dart';
import '../models/credit_card_model.dart';

class DbService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'finance_tracker.db');

    // Buka database (akan dibuat ulang jika baru dihapus)
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE dates (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT NOT NULL UNIQUE
          );
        ''');
        await db.execute('''
          CREATE TABLE expenses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date_id INTEGER NOT NULL,
            pagi INTEGER,
            siang INTEGER,
            sore INTEGER,
            malam INTEGER,
            bensin INTEGER,
            FOREIGN KEY(date_id) REFERENCES dates(id) ON DELETE CASCADE
          );
        ''');
        await db.execute('''
          CREATE TABLE income (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date_id INTEGER NOT NULL,
            gaji INTEGER,
            lainnya INTEGER,
            FOREIGN KEY(date_id) REFERENCES dates(id) ON DELETE CASCADE
          );
        ''');
        await db.execute('''
          CREATE TABLE balance (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date_id INTEGER NOT NULL,
            balance INTEGER,
            FOREIGN KEY(date_id) REFERENCES dates(id) ON DELETE CASCADE
          );
        ''');
        await db.execute('''
            CREATE TABLE equity (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              date_id INTEGER NOT NULL,
              expense_estimation INTEGER,
              income_estimation INTEGER,
              estimation_balance INTEGER,
              FOREIGN KEY(date_id) REFERENCES dates(id) ON DELETE CASCADE
            );
          ''');
        await db.execute('''
          CREATE TABLE credit_card (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama_rek TEXT,
            no_rek TEXT,
            logo_asset TEXT
          );
        ''');
        await db.execute('''
          CREATE TABLE user_history (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            action TEXT,
            desc TEXT,
            timestamp TEXT
          );
        ''');
      },
      // Siapkan migrasi di masa depan
      onUpgrade: (db, oldVersion, newVersion) async {
        // Contoh migrasi:
        // if (oldVersion < 2) {
        //   await db.execute("ALTER TABLE income ADD COLUMN currency TEXT;");
        // }
        // if (oldVersion < 3) {
        //   await db.execute("CREATE TABLE equity (...);");
        // }
      },
    );
  }

  // Tambahkan fungsi insert, get, dan clear history
  Future<int> insertHistory(
    String action,
    String desc,
    String timestamp,
  ) async {
    final db = await database;
    return await db.insert('user_history', {
      'action': action,
      'desc': desc,
      'timestamp': timestamp,
    });
  }

  Future<List<UserHistoryModel>> getHistory() async {
    final db = await database;
    final res = await db.query('user_history', orderBy: 'timestamp DESC');
    return res.map((e) => UserHistoryModel.fromMap(e)).toList();
  }

  Future<List<UserHistoryModel>> getHistorySorted({
    String sortBy = 'timestamp',
    bool desc = true,
  }) async {
    final db = await database;
    final order = desc ? 'DESC' : 'ASC';
    final res = await db.query('user_history', orderBy: '$sortBy $order');
    return res.map((e) => UserHistoryModel.fromMap(e)).toList();
  }

  Future<int> clearHistory() async {
    final db = await database;
    return await db.delete('user_history');
  }

  // Insert Credit Card
  Future<int> insertCreditCard(CreditCardModel card) async {
    final db = await database;
    return await db.insert('credit_card', card.toMap());
  }

  // Get all Credit Cards
  Future<List<CreditCardModel>> getCreditCards() async {
    final db = await database;
    final res = await db.query('credit_card');
    return res.map((e) => CreditCardModel.fromMap(e)).toList();
  }

  // Delete Credit Card
  Future<int> deleteCreditCard(int id) async {
    final db = await database;
    return await db.delete('credit_card', where: 'id = ?', whereArgs: [id]);
  }

  // Update Credit Card
  Future<int> updateCreditCard(CreditCardModel card) async {
    final db = await database;
    return await db.update(
      'credit_card',
      card.toMap(),
      where: 'id = ?',
      whereArgs: [card.id],
    );
  }

  // Insert Equity
  static Future<int> insertEquity(EquityModel equity) async {
    final db = await database;
    return await db.insert('equity', equity.toMap());
  }

  // Insert functions
  static Future<int> insertDate(DateModel date) async {
    final db = await database;
    return await db.insert('dates', date.toMap());
  }

  static Future<DateModel?> getDateByValue(String date) async {
    final db = await database;
    final res = await db.query('dates', where: 'date = ?', whereArgs: [date]);
    if (res.isNotEmpty) {
      return DateModel.fromMap(res.first);
    }
    return null;
  }

  static Future<int> insertExpense(ExpenseModel expense) async {
    final db = await database;
    return await db.insert('expenses', expense.toMap());
  }

  static Future<int> insertIncome(IncomeModel income) async {
    final db = await database;
    return await db.insert('income', income.toMap());
  }

  static Future<int> insertBalance(BalanceModel balance) async {
    final db = await database;
    return await db.insert('balance', balance.toMap());
  }

  static Future<List<EquityModel>> getAllEquity() async {
    final db = await database;
    final res = await db.query('equity');
    return res.map((e) => EquityModel.fromMap(e)).toList();
  }

  // Hapus satu tanggal beserta relasi datanya
  static Future<int> deleteDate(int id) async {
    final db = await database;
    return await db.delete('dates', where: 'id = ?', whereArgs: [id]);
  }

  // Hapus semua data (reset tabel)
  static Future<void> clearAll() async {
    final db = await database;
    await db.delete('expenses');
    await db.delete('income');
    await db.delete('balance');
    await db.delete('dates');
    await db.delete('equity');
    // Reset auto-increment id (sqlite_sequence) untuk semua tabel
    await db.rawDelete("DELETE FROM sqlite_sequence WHERE name='expenses'");
    await db.rawDelete("DELETE FROM sqlite_sequence WHERE name='income'");
    await db.rawDelete("DELETE FROM sqlite_sequence WHERE name='balance'");
    await db.rawDelete("DELETE FROM sqlite_sequence WHERE name='dates'");
    await db.rawDelete("DELETE FROM sqlite_sequence WHERE name='equity'");
  }
}
