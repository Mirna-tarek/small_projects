import 'package:counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterAIncrementState());

  int teamAPoints = 0;

  int teamBPoints = 0;

  void resetScores() {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(CounterResetState());
  }

  void TeamIncrement({required String team, required int buttonNmber}){
    if(team == 'A'){
      teamAPoints += buttonNmber;
      emit(CounterAIncrementState());
    } else{
      teamBPoints += buttonNmber;
      emit(CounterBIncrementState());
    }
  }
}