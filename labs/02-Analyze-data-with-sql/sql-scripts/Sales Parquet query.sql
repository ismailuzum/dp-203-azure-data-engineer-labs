
SELECT YEAR(OrderDate) AS OrderYear,
       COUNT(*) AS OrderedItems
FROM
    OPENROWSET(
        BULK 'https://datalakezjxue2n.dfs.core.windows.net/files/sales/parquet/**',
        FORMAT = 'PARQUET'
    ) AS [result]
WHERE [result].filepath(1) IN ('2019', '2020')
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear