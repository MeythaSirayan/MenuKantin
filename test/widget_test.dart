import 'package:flutter_test/flutter_test.dart';
import 'package:kantin/main.dart';

void main() {
  testWidgets('Aplikasi kantin menampilkan daftar menu', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AplikasiKantin());

    await tester.pumpAndSettle();

    expect(find.text('Daftar Menu Kantin'), findsOneWidget);
    expect(find.text('Nasi Goreng'), findsOneWidget);
    expect(find.text('Mie Ayam'), findsOneWidget);
    expect(find.text('Ayam Geprek'), findsOneWidget);
    expect(find.text('Soto Ayam'), findsOneWidget);
    expect(find.text('Es Teh Manis'), findsOneWidget);
  });
}
