import "package:app_provider_tutorial/home_provider.dart";
import "package:app_provider_tutorial/home_state.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<HomeProvider>().getContacts();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.99);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Pagination with Provider",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, state, child) {
          // print("state: ${state.homeState.status}");
          if (state.homeState.status == HomeStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.homeState.status == HomeStatus.error) {
            return const Center(child: Text("Failed to fetch posts"));
          }
          if (state.homeState.status == HomeStatus.success) {
            if (state.homeState.contacts.isEmpty) {
              return const Center(child: Text("No posts"));
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.homeState.hasReachedMax
                  ? state.homeState.contacts.length
                  : state.homeState.contacts.length + 1,
              itemBuilder: (context, index) {
                return index >= state.homeState.contacts.length
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                                state.homeState.contacts[index].id.toString()),
                          ),
                          title: Text(state.homeState.contacts[index].title),
                        ),
                      );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
