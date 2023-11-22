

class Categories{
  final int id;
  final String name;
  final String image;

  Categories({required this.id, required this.name, required this.image});


  List<Object> get props => [id, name , image];
}


