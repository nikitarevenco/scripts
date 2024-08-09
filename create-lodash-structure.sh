#!/bin/bash

# Used: Generate all of the lodash library's utility functions (item) as item.ts with item.test.ts containing empty vitest tests under /section/item/

sections=("array" "collection" "date" "function" "lang" "math" "number" "object" "seq" "string")

array_items=("chunk" "compact" "concat" "difference" "differenceBy" "differenceWith" "drop" "dropRight" "dropRightWhile" "dropWhile" "fill" "findIndex" "findLastIndex" "head" "flatten" "flattenDeep" "flattenDepth" "fromPairs" "indexOf" "initial" "intersection" "intersectionBy" "intersectionWith" "join" "last" "lastIndexOf" "nth" "pull" "pullAll" "pullAllBy" "pullAllWith" "pullAt" "remove" "reverse" "slice" "sortedIndex" "sortedIndexBy" "sortedIndexOf" "sortedLastIndex" "sortedLastIndexBy" "sortedLastIndexOf" "sortedUniq" "sortedUniqBy" "tail" "take" "takeRight" "takeRightWhile" "takeWhile" "union" "unionBy" "unionWith" "uniq" "uniqBy" "uniqWith" "unzip" "unzipWith" "without" "xor" "xorBy" "xorWith" "zip" "zipObject" "zipObjectDeep" "zipWith")
collection_items=("countBy" "forEach" "forEachRight" "every" "filter" "find" "findLast" "flatMap" "flatMapDeep" "flatMapDepth" "groupBy" "includes" "invokeMap" "keyBy" "map" "orderBy" "partition" "reduce" "reduceRight" "reject" "sample" "sampleSize" "shuffle" "size" "some" "sortBy")
date_items=("now")
function_items=("after" "ary" "before" "bind" "bindKey" "curry" "curryRight" "debounce" "defer" "delay" "flip" "memoize" "negate" "once" "overArgs" "partial" "partialRight" "rearg" "rest" "spread" "throttle" "unary" "wrap")
lang_items=("castArray" "clone" "cloneDeep" "cloneDeepWith" "cloneWith" "conformsTo" "eq" "gt" "gte" "isArguments" "isArray" "isArrayBuffer" "isArrayLike" "isArrayLikeObject" "isBoolean" "isBuffer" "isDate" "isElement" "isEmpty" "isEqual" "isEqualWith" "isError" "isFinite" "isFunction" "isInteger" "isLength" "isMap" "isMatch" "isMatchWith" "isNaN" "isNative" "isNil" "isNull" "isNumber" "isObject" "isObjectLike" "isPlainObject" "isRegExp" "isSafeInteger" "isSet" "isString" "isSymbol" "isTypedArray" "isUndefined" "isWeakMap" "isWeakSet" "lt" "lte" "toArray" "toFinite" "toInteger" "toLength" "toNumber" "toPlainObject" "toSafeInteger" "toString")
math_items=("add" "ceil" "divide" "floor" "max" "maxBy" "mean" "meanBy" "min" "minBy" "multiply" "round" "subtract" "sum" "sumBy")
number_items=("clamp" "inRange" "random")
object_items=("assign" "assignIn" "assignInWith" "assignWith" "at" "create" "defaults" "defaultsDeep" "findKey" "findLastKey" "forIn" "forInRight" "forOwn" "forOwnRight" "functions" "functionsIn" "get" "has" "hasIn" "invert" "invertBy" "invoke" "keys" "keysIn" "mapKeys" "mapValues" "merge" "mergeWith" "omit" "omitBy" "pick" "pickBy" "result" "set" "setWith" "toPairs" "toPairsIn" "transform" "unset" "update" "updateWith" "values" "valuesIn")
seq_items=("lodash" "chain" "tap" "thru" "prototype-Symbol-iterator" "prototype-at" "prototype-chain" "prototype-commit" "prototype-next" "prototype-plant" "prototype-reverse" "prototype-value")
string_items=("camelCase" "capitalize" "deburr" "endsWith" "escape" "escapeRegExp" "kebabCase" "lowerCase" "lowerFirst" "pad" "padEnd" "padStart" "parseInt" "repeat" "replace" "snakeCase" "split" "startCase" "startsWith" "template")

root_dir="src/lib"

for section in "${sections[@]}"; do
  section_var="${section}_items[@]"
  items=("${!section_var}")

  mkdir -p "$root_dir/$section"
  for item in "${items[@]}"; do
    mkdir -p "$root_dir/$section/$item"
    echo "export function $item() {" >"$root_dir/$section/$item/$item.ts"
    echo -e "}\n" >>"$root_dir/$section/$item/$item.ts"

    echo "import { describe, expect, it } from \"vitest\";" >"$root_dir/$section/$item/$item.test.ts"
    echo "import { $item } from \"./$item\"" >>"$root_dir/$section/$item/$item.test.ts"
    echo -e "\ndescribe(\"$item\", () => {" >>"$root_dir/$section/$item/$item.test.ts"
    for i in {1..3}; do
      echo -e "  it(\"\", () => {\n\n  })" >>"$root_dir/$section/$item/$item.test.ts"
    done
    echo -e "})" >>"$root_dir/$section/$item/$item.test.ts"
  done
done
