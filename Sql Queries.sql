CREATE DATABASE SBP_Bank_Performance_Review;
USE SBP_Bank_Performance_Review;

CREATE TABLE periods (
  period_id   INT PRIMARY KEY,
  period_end  DATE,
  half        VARCHAR(10),  -- 'H1' or 'H2'
  calendar_yr INT
);

CREATE TABLE profitability (
  period_id       INT,
  roe_before_tax  DECIMAL(5,2),
  roe_after_tax   DECIMAL(5,2),
  roa_before_tax  DECIMAL(5,2),
  nim             DECIMAL(5,2),
  cost_to_income  DECIMAL(5,2),
  pbt_rs_bn       DECIMAL(10,2),
  FOREIGN KEY (period_id) REFERENCES periods(period_id)
);

CREATE TABLE asset_quality (
  period_id         INT,
  gross_npl_ratio   DECIMAL(5,2),
  net_npl_capital   DECIMAL(5,2),
  provision_coverage DECIMAL(6,2),
  FOREIGN KEY (period_id) REFERENCES periods(period_id)
);

CREATE TABLE macro_overlay (
  period_id      INT,
  policy_rate    DECIMAL(5,2),
  cpi_inflation  DECIMAL(5,2),
  assets_pct_gdp DECIMAL(5,2),
  FOREIGN KEY (period_id) REFERENCES periods(period_id)
);

CREATE TABLE balance_sheet (
  period_id          INT,
  total_assets_rs_tr DECIMAL(8,2),  -- Total Assets in PKR trillions
  adr                DECIMAL(5,2),  -- Advance-to-Deposit Ratio %
  car                DECIMAL(5,2),  -- Capital Adequacy Ratio %
  FOREIGN KEY (period_id) REFERENCES periods(period_id)
);

INSERT INTO periods (period_id, period_end, half, calendar_yr) VALUES
(1, '2019-06-30', 'H1', 2019),
(2, '2019-12-31', 'H2', 2019),
(3, '2020-06-30', 'H1', 2020),
(4, '2020-12-31', 'H2', 2020),
(5, '2021-06-30', 'H1', 2021),
(6, '2021-12-31', 'H2', 2021),
(7, '2022-06-30', 'H1', 2022),
(8, '2022-12-31', 'H2', 2022),
(9, '2023-06-30', 'H1', 2023),
(10, '2023-12-31', 'H2', 2023),
(11, '2024-06-30', 'H1', 2024),
(12, '2025-06-30', 'H1', 2025);

INSERT INTO macro_overlay (period_id, policy_rate, cpi_inflation, assets_pct_gdp) VALUES
(1, 10.75, 8.27, 49.5),
(2, 13.25, 11.46, 51.2),
(3, 11.00, 10.84, 50.1),
(4, 7.00, 8.83, 53.4),
(5, 7.00, 9.81, 52.8),
(6, 8.13, 10.33, 55.1),
(7, 10.88, 11.41, 54.3),
(8, 15.00, 25.02, 58.0),
(9, 18.58, 28.16, 57.4),
(10, 22.00, 28.71, 61.2),
(11, 21.17, 16.51, 60.5),
(12, 14.13, 5.40, 62.1);

INSERT INTO asset_quality (period_id, gross_npl_ratio, net_npl_capital, provision_coverage) VALUES
(1, 8.80, 1.8, 80.4),
(2, 8.60, 1.7, 81.2),
(3, 9.70, 2.1, 82.0),
(4, 9.20, 1.9, 83.5),
(5, 7.90, 1.5, 84.1),
(6, 7.10, 1.2, 85.0),
(7, 7.50, 1.4, 84.8),
(8, 7.50, 1.4, 85.2),
(9, 7.60, 1.5, 85.5),
(10, 7.50, 1.4, 86.0),
(11, 7.20, 1.2, 87.3),
(12, 7.40, 1.3, 86.9);

INSERT INTO profitability (period_id, roe_before_tax, roe_after_tax, roa_before_tax, nim, cost_to_income, pbt_rs_bn) VALUES
(1,  15.3, 9.2,  0.8, 4.1, 58.2, 120.4),
(2,  16.1, 9.8,  0.9, 4.3, 56.5, 135.2),
(3,  14.2, 8.5,  0.7, 3.9, 59.0, 110.1),
(4,  13.8, 8.1,  0.7, 3.8, 60.1, 105.4),
(5,  15.1, 9.1,  0.8, 4.0, 57.3, 128.6),
(6,  16.5, 10.2, 0.9, 4.4, 55.1, 148.3),
(7,  22.1, 14.5, 1.4, 4.5, 51.2, 138.5),
(8,  25.8, 16.9, 1.6, 5.2, 48.5, 162.0),
(9,  33.4, 22.4, 1.9, 5.8, 44.1, 195.0),
(10, 40.2, 27.1, 2.3, 5.5, 41.3, 235.4),
(11, 24.3, 15.2, 1.5, 5.1, 49.8, 122.0),
(12, 17.2, 10.8, 1.0, 4.6, 54.0, 162.0);

INSERT INTO balance_sheet (period_id, total_assets_rs_tr, adr, car) VALUES
(1,  22.1, 46.8, 16.1),
(2,  23.4, 48.2, 17.0),
(3,  24.2, 46.3, 18.7),
(4,  25.1, 44.8, 18.6),
(5,  26.8, 43.1, 18.3),
(6,  28.2, 46.5, 19.6),
(7,  30.1, 48.9, 18.7),
(8,  32.3, 50.4, 17.0),
(9,  35.2, 41.8, 16.3),
(10, 35.7, 42.1, 16.8),
(11, 53.7, 49.7, 19.1),
(12, 59.5, 35.3, 19.5);

CREATE OR REPLACE VIEW v_full_dashboard AS
SELECT
    p.period_id,
    p.period_end,
    p.half,
    p.calendar_yr,
    pr.roe_before_tax,
    pr.roe_after_tax,
	pr.roa_before_tax,
    pr.nim,
    pr.cost_to_income,
    pr.pbt_rs_bn,
    aq.gross_npl_ratio,
    aq.net_npl_capital,
    aq.provision_coverage,
    bs.total_assets_rs_tr AS `Total Assets (Rs. tr)`,
    bs.adr AS `ADR (%)`,
    bs.car AS `CAR (%)`,
    mo.policy_rate,
    mo.cpi_inflation,
    mo.assets_pct_gdp
FROM periods p
LEFT JOIN profitability     pr ON p.period_id = pr.period_id
LEFT JOIN asset_quality     aq ON p.period_id = aq.period_id
LEFT JOIN balance_sheet     bs ON p.period_id = bs.period_id
LEFT JOIN macro_overlay     mo ON p.period_id = mo.period_id
ORDER BY p.period_end;