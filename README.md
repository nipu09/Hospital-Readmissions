# 🏥 Hospital Readmissions for Diabetic Patients — End-to-End Analytics Project



## 📌 Project Overview

This is a full-cycle healthcare data analytics project analyzing **hospital readmission patterns among diabetic patients**. The project spans data cleaning in SQL, exploratory analysis, Power BI dashboard development, and a business-ready insight report — mimicking a real-world hospital quality improvement initiative.

> **Key Finding:** 46.9% of diabetic patients are readmitted, with 11.3% returning within just 30 days. This project identifies *who* is most at risk and *what* hospitals can do about it.

---

## 🗂️ Project Structure

```
diabetes-readmission-analysis/
│
├── sql_analysis.sql               # Data cleaning + full SQL analysis
├── Diabetes_Readmission_Report.pdf # Business insight report (15 pages)
├── Dashboard_Screenshot.png       # Power BI dashboard preview
└── README.md
```

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **MySQL** | Data cleaning, transformation, EDA |
| **Power BI** | Interactive dashboard & visualizations |
| **MS Word / PDF** | Business insight report |

---

## 🔧 Data Cleaning Steps (SQL)

- Removed irrelevant columns (`weight`, `payer_code`)
- Replaced `'?'` placeholders with meaningful labels (`'Other'`, `'Unknown'`)
- Removed invalid gender records
- Rounded diagnosis codes to nearest integer
- Created a new **Age Group** column (Children → Seniors)

---

## 📊 Analysis Performed

### Demographic Distributions
- Readmission rate by **Age Group**, **Gender**, **Race**

### Clinical Factors
- Readmission vs. **Length of Stay**
- Readmission vs. **Admission Type** (Emergency vs. Planned)
- Readmission vs. **Discharge Disposition**
- Readmission vs. **Insulin Usage**
- Readmission vs. **Number of Medications**
- Readmission vs. **Lab Procedures** and **Diagnoses count**

### Risk Profiling
- Identified highest-risk patient combinations using multi-variable grouping

---

## 📈 Dashboard Highlights (Power BI)

- **11.43K** total unique patients | **14.33K** total encounters
- **5,352** patients readmitted within 30 days (**37.35% readmission rate** among encounters)
- Breakdowns by: Gender, Race, Age Group, Admission Type, Discharge Disposition, Insulin Status, Length of Stay

---

## 🔍 Key Insights

1. **Seniors (65+)** account for 66% of readmissions
2. **50% of admissions are emergency cases** — a signal of poor outpatient diabetes management
3. Patients discharged **home without support** have the highest readmission rates
4. **Polypharmacy** (12–15 medications) peaks readmission risk
5. Patients **not on insulin** are more likely to be readmitted than those on steady insulin therapy

---

## 👤 High-Risk Patient Profile

| Factor | High-Risk Value |
|--------|----------------|
| Age | 70–85 years |
| Admission | Emergency |
| Length of Stay | 2–4 days |
| Medications | 12–15 drugs |
| Insulin | Not using |
| Discharge | Home (no support) |
| Diagnoses | 8–10 comorbidities |

---

## 💡 Strategic Recommendations

- **0–3 months:** Post-discharge nurse calls, home health care expansion, pharmacist medication review
- **3–6 months:** Outpatient diabetes clinic, early insulin initiation program, remote monitoring
- **6–12 months:** Integrated care coordination, patient education & DSME programs

> Projected ROI: Reducing 30-day readmissions from 11.3% → 6.5% could save **₹3–4 crores annually** with a 200–300% ROI.

---

## 📁 Dataset

- Source: [UCI Machine Learning Repository – Diabetes 130-US Hospitals Dataset](https://archive.ics.uci.edu/ml/datasets/Diabetes+130-US+hospitals+for+years+1999-2008)
- Records: ~60,740 diabetic hospitalizations
- Period: 1999–2008

---

## 👨‍💻 Author

** Nipu Moni Dutta **  
Data Analyst | SQL • Power BI • Healthcare Analytics  
📧 [nipumoni991@gmail.com.com]  
🔗 [LinkedIn Profile](https://linkedin.com//in/nipumoni-dutta991/)  


---
