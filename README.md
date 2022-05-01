Prepare data:

```
psql -c "create database sqlx_example_1"
psql sqlx_example_1 -f db-1.sql

psql -c "create database sqlx_example_2"
psql sqlx_example_2 -f db-2.sql
```

Build binary, change credentials if necessary:

```
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/sqlx_example_1" cargo build
```

Run:

```
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/sqlx_example_1" ./target/debug/sqlx-example
#=> [Test { col_1: 123, col_2: 2022-05-01T14:00:51.124551 }]

DATABASE_URL="postgresql://postgres:postgres@localhost:5432/sqlx_example_2" ./target/debug/sqlx-example
#=> thread 'main' panicked at 'range end index 8 out of range for slice of length 4', ~/.cargo/registry/src/github.com-1ecc6299db9ec823/byteorder-1.4.3/src/lib.rs:1983:28
stack backtrace:
   0: rust_begin_unwind
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/std/src/panicking.rs:584:5
   1: core::panicking::panic_fmt
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/panicking.rs:143:14
   2: core::slice::index::slice_end_index_len_fail
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/slice/index.rs:43:5
   3: <core::ops::range::Range<usize> as core::slice::index::SliceIndex<[T]>>::index
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/slice/index.rs:245:13
   4: <core::ops::range::RangeTo<usize> as core::slice::index::SliceIndex<[T]>>::index
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/slice/index.rs:291:9
   5: core::slice::index::<impl core::ops::index::Index<I> for [T]>::index
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/slice/index.rs:15:9
   6: <byteorder::BigEndian as byteorder::ByteOrder>::read_u64
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/byteorder-1.4.3/src/lib.rs:1983:28
   7: byteorder::ByteOrder::read_i64
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/byteorder-1.4.3/src/lib.rs:631:9
   8: sqlx_core::postgres::types::int::<impl sqlx_core::decode::Decode<sqlx_core::postgres::database::Postgres> for i64>::decode
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/sqlx-core-0.5.13/src/postgres/types/int.rs:148:38
   9: sqlx_core::postgres::types::chrono::datetime::<impl sqlx_core::decode::Decode<sqlx_core::postgres::database::Postgres> for chrono::naive::datetime::NaiveDateTime>::decode
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/sqlx-core-0.5.13/src/postgres/types/chrono/datetime.rs:60:26
  10: sqlx_core::row::Row::try_get_unchecked
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/sqlx-core-0.5.13/src/row.rs:159:9
  11: sqlx_example::main::{{closure}}::{{closure}}
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/sqlx-0.5.13/src/macros.rs:551:9
  12: sqlx_core::query::Map<DB,F,A>::fetch_many::{{closure}}::{{closure}}
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/sqlx-core-0.5.13/src/query.rs:340:39
  13: <core::future::from_generator::GenFuture<T> as core::future::future::Future>::poll
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/future/mod.rs:84:19
  14: sqlx_core::ext::async_stream::TryAsyncStream<T>::new::{{closure}}
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/sqlx-core-0.5.13/src/ext/async_stream.rs:28:39
  15: <core::future::from_generator::GenFuture<T> as core::future::future::Future>::poll
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/future/mod.rs:84:19
  16: <futures_util::future::future::fuse::Fuse<Fut> as core::future::future::Future>::poll
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/futures-util-0.3.21/src/future/future/fuse.rs:86:37
  17: <core::pin::Pin<P> as core::future::future::Future>::poll
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/future/future.rs:123:9
  18: <&mut F as core::future::future::Future>::poll
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/future/future.rs:111:9
  19: <sqlx_core::ext::async_stream::TryAsyncStream<T> as futures_core::stream::Stream>::poll_next
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/sqlx-core-0.5.13/src/ext/async_stream.rs:51:17
  20: <core::pin::Pin<P> as futures_core::stream::Stream>::poll_next
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/futures-core-0.3.21/src/stream.rs:120:9
  21: <S as futures_core::stream::TryStream>::try_poll_next
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/futures-core-0.3.21/src/stream.rs:196:9
  22: <futures_util::stream::try_stream::try_filter_map::TryFilterMap<St,Fut,F> as futures_core::stream::Stream>::poll_next
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/futures-util-0.3.21/src/stream/try_stream/try_filter_map.rs:76:47
  23: <core::pin::Pin<P> as futures_core::stream::Stream>::poll_next
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/futures-core-0.3.21/src/stream.rs:120:9
  24: <S as futures_core::stream::TryStream>::try_poll_next
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/futures-core-0.3.21/src/stream.rs:196:9
  25: <futures_util::stream::try_stream::try_collect::TryCollect<St,C> as core::future::future::Future>::poll
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/futures-util-0.3.21/src/stream/try_stream/try_collect.rs:46:26
  26: sqlx_core::query::Map<DB,F,A>::fetch_all::{{closure}}
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/sqlx-core-0.5.13/src/query.rs:358:43
  27: <core::future::from_generator::GenFuture<T> as core::future::future::Future>::poll
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/future/mod.rs:84:19
  28: sqlx_example::main::{{closure}}
             at ./src/main.rs:16:24
  29: <core::future::from_generator::GenFuture<T> as core::future::future::Future>::poll
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/future/mod.rs:84:19
  30: tokio::park::thread::CachedParkThread::block_on::{{closure}}
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-1.18.0/src/park/thread.rs:263:54
  31: tokio::coop::with_budget::{{closure}}
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-1.18.0/src/coop.rs:102:9
  32: std::thread::local::LocalKey<T>::try_with
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/std/src/thread/local.rs:413:16
  33: std::thread::local::LocalKey<T>::with
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/std/src/thread/local.rs:389:9
  34: tokio::coop::with_budget
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-1.18.0/src/coop.rs:95:5
  35: tokio::coop::budget
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-1.18.0/src/coop.rs:72:5
  36: tokio::park::thread::CachedParkThread::block_on
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-1.18.0/src/park/thread.rs:263:31
  37: tokio::runtime::enter::Enter::block_on
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-1.18.0/src/runtime/enter.rs:151:13
  38: tokio::runtime::thread_pool::ThreadPool::block_on
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-1.18.0/src/runtime/thread_pool/mod.rs:81:9
  39: tokio::runtime::Runtime::block_on
             at ~/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-1.18.0/src/runtime/mod.rs:477:43
  40: sqlx_example::main
             at ./src/main.rs:19:5
  41: core::ops::function::FnOnce::call_once
             at /rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/ops/function.rs:227:5
```
