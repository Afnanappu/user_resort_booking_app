import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);

  void toggleFavorite(bool isFavorite){
    emit(isFavorite);
  }

  
}
