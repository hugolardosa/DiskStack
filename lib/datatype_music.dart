class Artist {
  final int id;
  final String name;
  const Artist({required this.id, required this.name});
}

class RecordLabel {
  final int id;
  final String name;
  const RecordLabel({required this.id, required this.name});
}

class Album {
  final String isbn;
  final String title;
  final Artist artist;
  final RecordLabel recordLabel;
  final Type type;
  final String genera;
  final int year;


  const Album({required this.isbn, required this.title, required this.artist, required this.recordLabel , required this.type, required this.genera, required this.year});
}

enum Type {
  cd,
  tape,
  vinyl,
  laserDisc
}