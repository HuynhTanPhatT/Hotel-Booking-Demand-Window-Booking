# 🏩Hotel Booking Demand & Cancellation Analysis - Understanding Early Booking with No Deposit Behavior (07/2015 - 10/2017)
- Author: Huỳnh Tấn Phát
- Date: 10/2025
- Tool Used: `Python`, `SQL`, `PowerBi`
    - Python: Pandas, Matplotlib, Numpy, Datetime, Seaborn
    - SQL: CTEs, Joins, Case, aggregate functions
    - PowerBi: Dax, calculated columns, data visualizaition, data modeling
# ReadMe - Table Of Contents (TOCs)
1. [Background & Overview]()
2. [Dataset Description]()
3. [Design Thinking Process]()
4. [Data Processing & Metrics Defination (Dax)]()
5. [Hotel Room Reservation Timeline]()
6. [Key Insights & Visualizations]()
7. [Recommendations]()
# 📌Background & Overview
## Objective:
📖What is this probject about?

This project aims to build a PowerBi dashboard using `Hotel Booking` dataset, which including data on transactions (**Booking Status**, **Booking Information**), guest details (**Guest Information**, **Country**), and booking-related dates (**Check In**, **Reservation Date**). Additionally, it also includes service-related data (**Meal**, **Room Type**). The goal is to provide the **Revenue Manager** with **data-driven insights** to:
- Understand the current business performance
- Identify the root cause of cancellations.
- Uncover guest behavior pattern for cancellations.
- Support better decision-making to decrease cancellations while keeping `No Deposit` payment option.

🥷 Who is this project for ?
- Revenue Manager

❓ Business Question:
- What is the current performance of the hotels?
- Which segments contribute the most to the cancellation rate?
- How much revenue did the hotel lose due to cancelled bookings?
- Which segments and guest groups should be prioritized for improvement?

# Dataset Description
## 📌Data Source:
- Source:
    - [Kaggle](https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand/data)
    - [Science Direct with Metadata](https://www.sciencedirect.com/science/article/pii/S2352340918315191)
- Size: The `hotel_booking_table` contains more than **+100.000** records.
- Format: CSV
## 📊Data  Relationship
<img width="1735" height="722" alt="image" src="https://github.com/user-attachments/assets/0ef39198-47e9-4ed3-a469-d9277639fb3a" />


# Data Processing by Python & SQL & DAX
1. Using [Python](https://github.com/HuynhTanPhatT/Hotel-Booking-Demand-Window-Booking/blob/main/Python%3A%20Data%20Cleaning%20%26%20EDA/Hotel%20Booking%20Demand%20--%20Data%20Cleaning%20%26%20EDA.ipynb) to: 
    - `Data Cleaning`: check data quality, handle null values, convert data types, detect data anamalies, and remove duplicate records.
    - `Exploratory Data Analysis (EDA)`: identify the **pain points** of stakeholder (**revenue manager**).

2. Using [SQL](https://github.com/HuynhTanPhatT/Hotel-Booking-Demand-Window-Booking/blob/main/SQL%20%E2%80%93%20Answering%20the%20problem%20statement%20in%20the%20Define%20stage%20of%20Design%20Thinking/2.%20Analysis%20Detailed%20Questions.sql) to:
    - Answer detailed questions based on the **pain points** to define `a clearly analytical direction` for the Power Bi dashboard.
3. DAX Calculations & Formulas


# 🧠Design Thinking Process
## 1️⃣Empathize
<img width="1232" height="693" alt="image" src="https://github.com/user-attachments/assets/d179f4a5-af3b-470f-a9b8-fc6b2a72be5b" />

## 2️⃣Definde
<img width="1232" height="693" alt="image" src="https://github.com/user-attachments/assets/a77da901-bcff-47d9-bb71-6dfe7003344f" />

## 3️⃣Ideate
<img width="1234" height="691" alt="image" src="https://github.com/user-attachments/assets/5dbcda57-eb80-48ab-bbfe-bd62b899a212" />

## 4️⃣Prototype
This part will be in **Key Insights & Visualization** section.


# 🔗Hotel Room Reservation Booking Timeline
<img width="1232" height="690" alt="image" src="https://github.com/user-attachments/assets/6a628548-1400-4314-83f8-7d8c80c2fb28" />


# 📊Key Insights & Visualizations
## I. Business Overview
<img width="1303" height="731" alt="image" src="https://github.com/user-attachments/assets/a76d8f57-1e5f-42fd-a404-d26044c27d16" />

- The total number of bookings recorded from (07/2015 -> 08/2017) was **86.113** bookings:
    - `Confirmed Booking`: **62.109 bookings** (**72%**)
    - `Cancelled Bookings`: **24.004 bookings** (**28%**)
1. **Booking Behavior**:
    - Customer booking trends leaned toward the early-mid months of the year, consistently exceeding the average bookings (**March** - **August**)
    
   -> Showing the hotel booking trend focused during the **peak travel seasons** (`spring`, `summer` and `autumn`) which are the best in terms of visiting **Portugal**.

2. **Revenue & Revenue Loss & Cancellations**:
    - Revenue increased steadily over the years, reaching **$34.41M** in 08/2017. However, **24.004** cancelled bookings led to a potential revenue of **$11.48M** (accounted for 33.37% of the total revenue).

3. **Window Booking** & **ADR**:
    - The hotel applied a **flexible seasonal pricing strategy** with ADR (**$68**-**$183**) to optimize revenue. They set lower ADR during the **off season** (`winter`) and increased ADR during the **peak season**.
    - Customers tended to book early, on average (2-4 months before check-in), especially before the peak season when ADRs were lower in the off season.

    -> The hotel attracted **early-booking guests**, particularly during the **peak travel season**.

5. **Region & Market & Deposit Type**:
   - `European guests` accounted for **$30M**(88.54%) of total revenue but also had the highest rate of cancellations (86.84%)
   - The `TA/TO channel ` generated the highest revenue (**$29M** loss) while  contributing to **89.14%** of total cancellations.
   - **95.8%** of all cancellations came from bookings under the `No Deposit` payment option.
     
=> **`The 3 main factors driving the highest revenue loss and cancellations are European guests, TA/TO channel, and the No Deposit policy.`**

## II. Guest Behavior Analysis
<img width="1300" height="728" alt="image" src="https://github.com/user-attachments/assets/91a43e2c-6335-4a82-ab19-59268b7359d8" />

1. **Correlation between Window Booking Bucket & Cancellation Behavior**:
    - Guests' booking behavior shows a clear pattern: the longer the booking window, the higher the cancellation rate.
    - Most cancellations come from within `31-180+ day` bucket, with the `91-180 days` and `180+ days` buckets showing the highest cancellation rates (**60%**-**100%**)

    -> A trend of booking early to secure rooms in advance, then cancelling later.

2. **Correlation between Window Booking Bucket & Length of Stay**:
   - The booking window and stay duration can vary depending on hotel type (Resort, City) and location:
        - Resort Hotel sees a longer stays due to seasonal nature of vacations -> Early-Bird guests stay more then Last-Minute or Medium-Window.
        - City Hotel experience shorter stay might be because of spontaneuos travel plans.  -> Last-Minute and Medium-Window has more stay duration than Early-Birds.

3. **The cancellation rate within peak/off season**:
    - During `spring` and `summer` (the peak travel season) - guests booked and cancelled the most (mainly within `31-90 days` & `91-180 days`) buckets.

4. **Most impacted Guest segment**:
    - Early-Bird guests accounted for majority of cancellations (**78%**-**82%** across hotel types). Mainly **domestict Transient guests** from **Portugal** contributed to cancellations (~30% in City, ~60% in Resort)
    - These cancellations resulted in over $3M in potential revenue loss.

- `Why do guests prefer Long-Window Booking?`
    - They prefer flexibility: booked early to secure their spot, with no deposit involed, they do not need to pay any fees until check-in.
    - Additionally, they could easily to cancel or alter their reservation if something unexpected or find a better deals.
    
=> **`The no Deposit policy, with Early-Bird behavior drives "book early-easy cancel", resulting in high cancellation rates among long-window bookings.`**

## III. Operation Analysis


# 💡Recommendation



