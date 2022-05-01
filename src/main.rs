use sqlx::postgres::PgPoolOptions;

#[derive(Debug)]
#[allow(dead_code)]
struct Test {
    col_1: i32,
    col_2: chrono::NaiveDateTime,
}

#[tokio::main]
async fn main() -> Result<(), sqlx::Error> {
    let database_url = std::env::var("DATABASE_URL").unwrap();
    let db = PgPoolOptions::new().connect(&database_url).await?;

    let test = sqlx::query_as!(Test, "SELECT * FROM test")
        .fetch_all(&db)
        .await?;
    println!("{:?}", test);
    Ok(())
}
