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
5. [Hotel Room Reservation Booking Timeline]()
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
<img width="1452" height="701" alt="image" src="https://github.com/user-attachments/assets/1abb1070-50b8-4a42-944f-1d10a18d2b08" />


# Data Processing by Python & SQL & DAX
1. Using [Python](https://github.com/HuynhTanPhatT/Hotel-Booking-Demand-Window-Booking/blob/main/Python%3A%20Data%20Cleaning%20%26%20EDA/Hotel%20Booking%20Demand%20--%20Data%20Cleaning%20%26%20EDA.ipynb) to: 
    - `Data Cleaning`: check data quality, handle null values, convert data types, detect data anamalies, and remove duplicate records.
    - `Exploratory Data Analysis (EDA)`: identify the **pain points** of stakeholder (**revenue manager**).

2. Using [SQL](https://github.com/HuynhTanPhatT/Hotel-Booking-Demand-Window-Booking/blob/main/SQL%20%E2%80%93%20Answering%20the%20problem%20statement%20in%20the%20Define%20stage%20of%20Design%20Thinking/2.%20Analysis%20Detailed%20Questions.sql) to:
    - Answer detailed questions based on the **pain points** to define `a clearly analytical direction` for the Power Bi dashboard.
3. DAX Calculations & Formulas


# 🧠Design Thinking Process
## 1️⃣Empathize
<img width="1228" height="692" alt="image" src="https://github.com/user-attachments/assets/8f66e40b-81b3-4474-951a-f42ec9d4e6f8" />

## 2️⃣Definde
<img width="1227" height="689" alt="image" src="https://github.com/user-attachments/assets/f41e2b45-09b3-496d-916a-070b71cdac4e" />

## 3️⃣Ideate
<img width="1229" height="688" alt="image" src="https://github.com/user-attachments/assets/5ee1af87-d8ed-45a6-a885-f271d3c6f261" />

## 4️⃣Prototype
This part will be in **Key Insights & Visualization** section.

# 📊Key Insights & Visualizations
## I. Business Overview
<img width="1300" height="734" alt="image" src="https://github.com/user-attachments/assets/efd199ae-b396-4404-ab67-810da8c3bd9f" />

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
<img width="1300" height="733" alt="image" src="https://github.com/user-attachments/assets/8aeddd9a-3547-4ef6-a5fa-2f5bd1178c8d" />

1. **Correlation between Window Booking Bucket & Cancellation Rate**:
    - Guests tended to make reservations ranging from **0-500** days before check-in, with most cancelled bookings concentrated in the `31-90 days` and `91-180 days` buckets.
    - There is a pattern: **the longer the window booking, the higher the cancellation rate, especially within the `91-180 days` and `180+ days` buckets.

2. **Seasonal Patter**:
    - During `spring` and `summer` (the peak travel season) - guests booked and cancelled the most (mainly within `31-90 days` & `91-180 days`).

5. **Guest Group Contribution**:
    - Early-Bird guests accounted for 78-82% of cancellations (based on the hotel type), mainly **domestic Transient guests**.
    - These guests from Portugal recorded (30% of City) & (60% of Resort) %cancellation causing **$1M-$2.26M** in potential revenue loss-> Most of them were first-time booking guests.

- `Why do guests prefer Long-Window Booking?`
    - They prefer flexibility: booked early to secure their spot, with no deposit involed, they do not need to pay any fees until check-in.
    - Additionally, they could easily to cancel or alter their reservation if something unexpected or find a better deals.

    -> No Deposit Policy brings convinience, but also the root cause of the behavior "book early - easy cancell", resulting the rate of cancellations increasing strong in Early-Bird.

## III. Operation Analysis


# 💡Recommendation



