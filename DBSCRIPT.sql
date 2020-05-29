USE master
IF EXISTS(select * from sys.databases where name='PlantFinderDB')
ALTER DATABASE PlantFinderDB  SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

DROP DATABASE IF EXISTS PlantFinderDB
GO
CREATE DATABASE PlantFinderDB
GO
Use PlantFinderDB
GO
DROP TABLE IF EXISTS Users;
GO

CREATE TABLE Users (
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
UserName varchar (80) NOT NULL,
Password varchar (80) NOT NULL,
Email varchar (500) NOT NULL,
Fname varchar (80) NOT NULL,
Lname varchar (80) NOT NULL,
);
GO

INSERT INTO users(username, password, email, fname, lname)
VALUES
('LBrock', 'BestCook101', 'LBrock@gmail.com', 'Laura', 'Brock'),
('TBarron', 'BestDad101', 'TBarron@gmail.com', 'Tom', 'Barron'),
('BSpencer', 'BestInsta202', 'BSpencer@instagram.com', 'Brea', 'Spencer'),
('MDuBose', 'BestDogMom202', 'iloveriley@gmail.com', 'Michael', 'DuBose')

DROP TABLE IF EXISTS Plants;
GO
CREATE TABLE Plants (
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Title varchar (80) NOT NULL,
Image varchar (500) NOT NULL,
Description varchar (500) NOT NULL,
);
GO

INSERT INTO Plants (Title, Image, Description)
VALUES
('ZZ Plant','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1551638261-gallery_the-sill_zz-plant-plant_3_4_7fcfbb35-419e-42d3-8cb5-3d7f8295312b_2230x.progressive.jpg?crop=1xw:0.773xh;center,top&resize=768:*', 'If you live in a lower light environment, it’s suggested to get a ZZ Plant because they''re drought tolerant and incredibly low maintenance. Many cultures believe a ZZ Plant "symbolizes prosperity and friendship," making it a great housewarming gift. Not pet friendly.'),
('Spider Plant','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1551637815-61hpJO6WnaL.jpg?crop=0.934xw:1xh;center,top&resize=768:*','These plants need bright light, but no direct sun, so they''re perfect to put in a room with big windows. Just keep it away from the windowsill.  this plant is fun to have around because it grows "baby spiders" (spiderettes), which can be easily propagated. It''s also a strong air purifier, removing both formaldehyde and xylene. '),
('Rubber Tree','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1551638026-screen-shot-2019-03-03-at-1-31-58-pm-1551637988.png?crop=0.737xw:0.570xh;0.120xw,0.349xh&resize=768:*','If you have a tendency to forget about your plants, or are new to the whole "plant parent" lifestyle, get a rubber tree.  they''re tolerant to some degree of neglect and handle under-watering better than over-watering. A rubber tree needs bright light (can take some partial sunlight) and a good amount of space around for it to be happy, grow, and remove carbon dioxide from your home.'),
('Bird’s Nest Fern','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1551638216-screen-shot-2019-03-03-at-1-36-08-pm-1551638188.png?crop=1.00xw:0.774xh;0,0.141xh&resize=768:*','Having a bird’s nest fern in your home is an instant conversation starter, thanks to its bright green, ripple-edged fronds. You''ll score major cool points with this signature-looking plant, especially if you put it in a hanging planter. Because the bird''s nest fern thrives in medium indirect light and a humid environment it would do great in a bathroom with a shower, as long as there are windows that receive natural light.'),
('Peace Lily','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1551638497-51m6Fl9XFvL.jpg?crop=1.00xw:0.944xh;0,0.0240xh&resize=768:*','If you already have experience keeping an indoor plant alive, then it might be time to add a peace lily into the mix. this one requires more attention compared to other indoor plants. That means keeping it moist without over-watering and placing it in a bright but shady spot. One thing to note: "The peace lily''s flowers have pollen, so this plant might not be the best choice for people who struggle with allergies.'),
('Philodendron Green','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1551638604-gallery_the-sill_philodendrongreen_1fd7c245-8117-49da-9def-cb68e63fc797_2230x.progressive.jpg?crop=0.380xw:0.294xh;0.0128xw,0.463xh&resize=768:*','This makes it a great plant if you''ve got high shelves, or want to add a hanging planter to your home décor. It''s incredibly easy to prune and propagate, if you prefer a more compact shape.  It’s also one of the easiest houseplants to grow. Though it''s not the most air-purifying plant out there, philodendrons do filter formaldehyde. Not too shabby for a low-maintenance plant that''s perfect for newbies.'),
('Money Tree','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579287543-1567018001734_20190828-1567018004621.jpg?crop=0.668xw:1.00xh;0.186xw,0&resize=768:*','Best for good vibes. A 6-foot braided trunk is eye-catching in any room, but this plant''s biggest selling point is the good fortune it''s said to bring to you and your wallet. Keep your money tree in indirect sunlight (a.k.a. near a window, but not in front of it) and away from the vent, since intense gusts of hot or cool air will damage the leaves.'),
('Olive Tree','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579285673-white-olive-tree-1579285661.jpg?crop=1.00xw:0.858xh;0,0.0807xh&resize=768:*','Olive trees typically live eight to nine years in a pot as long as they can get all the sunlight they want.  It’s recommended to move your tree outside onto your patio or balcony or wherever it''s sunny to soak it all in. If its branches start blocking the TV, don''t be afraid to prune it to help it keep its shape.'),
('Monstera','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579635353-monstera-1579635342.jpg?crop=0.809xw:1.00xh;0.127xw,0&resize=768:*','This is the type of plant that likes being the center of attention, so make sure you give it plenty of room to grow (in every direction). If you give it the bright, yet indirect sunlight, it''ll quickly grow up to 3 feet tall and just as wide. As it grows, "its leaves will develop long ribbons and holes, resembling Swiss cheese, giving it a distinct, graphic appearance. The Monstera''s not pet-friendly, so if you''ve got furry roommates, opt for something else.'),
('Chinese Fan Palm','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1580834475-chinese-fan-palm-1580834463.jpg?crop=0.8135683760683761xw:1xh;center,top&resize=768:*','Best for pet owners. It loves a bright spot, but be sure to avoid bright sun rays on its fronds.  If you want to really feel like a plant pro, instead of only watering it when you see its soil has dried out, spray it with a little mist every now and again, since it likes humidity. Your palm with thank you.'),
('Fiddle Leaf Fig','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579637154-fiddle-leaf-fig-1579637142.jpg?crop=0.8106995884773663xw:1xh;center,top&resize=768:*','First, it can fill up any sad corners or drab walls in your home since it can grow between 4 and 5 feet. Next, it purifies the air by taking in formaldehyde. And finally, even if you''re not working with the perfectly warm and humid temps this plant loves, it''ll still manage to survive.'),
('Norfolk Pine','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1580834733-norfolk-pine-1580834724.jpg?crop=0.809xw:1.00xh;0.130xw,0&resize=768:*','This look is especially "popular during the holidays as an alternative to a traditional Christmas tree, but makes an elegant statement all year round." And even though it''s called a pine, this plant is actually native to the tropical South Pacific. To keep yours looking fresh, position it for bright, direct sun.'),
('Bird of Paradise','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1580834641-birds-of-paradise-1580834630.jpg?crop=0.8083333333333333xw:1xh;center,top&resize=768:*','The Bird of Paradise is considered the queen of the indoor plant world. Once you do the hard work of getting this hefty plant into your house, you won''t regret it since it''ll add "a rich, tropical flair to your space. Bird of Paradise adapts to pretty much all conditions from low, to indirect, to super bright sunlight. Just be sure to mist it from time to time—while this plant is easygoing, it still needs a little humidity since it''s native to the tropics.'),
('Dracaena Lisa','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579636313-dracaena-lisa-cubico-white_5ff7b831-3326-4126-b659-bfea6d5db8a1_2000x.jpg?crop=0.667xw:1xh;center,top&resize=768:*','This plant doesn''t mind that window in your apartment that faces a wall because it thrives in low light, artificial light, and indirect sunlight as it grows to its comfy 5 to 8 feet. This plant doesn''t need much—just hydrate it about every 10 to 14 days. And all you have to keep it looking its best is trim it now and again.'),
('Corn Plant','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579636375-corn-plant-delta-charcoal_2000x.jpg?crop=0.668xw:1.00xh;0.0369xw,0&resize=768:*','High ceilings? This is the plant for you. In addition to making do with pretty much any growing conditions (artificial lighting, low lighting, bright, indirect lighting), it''s also an air purifier. it only needs water about every two weeks. What it does need, though, is regular trimming, as it grows more than 6 feet tall.'),
('Dragon Tree','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579636455-dracaena-marginata-open-weave-braid-classico-charcoal_a73e0a5e-9cf4-421f-8b02-95c0fadee18d_2000x.jpg?crop=0.668xw:1.00xh;0.139xw,0&resize=768:*','Bright green paddle-like pads grow on top of each other, making for a unique plant structure. This guy will make any room look elevated with little to no effort. The Prickly Pear is perfect for those who want more green in their environment, but have limited time to care for plants.'),
('Yucca Plant','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579636650-yucca-plant-cubico_0771a49a-46db-4324-8e77-3153ed7280aa_2000x.jpg?crop=0.668xw:1.00xh;0.0401xw,0&resize=768:*','Trying to dress up your space? Go for this 7-foot-tall "bold and striking plant with straight angular edges," "This plant doubles as artwork and is a great addition to a modern minimalist interior as a stand-alone plant." Other than being a top-notch decor element, the yucca plant removes toxins from the air, it''s pet friendly, and it''s drought-tolerant. What more could you ask for?'),
('Majesty Palm','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579708926-majesty-plam-delta-white_2000x.jpg?crop=0.668xw:1.00xh;0.268xw,0&resize=768:*','Lush foliage and a commanding shape make the majesty palm a prime choice (and if you’’ve got pets, they''ll love it, too). And while it doesn''t quite call for backbreaking maintenance, you''ll have to keep it in a sunny spot, water it pretty regularly, mist it, and trim it. Set a reminder in your phone to care for it and watch it reach its peak of 5 to 10 feet.'),
('Burgundy Rubber Tree Plant','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1580414541-the-sill_rubber-tree_gallery_medium_all_all_03_1440x.jpg?crop=0.559xw:0.649xh;0.338xw,0.0322xh&resize=768:*','Who said all your plants had to be green? The burgundy rubber tree''s thick, glossy leaves that range from a rich burgundy red to almost black are a 3-foot-tall decor standout, and they can handle most indoor conditions. It is strong and sturdy but doesn’t like change—so pick a bright spot and let it do its thing.'),
('Parlor Palm','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579711774-parlor-palm-1579711753.jpg?crop=0.808xw:1.00xh;0.0753xw,0&resize=768:*','Best for smaller spaces. This starter floor plant is 2 to 2 1/2 feet tall, it''s not extra-large. Plus, it''s slow-growing and fairly compact compared to other palms, so it won''t get unruly. The parlor palm will do best in bright, filtered light, but will readily adapt to low light as well. Added bonus: It is a pet-friendly plant.'),
('Umbrella Tree','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579712153-ubrella-plant-1579712143.jpg?crop=0.8133634765134388xw:1xh;center,top&resize=768:*','Best for Spacious floorplans. This is not a narrow plant so make sure it is placed in a spot it can grow to its full potential. It''s a hefty one, but this plant has the power to make any space (even dimly lit ones) feel more sophisticated. Plus, it''s a fast grower, so you''ll feel like an accomplished plant parent in no time.'),
('Dracaena Giganta','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579712716-dracaena-giganta-1579712707.jpg?crop=0.816xw:1.00xh;0.0625xw,0&resize=768:*','If the name didn''t tip you off, this plant is big—like, very big. Like, 5 feet tall big...and wide. Its striking emerald green foliage with bright lemon-yellow striping down the center of the firm leaves will liven up any space. It sucks allergens out of the air, and since it doesn''t crave a ton of attention, it''s the perfect plant for beginners to earn their green thumbs.'),
('Cut Leaf Philodendron','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579713276-philodendron-hope-selloum-1579713261.jpg?crop=0.811xw:1.00xh;0.0785xw,0&resize=768:*','This jungle giant is not only beautiful, but also a very forgiving, adaptable, and low-maintenance houseplant." Translation: No stressing about keeping it alive as long as you give it bright, indirect light and water it when you remember to. Plus, this bushy beauty is an air purifier, too.'),
('Madagascar Limelight Dragon','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1579714624-limelight-1579714606.jpg?crop=0.811xw:1.00xh;0.107xw,0&resize=768:*','Longevity with this plant is practically a given. It''s one of the easiest indoor plants around. It does well in low-light interiors and fluorescent lighting, but will make do in any environment. Warning: Its leaves will appear lighter if you keep it in bright light, but, don''t worry, that''s expected.'),
('Prickly Pear Cactus','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1585598228-bloomscape_peopleplants_prickly-pear-cactus.jpg?crop=1.00xw:0.827xh;0.00160xw,0.0212xh&resize=768:*','Bright green paddle-like pads grow on top of each other, making for a unique plant structure. This guy will make any room look elevated with little to no effort. The Prickly Pear is perfect for those who want more green in their environment, but have limited time to care for plants.'),
('Jade Plant','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1585594514-jyrjpcjs_carousel-1.jpg?crop=0.714xw:1xh;center,top&resize=768:*','These shiny, lime green, oval-shaped leaves on the jade plant will brighten up any room. Plus, jade often blooms small pink or white flowers, adding another pop of color to your space.'),
('Ponytail Palm','https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1585595429-ponytail-palm-1585595416.jpg?crop=1.00xw:0.827xh;0,0.111xh&resize=768:*','Although the ponytail palm looks like your typical palm tree, it''s actually a succulent which means you can grow this fun-shaped plant right in your own home. Bonus: It''s pet friendly!')
GO
DROP TABLE IF EXISTS My_Plants;


CREATE TABLE My_Plants (
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Water_Completed bit,
UserID int NOT NULL,
PlantID int NOT NULL
);
INSERT INTO My_Plants (UserID, Water_Completed, PlantID)
VALUES
(4, '1', 10),
(5, '0', 11);

DROP TABLE IF EXISTS Wish_List;


CREATE TABLE Wish_List (
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
UserID VARCHAR(500),
PlantID int NOT NULL
);

INSERT INTO wish_list(UserID, PlantID)
VALUES
('tom@gmail.com', 6),
('bob@gmail.com', 7);

GO

DROP PROCEDURE IF EXISTS [dbo].[GetPlants]
GO

CREATE PROCEDURE GetPlants
AS
SELECT *
FROM Plants
GO

DROP PROCEDURE IF EXISTS [dbo].[GetPlantByID]
GO

CREATE PROCEDURE GetPlantByID @id INT
AS
SELECT *
FROM Plants
WHERE ID = @id
GO

DROP PROCEDURE IF EXISTS [dbo].[DeletePlantByID]
GO

CREATE PROCEDURE DeletePlantByID @id INT
AS
DELETE
FROM Plants
WHERE ID = @id
GO

DROP PROCEDURE IF EXISTS [dbo].[GetJoined]
GO

CREATE PROCEDURE GetJoined @id INT
AS
SELECT *
FROM My_plants e
JOIN Plants f
ON e.PlantID = f.ID
WHERE e.UserID=@id
GO

DROP PROCEDURE IF EXISTS [dbo].[GetWishlist]
GO

CREATE PROCEDURE GetWishlist @id VARCHAR
AS
SELECT *
FROM Wish_List w
INNER JOIN Plants p
ON w.PlantID = p.ID
WHERE w.UserID=@id
GO

DROP PROCEDURE IF EXISTS [dbo].[AddToWishlist]
GO

CREATE PROCEDURE AddToWishlist @UserID VARCHAR, @PlantID INT
AS
INSERT INTO Wish_List (UserID, PlantID)
VALUES (@UserID, @PlantID)
GO

DROP PROCEDURE IF EXISTS [dbo].[DeleteWishlistByID]
GO

CREATE PROCEDURE DeleteWishlistByID @id INT
AS
DELETE
FROM Wish_List
WHERE PlantID = @id
GO

DROP PROCEDURE IF EXISTS [dbo].[AddToMyPlants]
GO

CREATE PROCEDURE AddToMyPlants @ID INT, @PlantID INT, @Water_Completed BIT
AS
INSERT INTO My_Plants (ID, PlantID, Water_Completed)
VALUES (@ID, @PlantID, @Water_Completed)
GO

DROP PROCEDURE IF EXISTS [dbo].[DeleteFromMyPlants]
GO

CREATE PROCEDURE DeleteFromMyPlants @id INT
AS
DELETE
FROM My_Plants
WHERE PlantID = @id
GO