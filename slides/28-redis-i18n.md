### ruby i18n

  * basic backend for key value stores
  * _I18n::Backend::KeyValue.new(@redis_or_tokyo_cabinet_store)_
  * store only needs to respond to three methods
  * _store#[](key), store#[]=(key, value), store#keys_
