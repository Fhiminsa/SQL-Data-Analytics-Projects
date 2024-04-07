SELECT strftime('%Y', DATE(Order_Date)) AS tahun,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore_clean sc
GROUP BY tahun
ORDER BY tahun ASC;