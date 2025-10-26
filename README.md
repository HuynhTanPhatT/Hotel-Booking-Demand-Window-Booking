# 🏩Hotel Booking Cancelaltion Impact Analysis (07/2015 - 10/2017)
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
5. [Key Insights & Visualizations]()
6. [Recommendations]()
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

Thiếu 1 ảnh bối cảnh của bài này -> thiết kế ở phần README trong 
# Dataset Description
## 📌Data Source:
- Source:
    - [Kaggle](https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand/data)
    - [Science Direct with Metadata](https://www.sciencedirect.com/science/article/pii/S2352340918315191)
- Size: The `hotel_booking_table` contains more than **+100.000** records.
- Format: CSV
## 📊Data  Relationship
<img width="1452" height="701" alt="image" src="https://github.com/user-attachments/assets/1abb1070-50b8-4a42-944f-1d10a18d2b08" />

# 🧠Design Thinking Process
## 1️⃣Empathize
<img width="1235" height="685" alt="image" src="https://github.com/user-attachments/assets/2d1e02ce-6b3f-4614-a1e4-213084bd728d" />

## 2️⃣Definde
<img width="1227" height="689" alt="image" src="https://github.com/user-attachments/assets/f41e2b45-09b3-496d-916a-070b71cdac4e" />

## 3️⃣Ideate
<img width="1232" height="689" alt="image" src="https://github.com/user-attachments/assets/7eba959b-7c86-4b1b-bcce-d070cdfe27e6" />

## 4️⃣Prototype
This part will be in **Key Insights & Visualization** section.

# Data Processing by Python & SQL & DAX
1. Using [Python](https://github.com/HuynhTanPhatT/Hotel-Booking-Demand-Window-Booking/blob/main/Python%3A%20Data%20Cleaning%20%26%20EDA/Hotel%20Booking%20Demand%20--%20Data%20Cleaning%20%26%20EDA.ipynb) to: 
    - `Data Cleaning`: check data quality, handle null values, convert data types, detect data anamalies, and remove duplicate records.
    - `Exploratory Data Analysis (EDA)`: identify the **pain points** of stakeholder (**revenue manager**).

2. Using [SQL](https://github.com/HuynhTanPhatT/Hotel-Booking-Demand-Window-Booking/blob/main/SQL%20%E2%80%93%20Answering%20the%20problem%20statement%20in%20the%20Define%20stage%20of%20Design%20Thinking/2.%20Analysis%20Detailed%20Questions.sql) to:
    - Answer detailed questions based on the **pain points** to define `a clearly analytical direction` for the Power Bi dashboard.
3. DAX Calculations & Formulas

# 📊Key Insights & Visualizations
## I. Overview
<img width="1301" height="728" alt="image" src="https://github.com/user-attachments/assets/58453a9f-338f-479b-bb4d-96497760485a" />

- The total number of bookings recorded from (07/2015 -> 08/2017) was **86.113** bookings:
    - `Confirmed Booking`: **62.109 bookings** (**72%**)
    - `Cancelled Bookings`: **24.004 bookings** (**28%**)
1. **Booking Behavior**:
    - Customer booking trends leaned toward the early-mid months of the year, consistently exceeding the average bookings (**March** - **August**) -> Showing the hotel booking trend focused during the **peak travel seasons** (`spring`, `summer` and `autumn`) which are the best in terms of visiting **Portugal**.

2. **Revenue & Revenue Loss & Cancellations**:
    - Revenue increased steadily over the years, reaching **$34.41M** in 08/2017. However, **24.004** cancelled bookings led to a potential revenue of **$11.48M** (accounted for 33.37% of the total revenue).

3. **Window Booking** & **ADR**:
    - The hotel applied a **flexible seasonal pricing strategy** with ADR (**$68**-**$183**) to optimize revenue. They set lower ADR during the **off season** (`winter`) and increased ADR during the **peak season**.
    - Customers tended to book early, on average (2-4 months before check-in), especially before the peak season when ADRs were lower in the off season.

    -> The hotel attracted **early-booking guests**, particularly during the **peak travel season**.

5. **Region & Market & Deposit Type**:
   - `European guests` accounts for **$30M**(88.54%) of total revenue but also had the highest rate of cancellations (86.84%)
   - The `TA/TO channel ` generated the highest revenue (**$29M** loss) while  contributing to **89.14%** of total cancellations.
   - **95.8%** of all cancellations came from bookings under the `No Deposit` payment option.
     
=> **`The 3 main factors driving the highest revenue loss and cancellations are European guests, TA/TO channel, and the No Deposit policy.`**

## II. Guest Behavior Analysis
Dựa trên 3 main factors, chính tôi sẽ tìm hiểu hành vi khách hàng của nhóm chiếm phần lớn % cancell này để tôngw hợp và dựa trên để đưa ra giải pháp (short solution) cho stakeholder.



# 💡Recommendation



