import 'package:tugas_auth/app/http/controllers/product_controller.dart';
import 'package:vania/vania.dart';
import 'package:tugas_auth/app/http/middleware/authenticate.dart';
import 'package:tugas_auth/app/http/middleware/home_middleware.dart';
import 'package:tugas_auth/app/http/middleware/error_response_middleware.dart';

class ApiRoute implements Route {
  @override
  void register() {
    Router.basePrefix('api');
    Router.post('/product', productController.create);
    Router.get('/product', productController.show);
    Router.put('/product/{id}', productController.update);
    Router.delete('/product/{id}', productController.destroy);
  }
}
