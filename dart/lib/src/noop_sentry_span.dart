import 'protocol.dart';
import 'tracing.dart';
import 'utils.dart';

class NoOpSentrySpan extends ISentrySpan {
  NoOpSentrySpan._();

  static final _instance = NoOpSentrySpan._();

  static final _spanContext = SentrySpanContext(
    traceId: SentryId.empty(),
    spanId: SpanId.empty(),
    operation: 'noop',
  );

  static final _header = SentryTraceHeader(
    SentryId.empty(),
    SpanId.empty(),
    sampled: false,
  );

  static final _timestamp = getUtcDateTime();

  factory NoOpSentrySpan() {
    return _instance;
  }

  @override
  Future<void> finish({SpanStatus? status}) async {}

  @override
  void removeData(String key) {}

  @override
  void removeTag(String key) {}

  @override
  void setData(String key, value) {}

  @override
  void setTag(String key, String value) {}

  @override
  ISentrySpan startChild(String operation, {String? description}) =>
      NoOpSentrySpan();

  @override
  SentrySpanContext get context => _spanContext;

  @override
  SpanStatus? get status => null;

  @override
  DateTime get startTimestamp => _timestamp;

  @override
  DateTime? get endTimestamp => null;

  @override
  bool get finished => false;

  @override
  dynamic get throwable => null;

  @override
  set throwable(throwable) {}

  @override
  set status(SpanStatus? status) {}

  @override
  bool? get sampled => null;

  @override
  SentryTraceHeader toSentryTrace() => _header;
}
