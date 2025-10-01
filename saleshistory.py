import random, math, csv, os
from datetime import datetime, timedelta, timezone

NUM_WEEKS_HIST = 39
TARG_SALES = 750000
INCL_TIMESTAMPS = True
PEAK_MULTIPLIER = 3
# business is open from 11 am to 11 pm
BUSINESS_HOUR_START = 11
BUSINESS_HOUR_END = 22

random.seed(67)

today = datetime.now(timezone.utc).date()
startday = today - timedelta(weeks=NUM_WEEKS_HIST - 1)
total_days = (today - startday).days
peak_day = startday + timedelta(days=random.randint(0, total_days))
peak_days = {peak_day}

DRINKS = {
    "Classic Tea" : ("Fresh Brew Series", 4.75),
    "Honey Tea" : ("Fresh Brew Series", 4.95),
    "Honey Pearl Milk Tea" : ("Milky Series", 6.15),
    "Mango Green Milk Tea" : ("Milky Series", 6.75),
    "Coffee Creama" : ("Milky Series", 6.75),
    "Thai Pearl Milk Tea" : ("Milky Series", 6.50),
    "Peach Tea with Honey Jelly" : ("Fruit Tea Series", 6.40),
    "Honey Lemonade" : ("Fruit Tea Series", 5.50),
    "Mango Green Tea" : ("Fruit Tea Series", 5.95),
    "Tiger Boba" : ("Non-Caffeinated Series", 6.75),
    "Strawberry Coconut" : ("Non-Caffeinated Series", 6.75),
    "Halo Halo" : ("Non-Caffeinated Series", 7.25),
    "Orea Ice Blended" : ("Ice Blended Series", 6.95),
    "Taro Ice Blended with Pudding" : ("Ice Blended Series", 6.95),
    "Mango Matcha Fresh Milk" : ("Matcha Series", 6.75),
    "Strawberry Matcha Fresh Milk" : ("Matcha Series", 6.75)
}

TOPPINGS = [
    ("Pearls(Boba)", 0.75),
    ("Lychee Jelly", 0.75),
    ("Coffee Jelly", 0.75),
    ("Honey Jelly", 0.75),
    ("Pudding", 0.75),
    ("Crystal Boba", 1.00),
    ("Mango Popping Boba", 1.00),
    ("Strawberry Popping Boba", 1.00),
    ("Creama", 1.25),
    ("Ice Cream", 1.25)
]

drink_rows = []
for name, (series, price) in DRINKS.items():
    drink_rows.append({
        "Drink_Name": name,
        "Series_Name": series,
        "Qty_Remaining": 10000,
        "Qty_Ordered": 0,
        "Max_Qty": 10000,
        "Drink_Price": float(price)
    })

topping_rows = []
topping_price = {}
for topName, topPrice in TOPPINGS:
    topping_rows.append({
        "Topping_Name": topName,
        "Qty_Remaining": 10000,
        "Qty_Ordered": 0,
        "Max_Qty": 10000,
        "Topping_Price": float(topPrice)
    })
    topping_price[topName] = float(topPrice)

drink_names = list(DRINKS.keys())

weekday_multiplier = [1.00, 1.05, 1.05, 1.10, 1.15, 1.50, 1.35]
BASE_PER_DAY = 200

ICE_LEVELS = ["Regular", "Less", "No Ice"]
SWEETNESS_LEVEL = ["Normal (100%)", "Less (80%)", "Half (50%)", "Light (30%)", "No Sugar (0%)"]

def rand_ice(): return random.choice(ICE_LEVELS)
def rand_sweetness(): return random.choice(SWEETNESS_LEVEL)
def rand_topping_name(): return random.choice(TOPPINGS)[0]

def fmt_ts(dt: datetime) -> str:
    s = dt.strftime("%Y-%m-%d %H:%M:%S%z")
    return s[:-2] + ":" + s[-2:]

orders = []
day = startday
while day <= today:
    day_factor = weekday_multiplier[day.weekday()]
    noise = random.uniform(0.85, 1.15)
    target = BASE_PER_DAY * day_factor * noise
    if day in peak_days:
        target *= PEAK_MULTIPLIER

    for _ in range(int(round(target))):
        ts = datetime(
            day.year, day.month, day.day,
            random.randint(BUSINESS_HOUR_START, BUSINESS_HOUR_END),
            random.randint(0, 59),
            random.randint(0, 59),
            tzinfo=timezone.utc
        )

        drink = random.choice(drink_names)
        series, dprice = DRINKS[drink]
        top_name = rand_topping_name()
        tprice = topping_price[top_name]
        total_price= round(float(dprice) + float(tprice), 2)

        row = {
            "Drink_Name": drink,
            "Ice_Level": rand_ice(),
            "Sweetness_Level": rand_sweetness(),
            "Topping_Used": top_name,
            "Drink_Price": float(dprice),
            "Topping_Price": float(tprice),
            "Total_Price": total_price
        }
        if INCL_TIMESTAMPS:
            row["Order_Timestamp"] = ts
        orders.append(row)

    day += timedelta(days=1)

current_total = sum(o["Total_Price"] for o in orders)
scale = TARG_SALES / current_total
scaled_orders = []
if scale >= 1.0:
    mult = int(math.floor(scale))
    extra = scale - mult
    for o in orders:
        for _ in range(mult):
            scaled_orders.append(o.copy())
        if random.random() < extra:
            scaled_orders.append(o.copy())
else:
    for o in orders:
        if random.random() < scale:
            scaled_orders.append(o.copy())

final_total = sum(o["Total_Price"] for o in scaled_orders)

out_dir = "."
drinks_csv   = os.path.join(out_dir, "drinks.csv")
toppings_csv = os.path.join(out_dir, "toppings.csv")
orders_csv   = os.path.join(out_dir, "orders.csv")

with open(drinks_csv, "w", newline="", encoding="utf-8") as f:
    w = csv.writer(f)
    w.writerow(["Drink_Name","Series_Name","Qty_Remaining","Qty_Ordered","Max_Qty","Drink_Price"])
    for r in drink_rows:
        w.writerow([r["Drink_Name"], r["Series_Name"], r["Qty_Remaining"], r["Qty_Ordered"], r["Max_Qty"], r["Drink_Price"]])

with open(toppings_csv, "w", newline="", encoding="utf-8") as f:
    w = csv.writer(f)
    w.writerow(["Topping_Name","Qty_Remaining","Qty_Ordered","Max_Qty","Topping_Price"])
    for r in topping_rows:
        w.writerow([r["Topping_Name"], r["Qty_Remaining"], r["Qty_Ordered"], r["Max_Qty"], r["Topping_Price"]])

order_cols = ["Drink_Name","Ice_Level","Sweetness_Level","Topping_Used","Drink_Price","Topping_Price"]
if INCL_TIMESTAMPS:
    order_cols.append("Order_Timestamp")

with open(orders_csv, "w", newline="", encoding="utf-8") as f:
    w = csv.writer(f)
    w.writerow(order_cols)
    for o in scaled_orders:
        row = [o["Drink_Name"], o["Ice_Level"], o["Sweetness_Level"], o["Topping_Used"], o["Drink_Price"], o["Topping_Price"]]
        if INCL_TIMESTAMPS:
            ts = o["Order_Timestamp"]
            row.append(ts.strftime("%Y-%m-%d %H:%M:%S%z")[:-2] + ":" + ts.strftime("%Y-%m-%d %H:%M:%S%z")[-2:])
        w.writerow(row)

print("Wrote drinks.csv, toppings.csv, and orders.csv")
print(f"Peak day chosen: {peak_day}")
print(f"Approx sales (drink + topping): ${final_total:,.2f}")
