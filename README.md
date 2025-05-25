# Project Ronald Pump 💪

**Track. Analyze. Transform.**

*Project Ronald Pump* is a fitness tracking initiative designed to document and analyze our weightlifting journey using our gym's BIA (Bioelectrical Impedance Analysis) scanner. Through consistent data collection and dedication, we're turning raw metrics into meaningful insights to fuel progress and gains.

---

## 🏋️ Purpose

- Track body composition and fitness data using our gym's BIA scanner  
- Visualize progress over time with charts and analytics  
- Stay accountable and motivated with consistent data updates  
- Build a simple, transparent system for personal performance tracking  

---

## 📊 Features

- BIA scan data logging (weight, body fat %, muscle mass, etc.)  
- Progress tracking and visualizations  
- Optional goal setting and milestone tracking  
- Lightweight and easy to use  

---

## 🧠 Data Architecture

This project uses a lightweight, serverless architecture to automatically process and store BIA scan data:

## 🧭 Architecture Overview (Initial Thoughts)

## MVP Data/System Architecture

![](/Images/ronald_pump_architecture.png)


## 🧬 BIA Scan Processing Pipeline (Event-Driven)

An end-to-end serverless architecture for processing BIA scan PDFs using AWS, dbt, and Google Sheets.

---

### 1. 📥 Upload (Evolt Active Scan)
A **PDF file** is uploaded to an **Amazon S3 bucket**.

---

### 2. ⚙️ Lambda Trigger
The upload triggers an **AWS Lambda** function (Docker-based) to process the file.

---

### 3. 🧾 PDF Processing
The Lambda function uses the Python library **`pdfplumber`** to extract data from the PDF and converts it into a structured **JSON payload**.

---

### 4. 🗃️ Aurora Serverless Storage
The raw JSON payload is stored in **Amazon Aurora Serverless (PostgreSQL)** — acting as the **Bronze layer** for raw backups and queryable data.

---

### 5. 🔁 Orchestration
A second **AWS Lambda function** triggers a **containerized dbt run** on **ECS Fargate**, using an image pulled from **Amazon ECR**.

---

### 6. 🛠️ Transformation (dbt + ECS)

The ECS task executes `dbt run`, which:

- Reads from the `raw_data` table in Aurora (Bronze layer)
- Applies version-controlled **dbt models** to unnest and normalize the JSON
- Writes cleaned, structured data into new tables (Silver/Gold layers)

✅ **Serverless orchestration** (Lambda + ECS Fargate)  
✅ **Modular, Git-driven transformation logic** (dbt in GitHub)  
✅ **Flexible scaling** for complex or long-running jobs

---

### 7. 📤 Export to Google Sheets
The final transformed metrics are exported to a **Google Sheet** using the **Google Sheets API**, making them easy to share or review.

---

## ✅ Highlights

- Fully **event-driven** (S3-triggered processing)
- Uses **serverless AWS components**: Lambda, ECS Fargate, Aurora
- **dbt-powered transformations** for reliable, testable data modeling
- Minimal cost, ideal for **individuals or small teams**


---

## 🚀 Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/project-ronald-pump.git
   cd project-ronald-pump
   ```