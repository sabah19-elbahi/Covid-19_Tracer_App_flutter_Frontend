import '../../objectbox.g.dart';

class ObjectBox {
ObjectBox();

static late Store store;

static void createStore() {
openStore().then((Store str) {
store = str;
});
}

static Store getStore() {
return store;
}
}