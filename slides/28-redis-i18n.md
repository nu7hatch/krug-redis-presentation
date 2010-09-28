### ruby i18n

  * basic backend for key value stores
  * `I18n::Backend::KeyValue.new(@redis_or_tokyo_cabinet_store)`
  * store only needs to respond to three methods
  * `store#[](key)`, `store#[]=(key, value)`, `store#keys`
