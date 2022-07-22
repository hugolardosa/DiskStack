class Artist {
  final int id;
  final String name;

  const Artist({
    required this.id, 
    required this.name
  });

  // Convert a Artist into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name
    };
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Artist{id: $id, name: $name}';
  }
}

class RecordLabel {
  final int id;
  final String name;

  const RecordLabel({
    required this.id, 
    required this.name
  });

  // Convert a RecordLabel into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name
    };
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'RecordLabel{id: $id, name: $name}';
  }
}

class Album {
  final String isbn;
  final String title;
  final int artistID;
  final int recordLabelID;
  final Type type;
  final String genera;
  final int year;


  const Album({
    required this.isbn, 
    required this.title, 
    required this.artistID, 
    required this.recordLabelID, 
    required this.type, 
    required this.genera, 
    required this.year
  });

  // Convert a RecordLabel into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'isbn' : isbn, 
      'title' : title, 
      'artistID' : artistID, 
      'recordLabelID' : recordLabelID, 
      'type' : type, 
      'genera' : genera, 
      'year' : year
    };
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Album{isbn : $isbn, title : $title, artist : $artistID, recordLabel : $recordLabelID , type : $type , genera : $genera , year : $year }';
  }
}

enum Type {
  cd,
  tape,
  vinyl,
  laserDisc
}