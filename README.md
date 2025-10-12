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

  - Understand the current business performance
  - 

🥷 Who is this project for ?
- Revenue Manager

❓ Business Question:

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
| `FactTable` | `DimBookingStatus` | `booking_status_id` | Many-to-One (Each booking has one booking status, one reservation status, and one deposit type defined in this dimension) |
| `FactTable` | `DimBookingInfo` | `booking_info_id` | Many-to-One (Each booking belongs to one booking info record (distribution channel, market segment, hotel type) |
| `FactTable` | `DimCountry` | `country_code` | Many-to-One (Each booking is made by a customer from one country; multiple bookings can come from the same country) |
| `FactTable` | `DimCustomer` | `custom_segment_id` | Many-to-One (Each booking belongs to one customer type or segment (e.g., repeated guest or new guest) |
| `FactTable` | `DimService` | `service_id` | Many-to-One (Each booking includes one combination of reserved room, meal type, and assigned room category) |
| `FactTable` | `DimBucket` | `bucket_id` | Many-to-One (Each booking is grouped into one bucket (e.g., group type or value segment) |
| `FactTable` | `DimDate` | `reservation_date` | Many-to-One (Each booking has one reservation date, which links to the full calendar dimension for time-based analysis.) |

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



