{module, test} = QUnit
module \ES7

test 'WeakMap.from' (assert)!->
  {from} = WeakMap
  assert.isFunction from
  assert.arity from, 1
  assert.name from, \from
  assert.looksNative from
  assert.nonEnumerable WeakMap, \from
  assert.ok WeakMap.from! instanceof WeakMap
  $1 = []
  assert.same WeakMap.from([[$1, 2]]).get($1), 2
  assert.same WeakMap.from(createIterable([[$1, 2]])).get($1), 2
  element = void
  index = void
  context = void
  WeakSet.from [$$element = [{}, 1]], ($element, $index)!->
    element := $element
    index := $index
    context := @
    return element
  , $context = {}
  assert.same element, $$element
  assert.same index, 0
  assert.same context, $context
  # generic
  assert.throws !-> from [{}, 1]
  arg = void
  F = (it)-> arg := it
  from.call F, createIterable([1 2 3]), (-> it^2)
  assert.deepEqual arg, [1 4 9]
