import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/cubit/counter_state.dart';
import 'package:counter_app/customScoreButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(pointsCounter());
}

class pointsCounter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> CounterCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        )
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (context, state) {
        if (state is CounterResetState) {
          BlocProvider.of<CounterCubit>(context).teamAPoints = 0;
          BlocProvider.of<CounterCubit>(context).teamBPoints = 0;
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Scores'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Team A',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                            style: TextStyle(
                              fontSize: 100,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customScoreButton(
                                buttonText: '+1',
                                onPressedCallback: () {
                                  BlocProvider.of<CounterCubit>(context)
                                      .TeamIncrement(team: 'A', buttonNmber: 1);
                                },
                              ),
                              customScoreButton(
                                buttonText: '+2',
                                onPressedCallback: () {
                                  BlocProvider.of<CounterCubit>(context)
                                      .TeamIncrement(team: 'A', buttonNmber: 2);
                                },
                              ),
                            ],
                          ),
                          customScoreButton(
                            buttonText: '+3',
                            onPressedCallback: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .TeamIncrement(team: 'A', buttonNmber: 3);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 500,
                    child: VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Team B',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                            style: TextStyle(
                              fontSize: 100,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customScoreButton(
                                buttonText: '+1',
                                onPressedCallback: () {
                                  BlocProvider.of<CounterCubit>(context)
                                      .TeamIncrement(team: 'B', buttonNmber: 1);
                                },
                              ),
                              customScoreButton(
                                buttonText: '+2',
                                onPressedCallback: () {
                                  BlocProvider.of<CounterCubit>(context)
                                      .TeamIncrement(team: 'B', buttonNmber: 2);
                                },
                              ),
                            ],
                          ),
                          customScoreButton(
                            buttonText: '+3',
                            onPressedCallback: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .TeamIncrement(team: 'B', buttonNmber: 3);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  primary: Colors.blue,
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).resetScores();
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
