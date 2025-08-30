import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/date_model.dart';
import '../models/expense_model.dart';
import '../models/income_model.dart';
import '../models/saldo_model.dart';

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
          CREATE TABLE saldo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date_id INTEGER NOT NULL,
            saldo INTEGER,
            FOREIGN KEY(date_id) REFERENCES dates(id) ON DELETE CASCADE
          );
        ''');
      },
    );
  }

  // Insert functions
  static Future<int> insertDate(DateModel date) async {
    final db = await database;
    return await db.insert('dates', date.toMap());
  }

  static Future<int> insertExpense(ExpenseModel expense) async {
    final db = await database;
    return await db.insert('expenses', expense.toMap());
  }

  static Future<int> insertIncome(IncomeModel income) async {
    final db = await database;
    return await db.insert('income', income.toMap());
  }

  static Future<int> insertSaldo(SaldoModel saldo) async {
    final db = await database;
    return await db.insert('saldo', saldo.toMap());
  }

  // Get date by value
  static Future<DateModel?> getDateByValue(String date) async {
    final db = await database;
    final res = await db.query('dates', where: 'date = ?', whereArgs: [date]);
    if (res.isNotEmpty) {
      return DateModel.fromMap(res.first);
    }
    return null;
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
    await db.delete('saldo');
    await db.delete('dates');
    // Reset auto-increment id (sqlite_sequence) untuk semua tabel
    await db.rawDelete("DELETE FROM sqlite_sequence WHERE name='expenses'");
    await db.rawDelete("DELETE FROM sqlite_sequence WHERE name='income'");
    await db.rawDelete("DELETE FROM sqlite_sequence WHERE name='saldo'");
    await db.rawDelete("DELETE FROM sqlite_sequence WHERE name='dates'");
  }
}
