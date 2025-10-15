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

This project analyzses the `Hotel Booking Dataset` to build a PowerBi dashboard including data on transactions (**Booking Status**, **Booking Information**), guest details (**Guest**, **Country**), and booking-related dates (**Check In**, **Reservation Date**). It also includes service-related data (**Meal**, **Room Type**). The goal is to provide the **Revenue Manager** with data-driven insights to:
- Understand the current business performance
- Identify the root cause of cancellations.

🥷 Who is this project for ?
- Revenue Manager

❓ Business Question:
- What's happening overall?
- Which factors contribute most to the cancellations?
- Which hotel type should be prioritize for improvement?
- 
  
# Dataset Description
## 📌Data Source:
- Source:
    - [Kaggle](https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand/data)
    - [Science Direct with Metadata](https://www.sciencedirect.com/science/article/pii/S2352340918315191)
- Size: The `hotel_booking table` contains more than **+100.000** records.
- Format: CSV
  ## 📊Data Structure & Relationships
1️⃣

2️⃣Data Relationship:
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
<img width="1229" height="682" alt="image" src="https://github.com/user-attachments/assets/a80b4dec-298e-4a0b-b89b-a1485607fa4e" />
## 2️⃣Definde
<img width="1237" height="688" alt="image" src="https://github.com/user-attachments/assets/af5590c3-3018-4d6a-aea6-702ae9fba725" />
## 3️⃣Ideate
<img width="1233" height="676" alt="image" src="https://github.com/user-attachments/assets/b2b2164c-2e6e-4c93-a9ac-72c1e1d47095" />
## 4️⃣Prototype
This part will be in **Key Insights & Visualization** section.

# Data Processing by Python & SQL & DAX
1. Using Python to

# 📊Key Insights & Visualizations
## I. Overview

# 💡Recommendation



