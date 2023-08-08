class RoxPubSub {
  
  final Map<String, dynamic> _topics = {};

  // TODO: adicionar unsubscribe

  void publish<T>(String topic, T event) {
    if (_topics.containsKey(topic)) {
      _topics[topic]!.forEach((callback) => callback(event));
    }
  }

  void subscribe<T>(String topic, Function(T) callback) {
    if (_topics.containsKey(topic)) {
      _topics[topic]!.add(callback);
    } else {
      _topics[topic] = [callback];
    }
  }
}