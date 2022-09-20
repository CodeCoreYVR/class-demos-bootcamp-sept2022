function loud(logFn, fn) {
  logFn(`Calling ${fn.name}`);
  const val = fn()
  logFn(`Called ${fn.name} & returned ${val}`);
  return val
}

const add = () => 1 + 2;

loud(console.info, add)