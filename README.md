# 🏩Hotel Booking Cancelaltion Impact Analysis (07/2015 - 10/2017)
- Author: Huỳnh Tấn Phát
- Date: 10/2025
- Tool Used: `Python`, `SQL`, `PowerBi`
    - Python: Pandas, Matplotlib, Numpy, Datetime, Seaborn
    - SQL: CTEs, Joins, Case, aggregate functions
    - PowerBi: Dax, calculated columns, data visualizaition, data modeling
# ReadMe - Table Of Contents (TOCs)
1. [Background & Overview]()
2. [Dataset Description & Data Structure]()
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

# Dataset Description
## 📌Data Source:
- Source:
    - [Kaggle](https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand/data)
    - [Science Direct with Metadata](https://www.sciencedirect.com/science/article/pii/S2352340918315191)
- Size: The `hotel_booking table` contains more than **+100.000** records.
- Format: CSV
  ## 📊Data  Relationships
Data Relationship:
<img width="1452" height="701" alt="image" src="https://github.com/user-attachments/assets/1abb1070-50b8-4a42-944f-1d10a18d2b08" />

| From Table | To Table | Join Key | Relationship Type |
|-------------|-----------|-----------|------------------|
| `FactTable` | `DimBookingStatus` | `booking_status_id` | Many-to-One (each booking record includes a single booking status, reservation status, deposit type) |
| `FactTable` | `DimBookingInfo` | `booking_info_id` | Many-to-One (each booking belongs to one booking info record (distribution channel, market segment, hotel type)) |
| `FactTable` | `DimCountry` | `countr_code` | Many-to-One (each booking is made by a customer from one country; many bookings can make by the same country) |
| `FactTable` | `DimCustomer` | `customer_segment_id` | Many-to-One (each booking belongs to one customer type) |
| `FactTable` | `DimService` | `service_id` | Many-to-One (each booking record incudes a resered room, meal type)|
| `FactTable` | `DimBucket` | `bucket_id` | Many-to-One (each booking is grouped into one bucket based on "window booking")|
| `FactTable` | `DimDate` | `check_in` | Many-to-One (each booking has one check-in date, which links to the calendar dimension for time-based analysis.) |

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
1. Using [Python](https://github.com/HuynhTanPhatT/Hotel-Booking-Demand-Window-Booking/blob/main/Python%3A%20Data%20Cleaning%20%26%20EDA/Hotel%20Booking%20Demand%20--%20Data%20Cleaning%20%26%20EDA.ipynb)
    - Clean **booking records**: 

# 📊Key Insights & Visualizations
## I. Overview
<img width="1300" height="732" alt="image" src="https://github.com/user-attachments/assets/7bda3751-a01d-49e7-8d60-d59226934e34" />


## II. Guest Behavior Analysis
# 💡Recommendation



