Pakistan Banking Sector Performance Dashboard

A data analytics project that tracks how Pakistan's banking industry performed between 2019 and 2025, built using official data from the State Bank of Pakistan (SBP).

What Is This Project?

Every six months, the State Bank of Pakistan publishes a report showing how the entire banking sector is doing how much profit banks made, how many loans went bad, how much money they are holding, and so on. This project takes that data, organises it in a database, and turns it into a visual dashboard that anyone can read and understand.

The goal was to answer one question: what happened to Pakistan's banks when interest rates went from 7% all the way up to 22% — and then back down again?


Why Does This Matter?

Between 2021 and 2023, the State Bank of Pakistan raised interest rates sharply to fight inflation. This was the biggest rate increase in Pakistan's history. Higher interest rates affect everyone — businesses borrowing money, people taking home loans, and especially banks themselves.

This dashboard shows exactly what happened to the banking sector during that period, using real official numbers not guesses or estimates.


What the Dashboard Found

1. Banks made record profits when interest rates were high
When the SBP raised rates, banks started charging much more interest on loans. Their profit margins (called Net Interest Margin) jumped from 4.0% in 2021 to 5.8% in mid-2023. Returns for bank shareholders (ROE) hit a peak of 27.1% in late 2023 the highest in six years.

2. Bad loans stayed under control despite economic pressure
You might expect that very high interest rates would cause many borrowers to stop repaying their loans. That happened a little bad loans (called NPLs) went up slightly but banks had saved up enough emergency cushions (called Provision Coverage) to absorb that stress. The cushion actually grew from 80% to 87% over this period.

3. A new government rule changed how banks lend money
In 2024, SBP introduced a rule that taxed banks if they kept too much money in government bonds instead of lending it out to businesses. This pushed banks to lend more. The Advance-to-Deposit Ratio (basically how much of customers' deposits banks are lending out) rose above 50% for a period before falling back to 35% when the rule environment changed.

4. Bank profits are now coming down as interest rates fall
SBP started cutting rates in 2024. By mid-2025 the rate was back down to 14%. As a result, bank profit margins are compressing NIM dropped from 5.8% back to 4.6% and shareholder returns fell from 27.1% to 10.8%. The easy profit era is ending.


Dashboard Pages

1. Sector Health Overview: The big picture overall health of the sector, profit trends, and how well-capitalised banks are.
2. Asset Quality & Credit Risk: How many loans are going bad, how covered banks are against losses, and how profits moved over time
3. Macro & Interest Rate Impact: How rising and falling interest rates directly affected bank earnings and lending behaviour
4. Recommendations: Four practical suggestions for what Pakistan's banks should do next, based on the data


Where the Data Comes From

1. SBP Half-Yearly Performance Reviews:
Official reports published every 6 months by Pakistan's central bank, showing the health of all scheduled banks combined

2. SBP EasyData Portal:
The SBP's own data website, used to download interest rate and inflation history

This project uses only sector-wide numbers meaning no individual bank is named or analysed. All numbers represent the entire Pakistan banking industry combined. This makes the project relevant to anyone working at any bank in Pakistan.


What Numbers Are Tracked

How profitable are banks?


Return on Equity (ROE): How much profit banks make compared to what shareholders invested
Net Interest Margin (NIM): The difference between what banks earn on loans vs what they pay on deposits
Cost-to-Income Ratio: How efficiently banks are running their operations
Profit Before Tax: Total sector profits in PKR billions


How healthy are the loans?


Gross NPL Ratio: What percentage of loans are not being repaid
Provision Coverage: How much emergency buffer banks have set aside against bad loans


How big is the sector?


Total Assets: The total size of Pakistan's banking system in PKR trillions
Advance-to-Deposit Ratio (ADR): How much of customer deposits are being lent out


How safe are the banks?


Capital Adequacy Ratio (CAR): Whether banks have enough capital to survive losses (SBP requires minimum 11.5%)


What is the economy doing?


SBP Policy Rate: The interest rate SBP sets, which drives all other rates
CPI Inflation: How fast prices are rising in Pakistan



Tools Used to Build This

MySQL: Stored and organised all the data in a structured database with 5 linked tables
Microsoft Excel: Connected to the database and used as the data preparation layer
Power BI: Built the 4-page interactive dashboard with charts, KPI cards, and filters


How the Data Flows

SBP PDFs → manually entered into MySQL → Excel pulls from MySQL automatically → Power BI reads from Excel → Dashboard

Every time new SBP data is published, the pipeline can be refreshed in minutes.


Files in This Repository

pakistan-banking-sector-dashboard

README.md: This file project explanation
Sql_Queries.sql: All database setup and data in one file
final_Merged_data_dashboard.xlsx: The prepared data file Excel/Power BI read from
power bi: Interactive Dashboard Link



Skills This Project Demonstrates

Database (MySQL)
Building a proper relational database 5 linked tables, data rules to prevent errors, saved queries called views, and advanced SQL functions to compare data across time periods.

Data Pipeline (Excel + ODBC)
Connecting Excel directly to a live database so that data updates automatically with one click instead of copying and pasting manually.

Dashboard Design (Power BI)
Building a 4-page interactive report with KPI cards, trend charts, scatter plots, gauge charts, and written analysis designed so both technical and non-technical people can read it.

Financial Understanding
Knowing which banking metrics matter, what they mean, and how to tell a coherent story about what the data is showing not just displaying numbers.
