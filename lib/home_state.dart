enum HomeStatus { initial, success, error }

class HomeState<T> {
  final HomeStatus status;
  final List<T> contacts;
  final bool hasReachedMax;

  const HomeState({
    this.status = HomeStatus.initial,
    this.contacts = const [],
    this.hasReachedMax = false,
  });

  HomeState<T> copyWith({
    HomeStatus? status,
    List<T>? contacts,
    bool? hasReachedMax,
  }) {
    return HomeState(
      status: status ?? this.status,
      contacts: contacts ?? this.contacts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
