import pandas as pd
from sqlalchemy import create_engine
import os


# PostgreSQL connection
DATABASE_URL = (
    "postgresql+psycopg2://postgres:postgres@localhost:5432/customer_analytics"
)

engine = create_engine(DATABASE_URL)


DATA_PATH = "../data"


tables = {
    "olist_orders_dataset.csv": "olist_orders_dataset",
    "olist_order_items_dataset.csv": "olist_order_items_dataset",
    "olist_products_dataset.csv": "olist_products_dataset",
    "olist_order_reviews_dataset.csv": "olist_order_reviews_dataset",
    "olist_customers_dataset.csv": "olist_customers_dataset",
    "olist_sellers_dataset.csv": "olist_sellers_dataset",
    "olist_geolocation_dataset.csv": "olist_geolocation_dataset",
    "olist_order_payments_dataset.csv": "olist_order_payments_dataset",
    "product_category_name_translation.csv": "product_category_name_translation"

}


for file_name, table_name in tables.items():

    file_path = os.path.join(DATA_PATH, file_name)

    if not os.path.exists(file_path):
        print(f"Missing file: {file_path}")
        continue

    print(f"Loading {file_name}...")

    df = pd.read_csv(file_path)

    df.to_sql(
        table_name,
        engine,
        if_exists="replace",
        index=False,
        schema="public"
    )

    print(f"Loaded {table_name}: {len(df)} rows")


print("Finished loading data")