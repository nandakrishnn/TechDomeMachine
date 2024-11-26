// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDataFavAdapter extends TypeAdapter<MovieDataFav> {
  @override
  final int typeId = 0;

  @override
  MovieDataFav read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDataFav(
      id: fields[0] as int?,
      movieTitle: fields[1] as String?,
      movieImageUrl: fields[2] as String?,
      orginalWebUrl: fields[4] as String?,
      movieImdbId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDataFav obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.movieTitle)
      ..writeByte(2)
      ..write(obj.movieImageUrl)
      ..writeByte(3)
      ..write(obj.movieImdbId)
      ..writeByte(4)
      ..write(obj.orginalWebUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDataFavAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
