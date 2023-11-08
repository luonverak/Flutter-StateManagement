class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  bool favorite;
  int counter;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.favorite,
      required this.counter});
}

List<Product> listProduct = [
  Product(
    id: '1',
    name: 'Caputino',
    price: 5,
    image: 'asset/images/coffee.webp',
    favorite: false,
    counter: 1,
  ),
  Product(
    id: '2',
    name: 'Hot Caputino',
    price: 7,
    image: 'asset/images/coffee-2.png',
    favorite: false,
    counter: 1,
  ),
  Product(
    id: '3',
    name: 'Hot Late',
    price: 4,
    image: 'asset/images/coffee-3.webp',
    favorite: false,
    counter: 1,
  ),
  Product(
    id: '4',
    name: 'Ice Late',
    price: 5,
    image: 'asset/images/coffee-4.jpeg',
    favorite: false,
    counter: 1,
  ),
  Product(
    id: '5',
    name: 'Ice Caputino',
    price: 5,
    image: 'asset/images/coffee-5.jpeg',
    favorite: false,
    counter: 1,
  ),
  Product(
    id: '6',
    name: 'Americano',
    price: 3,
    image: 'asset/images/coffee-6.jpeg',
    favorite: false,
    counter: 1,
  ),
];
