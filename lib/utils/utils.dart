import 'package:currency_formatter/currency_formatter.dart';

import '../routers/app_router.dart';

class Utils {
  static final appRouter = AppRouter();
  static String moneyFormat(
    final price, {
    final String? symbol,
    final int? decimal,
    final SymbolSide? symbolSide,
  }) {
    return CurrencyFormatter.format(
      price ?? 0,
      CurrencyFormat(
        symbol: symbol ?? 'đ',
        symbolSide: symbolSide ?? SymbolSide.right,
        thousandSeparator: '.',
      ),
      decimal: decimal ?? 0,
    );
  }
}
