import 'package:bloc/bloc.dart';
import 'package:english_app/bloc/navigation/navigation_event.dart';
import 'package:english_app/bloc/navigation/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState>{
  NavigationBloc() : super(NavigationState(0)){
    on<NavigationToTab>((event, emit){
      emit(NavigationState(event.index));
    },);
  }
}