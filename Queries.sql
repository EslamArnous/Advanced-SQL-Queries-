/* Query 1 */
SELECT CUS.CustomerId,
       SUM(Total) Total_Spent
FROM Customer CUS
JOIN Invoice INV ON CUS.CustomerId = INV.CustomerId
GROUP BY CUS.CustomerId
ORDER BY Total_Spent DESC
LIMIT 10
-------------------------------------------------------------------------

/* Query 2 */
SELECT DISTINCT CUS.Email,
                CUS.FirstName,
                CUS.LastName,
                G.Name
FROM Customer CUS
JOIN Invoice INV ON CUS.CustomerId = INV.CustomerId
JOIN InvoiceLine INVL ON INV.InvoiceId = INVL.InvoiceId
JOIN Track T ON INVL.TrackId = T.TrackId
JOIN Genre G ON T.GenreId = G.GenreId
WHERE G.Name = 'Rock'
ORDER BY CUS.Email
-------------------------------------------------------------------------

/* Query 3 */
SELECT AR.Name,
       COUNT(T.TrackId) Songs
FROM Artist AR
JOIN Album AL ON AR.ArtistId = AL.ArtistId
JOIN Track T ON AL.AlbumId = T.AlbumId
JOIN Genre G ON T.GenreId = G.GenreId
WHERE G.Name = 'Rock'
GROUP BY AR.ArtistId,
         AR.Name
ORDER BY Songs DESC
LIMIT 10
-------------------------------------------------------------------------

/* Query 4 */
SELECT AR.Name,
       SUM(INVL.UnitPrice * INVL.Quantity) AmountSpent,
       CUS.CustomerId,
       CUS.FirstName,
       CUS.LastName
FROM Artist AR
JOIN Album AL ON AR.ArtistId = AL.ArtistId
JOIN Track T ON AL.AlbumId = T.AlbumId
JOIN InvoiceLine INVL ON T.TrackId = INVL.TrackId
JOIN Invoice INV ON INV.InvoiceId = INVL.InvoiceId
JOIN Customer CUS ON CUS.CustomerId = INV.CustomerId
WHERE AR.Name = 'Iron Maiden'
GROUP BY AR.Name,
         CUS.CustomerId,
         CUS.FirstName,
         CUS.LastName
ORDER BY AmountSpent DESC
