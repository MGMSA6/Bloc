import 'package:bloc_example/blocs/post_bloc/post_bloc.dart';
import 'package:bloc_example/utils/post_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("PostApi"),
        ),
        body: BlocBuilder<PostBloc, PostStates>(
          builder: (context, state) {
            switch (state.postStatus) {
              case PostStatus.LOADING:
                return const Center(child: CircularProgressIndicator());
              case PostStatus.SUCCESS:
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search by email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (filterKey) {
                          context.read<PostBloc>().add(SearchItem(filterKey));
                        },
                      ),
                      Expanded(
                        child: state.searchMessage.isNotEmpty
                            ? Center(
                                child: Text(state.searchMessage.toString()),
                              )
                            : ListView.builder(
                                itemCount: state.temPostList.isEmpty
                                    ? state.postList.length
                                    : state.temPostList.length,
                                itemBuilder: (context, index) {
                                  if (state.temPostList.isNotEmpty) {
                                    final item = state.temPostList[index];
                                    return Card(
                                      child: ListTile(
                                        title: Text(item.email.toString()),
                                        subtitle: Text(item.body.toString()),
                                      ),
                                    );
                                  } else {
                                    final item = state.postList[index];
                                    return Card(
                                      child: ListTile(
                                        title: Text(item.email.toString()),
                                        subtitle: Text(item.body.toString()),
                                      ),
                                    );
                                  }
                                }),
                      ),
                    ],
                  ),
                );
              case PostStatus.FAILURE:
                return Center(child: Text(state.message.toString()));
            }
          },
        ),
      ),
    );
  }
}
