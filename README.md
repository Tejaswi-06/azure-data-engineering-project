# azure-data-engineering-project
# 🚀 Azure Data Warehouse Project using Synapse

## 📖 Overview
Built an end-to-end data warehouse solution using Azure Synapse Analytics and Azure Data Lake Storage following Medallion Architecture (Bronze → Silver → Gold).  
Used external tables over Parquet files to enable efficient querying without data duplication.

---

## 🏗️ Architecture
Bronze (Raw Data) → Silver (Cleaned Data) → Gold (Fact & Dimension Tables) → Analytics

---

## ⚙️ Tech Stack
- Azure Synapse Analytics  
- Azure Data Lake Storage (ADLS Gen2)  
- Azure Data Factory  
- SQL  
- Parquet  

---

## 🗂️ Data Layers

### 🔹 Bronze Layer
- Stored raw data (Parquet files) from source  
- Used for initial data ingestion  

### 🔹 Silver Layer
- Performed data cleaning and transformation  
- Created **enrichedSales** dataset  
- Built external table (SilverTable) in Synapse  

### 🔹 Gold Layer
- Created analytical data model using:
  - **FactOrders**
  - **DimCustomer**
  - **DimProduct**
  - **DimGeography**
  - **DimOrders**

---

## 🔄 Pipeline & Processing
- Created **2 pipelines in Azure Data Factory**:
  - Raw Ingestion Pipeline  
  - Transformation Pipeline  
- Implemented **data flow** for transformation  
- Performed data movement from Bronze → Silver → Gold  

---

## 🧠 Data Engineering Work
- Created **external data sources & file formats**  
- Built **external tables over ADLS (Parquet)**  
- Wrote SQL scripts for:
  - Fact table  
  - Dimension tables  
  - Silver table  
- Implemented **incremental loading**  
- Applied **data modeling (Star Schema)**  

---

## 📊 Final Output
- Successfully built **FactOrders table** with correct results  
- Enabled data analysis using structured warehouse model  

---

## 📊 Sample Output
<img width="1920" height="1080" alt="Screenshot 2026-04-16 131245" src="https://github.com/user-attachments/assets/6e82db3a-93d3-4f24-a274-67c3182d7519" />

<img width="1920" height="1080" alt="Screenshot 2026-04-16 131419" src="https://github.com/user-attachments/assets/e345cdc7-245d-4a85-accc-487fa6568bbc" />

<img width="1920" height="1080" alt="Screenshot 2026-04-16 131501" src="https://github.com/user-attachments/assets/9978ff25-5aa2-4104-86b7-5c7b31448a00" />

---

## 💡 Key Learning
- End-to-end ETL pipeline using Azure  
- External tables in Synapse  
- Data modeling (Fact & Dimension tables)  
- Incremental data loading  
- Medallion Architecture (Bronze, Silver, Gold)  

---

## 👤 Author
**Tejaswi**
