import 'dart:io';
import 'package:vania/vania.dart';
import 'create_users_table.dart';
import 'customers.dart';
import 'orders.dart';
import 'vendors.dart';
import 'products.dart';
import 'productnotes.dart';
import 'orderitems.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
		 await CreateUserTable().up();
    await Customers().up();
    await Orders().up();
    await Vendors().up();
    await Products().up();
    await Productnotes().up();
		 await Orderitems().up();
	}

  dropTables() async {
		 await Orderitems().down();
		 await Productnotes().down();
    await Products().down();
    await Vendors().down();
    await Orders().down();
    await Customers().down();
    await CreateUserTable().down();
	 }
}
