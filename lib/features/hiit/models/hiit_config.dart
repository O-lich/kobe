class HiitConfig {
  HiitConfig({
    this.warmUp = const Duration(seconds: 30),
    this.work = const Duration(seconds: 45),
    this.rest = const Duration(seconds: 15),
    this.rounds = 6,
    this.coolDown = const Duration(seconds: 30),
  });

  Duration warmUp;
  Duration work;
  Duration rest;
  int rounds;
  Duration coolDown;

  HiitConfig copyWith({
    Duration? warmUp,
    Duration? work,
    Duration? rest,
    int? rounds,
    Duration? coolDown,
  }) {
    return HiitConfig(
      warmUp: warmUp ?? this.warmUp,
      work: work ?? this.work,
      rest: rest ?? this.rest,
      rounds: rounds ?? this.rounds,
      coolDown: coolDown ?? this.coolDown,
    );
  }
}
