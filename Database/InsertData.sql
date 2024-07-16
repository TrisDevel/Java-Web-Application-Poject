USE ConnguoiShopManagement

INSERT INTO Admin (adName, adAccount, adPass)
VALUES
(N'Bùi Trọng Trí', 'buitrongtri', '123'),
(N'Mai Tuấn Huy', 'maituanhuy', '123'),
(N'Vũ Anh Đức', 'vuanhduc', '123');

INSERT INTO Customer (firstName, lastName, customerAccount, customerPassword, address, gender, email, phoneNumber)
VALUES
(N'Phạm Thị Phương', N'Linh', 'phuonglinh01', '123', N'44 Phan Văn Hớn, P.Tân Thới Nhất, Quận 12, TP HCM', 'Female', 'phuonglinh@gmail.com', '0381234567'),
(N'Nguyễn Minh', N'Anh', 'minhanh02', '123', N'123 Lý Thường Kiệt, P.12, Quận 10, TP HCM', 'Male', 'minhanh@gmail.com', '0382345678'),
(N'Lê Thị Thanh', N'Tâm', 'thanhtam03', '123', N'88 Nguyễn Trãi, P.Bến Thành, Quận 1, TP HCM', 'Female', 'thanhtam@gmail.com', '0383456789'),
(N'Trần Hoàng', N'Nam', 'hoangnam04', '123', N'56 Điện Biên Phủ, P.15, Quận Bình Thạnh, TP HCM', 'Male', 'hoangnam@gmail.com', '0384567890'),
(N'Đỗ Ngọc', N'Hà', 'ngocha05', '123', N'77 Nguyễn Thị Minh Khai, P.6, Quận 3, TP HCM', 'Female', 'ngocha@gmail.com', '0385678901'),
(N'Vũ Anh', N'Dũng', 'anhdung06', '123', N'33 Lê Văn Sỹ, P.13, Quận Phú Nhuận, TP HCM', 'Male', 'anhdung@gmail.com', '0386789012'),
(N'Hoàng Thu', N'Hương', 'thuhuong07', '123', N'99 Hai Bà Trưng, P.Bến Nghé, Quận 1, TP HCM', 'Female', 'thuhuong@gmail.com', '0387890123'),
(N'Bùi Quang', N'Huy', 'quanghuy08', '123', N'45 Nguyễn Thái Học, P.Cầu Ông Lãnh, Quận 1, TP HCM', 'Male', 'quanghuy@gmail.com', '0388901234'),
(N'Phan Thị Kim', N'Liên', 'kimlien09', '123', N'67 Nguyễn Văn Cừ, P.1, Quận 5, TP HCM', 'Female', 'kimlien@gmail.com', '0389012345'),
(N'Trịnh Công', N'Sơn', 'congson10', '123', N'22 Trường Chinh, P.15, Quận Tân Bình, TP HCM', 'Male', 'congson@gmail.com', '0380123456');

INSERT INTO Products (nameProduct, size, type, color, productQuantity, cost, description, images)
VALUES
('Classic White T-shirt', 'S, M, L, XL', 'T-shirt', 'White', 100, 9.99, 'A timeless classic, this white T-shirt is made from soft, breathable cotton, perfect for everyday wear. Its minimalist design makes it a versatile addition to any wardrobe.', 'view/web/img/T-shirt_1.jpg'),
('Basic Purple Hoodie', 'S, M, L, XL', 'Hoodies', 'Purple', 50, 19.99, 'Stay warm and stylish with this basic purple hoodie. Made from a comfortable cotton blend, it features a cozy hood and a relaxed fit.', 'view/web/img/Hoodies_8.png'),
('Sporty Blue Polo', 'S, M, L', 'Polo', 'Blue', 75, 14.99, 'This sporty blue polo shirt is perfect for casual outings or a day on the golf course. Made from lightweight, breathable fabric, it offers comfort and style.', 'view/web/img/Polo_5.png'),
('Urban Balo', 'M, L', 'Balo', 'Deep red', 30, 25.00, 'A spacious and durable backpack, ideal for daily use or travel. It features multiple compartments and padded shoulder straps for comfort.', 'view/web/img/Balo_3.png'),
('Summer Cap', 'M, L', 'Cap', 'Beige', 120, 7.50, 'Light and breathable, this summer cap is perfect for keeping the sun out of your eyes while staying cool. Made from high-quality cotton, it’s a summer essential.', 'view/web/img/Hat_4.png'),
('Classic Black T-shirt', 'S, M, L, XL', 'T-shirt', 'Black', 90, 9.99, 'A staple piece in any wardrobe, this classic black T-shirt is made from soft, durable cotton. Its simple design makes it perfect for layering or wearing on its own.', 'view/web/img/T-shirt_13.png'),
('Winter Hoodie', 'M, L, XL', 'Hoodies', 'Grey', 60, 22.99, 'Keep warm and cozy with this thick, fleece-lined hoodie. Its classic design and comfortable fit make it perfect for chilly winter days.', 'view/web/img/Hoodies_6.png'),
('Casual Polo', 'S, M, L', 'Polo', 'Green', 80, 13.99, 'This casual polo shirt combines style and comfort. Made from a soft, breathable fabric, it’s perfect for both casual and semi-formal occasions.', 'view/web/img/Polo_3.png'),
('Travel Balo', 'M, L, XL', 'Balo', 'Navy', 40, 28.00, 'Designed for travelers, this backpack offers ample space and multiple compartments for organization. It features padded straps and a durable construction.', 'view/web/img/Balo_5.png'),
('Stylish Cap', 'S, M, L', 'Cap', 'Red', 130, 8.00, 'This stylish cap features a sleek design and adjustable fit, making it perfect for everyday wear. It’s made from high-quality materials to ensure durability.', 'view/web/img/Hat_8.png'),
('Polo Shirt', 'S, M, L', 'Polo', 'Yellow', 70, 16.99, 'Elevate your casual style with this yellow striped polo shirt. Made from soft, comfortable fabric, it’s ideal for casual outings or a day at the beach.', 'view/web/img/Polo_7.png'),
('Casual T-shirt', '28, 30, 32, 34', 'T-shirt', 'Petroleum', 60, 29.99, 'Add a touch of sophistication with this petroleum-colored T-shirt. Made from soft, breathable fabric, it offers a comfortable fit and timeless style.', 'view/web/img/T-shirt_6.png'),
('Hoodies', 'M, L, XL', 'Hoodies', 'Blue', 45, 69.99, 'Stay warm and stylish with this blue hoodie. Made from premium fabric, it features a classic design and is perfect for casual wear.', 'view/web/img/Hoodies_4.png'),
('Backpack', 'M, L', 'Balo', 'Torquoise', 50, 35.00, 'Carry your essentials in style with this versatile turquoise backpack. It features multiple compartments, padded straps, and a sleek, modern design, ideal for daily use or travel.', 'view/web/img/Balo_1.png'),
('Cap', '7, 8, 9, 10', 'Cap', 'White', 100, 19.99, 'Complete your look with this stylish white cap. It features a comfortable fit and a classic design, perfect for everyday wear.', 'view/web/img/Hat_9.png'),
('T-shirt', 'S, M, L', 'T-shirt', 'Dark Brown', 80, 12.99, 'Stay comfortable and stylish with this dark brown T-shirt. Made from breathable fabric, it offers a perfect fit and great mobility for any activity.', 'view/web/img/T-shirt_10.png'),
('Hoodies', 'M, L, XL', 'Hoodies', 'Brown', 35, 39.99, 'Stay stylishly dry in this waterproof hooded hoodie. It features a sleek design, adjustable hood, and breathable fabric, perfect for tackling rainy weather.', 'view/web/img/Hoodies_2.png'),
('Party T-shirt', 'S, M, L, XL', 'T-shirt', 'yellow', 65, 49.99, 'Turn heads at your next event with this elegant party T-shirt. Made from high-quality fabric, it features a flattering fit and stunning design.', 'view/web/img/T-shirt_8.png'),
('Polo Shirt', 'S, M, L, XL', 'Polo', 'White', 85, 24.99, 'This white polo shirt is perfect for any casual or semi-formal occasion. Made from premium cotton, it features a classic fit and crisp, clean lines.', 'view/web/img/Polo_1.png'),
('Travel Backpack', 'M, L', 'Balo', 'Grey', 25, 55.00, 'This durable travel backpack offers ample space and a sleek design. It features comfortable shoulder straps, multiple compartments for organization, and high-quality materials for long-lasting use.', 'view/web/img/Balo_7.png'),
('Beanie', '7, 8, 9, 10', 'Cap', 'Orange', 110, 29.99, 'This orange beanie is designed for comfort and style. Made from soft, warm fabric, it features a snug fit and a vibrant color that stands out.', 'view/web/img/Hat_1.png'),
('Hoodies', 'S, M, L', 'Hoodies', 'White', 55, 18.99, 'This cozy white hoodie is perfect for layering. Made from soft, warm fabric, it features a stylish design and a comfortable fit.', 'view/web/img/Hoodies_1.png'),
('Casual T-shirt', 'S, M, L', 'T-shirt', 'Blue', 40, 26.99, 'This blue casual T-shirt features a stylish design and a comfortable fit. It’s perfect for pairing with jeans or shorts for a casual look.', 'view/web/img/T-shirt_9.png'),
('Casual T-shirt', 'S, M, L', 'T-shirt', 'Purple', 70, 44.99, 'These durable casual T-shirts are designed for comfort and protection. They feature a rugged construction, cushioned insole, and slip-resistant sole.', 'view/web/img/T-shirt_7.png'),
('T-shirt', 'S, M, L', 'T-shirt', 'Pink', 90, 14.99, 'This pink T-shirt is perfect for a casual outing. Made from soft, breathable fabric, it offers a comfortable fit and great style.', 'view/web/img/T-shirt_5.png'),
('T-shirt', 'S, M, L', 'T-shirt', 'Brown', 120, 9.99, 'This brown T-shirt features a sleek design and durable construction. It’s perfect for adding a polished touch to any outfit.', 'view/web/img/T-shirt_2.png'),
('T-shirt', '28, 30, 32, 34', 'T-shirt', 'Grey', 75, 32.99, 'This grey T-shirt is perfect for any casual occasion. Made from high-quality fabric, it offers a comfortable fit and timeless style.', 'view/web/img/T-shirt_4.png'),
('Hiking Backpack', 'M, L', 'Balo', 'Green', 35, 42.00, 'This rugged hiking backpack is designed for outdoor adventures. It features multiple compartments, padded straps, and a durable construction.', 'view/web/img/Balo_10.png'),
('Printed T-shirt', 'S, M, L, XL', 'T-shirt', 'White/Red', 85, 11.99, 'This colorful printed T-shirt is perfect for adding a pop of color to your wardrobe. Made from soft, comfortable fabric, it offers a relaxed fit and stylish design.', 'view/web/img/T-shirt_11.png'),
('Knit Sweater', 'M, L', 'Hoodies', 'Green', 60, 27.99, 'This warm knit sweater is perfect for layering on chilly days. Made from soft, cozy fabric, it features a classic design and comfortable fit.', 'view/web/img/Hoodies_3.png'),
('Baseball Cap', 'S, M, L', 'Cap', 'Blue', 140, 6.99, 'This classic baseball cap is perfect for keeping the sun out of your eyes. Made from high-quality materials, it features an adjustable fit and stylish design.', 'view/web/img/Hat_10.png');


INSERT INTO Orders (idCustomer, startDate, paymentid)
VALUES

GO
INSERT INTO Payments (payment_method )
VALUES 
(N'Cash'),
(N'Credit Card')
select*from Products
select*from Orders
