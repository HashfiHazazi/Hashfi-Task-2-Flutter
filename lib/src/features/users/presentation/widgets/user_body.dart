import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/src/features/users/presentation/states/user_bloc/user_bloc.dart';

class UserBody extends StatelessWidget {
  const UserBody({
    super.key,
    required this.myUserBloc,
  });

  final UserBloc myUserBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: myUserBloc,
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Fetching API...',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LinearProgressIndicator()
                ],
              ),
            ),
          ));
        } else if (state is UserLoaded) {
          final userData = state.users;
          return ListView.builder(
            itemBuilder: (context, index) {
              final userResult = userData[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${userResult.id}'),
                    ),
                    title: Text(
                      '${userResult.name} / (${userResult.userName})',
                    ),
                    subtitle: Text(userResult.email),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/userDetail',
                        arguments: {
                          'id': userResult.id,
                          'name': userResult.name,
                          'username': userResult.userName,
                          'email': userResult.email,
                          'street': userResult.address!.street,
                          'suite': userResult.address!.suite,
                          'city': userResult.address!.city,
                          'zipcode': userResult.address!.zipcode,
                          'lat': userResult.address!.userGeo!.lat,
                          'lng': userResult.address!.userGeo!.lng,
                          'phone': userResult.phone,
                          'website': userResult.website,
                          'companyName': userResult.company!.companyName,
                          'catchphrase': userResult.company!.catchPhrase,
                          'bs': userResult.company!.bs
                        },
                      );
                    },
                  ),
                ),
              );
            },
            itemCount: userData.length,
          );
        } else if (state is UserError) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const Center(
            child: Text('Nothing'),
          );
        }
      },
    );
  }
}
