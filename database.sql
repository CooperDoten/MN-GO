
-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!
CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR (80) UNIQUE NOT NULL,
    "password" VARCHAR (1000) NOT NULL,
    "first_name" VARCHAR (100),
    "last_name" VARCHAR (100),
    "email" VARCHAR (1000),
    "street_address" VARCHAR (1000),
    "city" VARCHAR (1000),
    "state" VARCHAR (100),
    "zip_code" INT
);

CREATE TABLE "user_trip" (
	"id" SERIAL PRIMARY KEY,
	"user_id" INT REFERENCES "user",
	"state_park_id" INT REFERENCES "state_park",
	"state_park_name" VARCHAR(1000) NOT NULL,
	"camp_site" VARCHAR (100) NOT NULL,
	"photo" VARCHAR (65000),
	"comments" VARCHAR (50000),
	"start_date" VARCHAR (100) NOT NULL,
	"end_date" VARCHAR (100) NOT NULL
	);
CREATE TABLE "state_park_images" (
	"id" SERIAL PRIMARY KEY,
	"state_park_id" INT REFERENCES "state_park",
	"photo" VARCHAR (20000)
	);
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(1, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00100.jpg'),
	(1, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_001.jpg'),
	(1, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_003.jpg'),
	(1, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_004.jpg'),
	(1, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_005.jpg'),
	(1, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_006.jpg');
CREATE TABLE "state_park" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR (100) NOT NULL,
	"photo" VARCHAR (1000) NOT NULL,
	"description" VARCHAR (3000) NOT NULL,
	"activities" VARCHAR (1000) NOT NULL
	);
SELECT "state_park_images"."photo" FROM "state_park_images"
  JOIN "user_trip"
   ON "user_trip"."state_park_id" = "state_park_images"."state_park_id"
  WHERE "user_trip"."state_park_id" = 3;
	
UPDATE "user_trip" SET "comments" = 'Had such a great time' WHERE "id" = 2;

INSERT INTO "state_park" ("name", "photo", "description", "activities") 
VALUES ('Afton State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_002.jpg', 'Grand oaks and delicate prairie flowers grace the rugged, rolling landscape of this park. Trails traverse remnant and restored prairies, wind down deep ravines and rise up to the grassy ridgetops and bluffs overlooking the scenic St. Croix River. The trails are perfect for hikers, horseback riders and cross-country skiers. The park offers visitors a swimming beach, backpack campsites and a visitor center with interpretive displays.', 'Backpack Camping, Fishing, Swimming, Prairie Landscape, Hiking, Cross-Country Skiing');
INSERT INTO "state_park" ("name", "photo", "description", "activities") 
VALUES ('Banning State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00103.jpg', 'Treat yourself to a visit to Banning State Park, just minutes off I-35 near Sandstone. In the spring, watch daring canoeists and kayakers shoot the turbulent rapids at Blueberry Slide, Mother''s Delight, Dragon''s Tooth and Hell''s Gate. In the summer, hike along the Kettle River amid dramatic sandstone rock formations with lush lichens, liverworts and mosses. Visit Wolf Creek Falls and take in the historic ruins of Banning Sandstone Quarry. The park is known for camping, picnicking, cross-country skiing, beautiful trails for hiking and the study of natural history.', 'Kettle River, Canoeing, Historic Sandstone Quarry, Wolf Creek Falls, Hiking, Kayaking');
INSERT INTO "state_park" ("name", "photo", "description", "activities") 
VALUES ('Bear Head Lake State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00109.jpg', 'Secluded in the Northwoods, this park contains pristine lakes; it is home to black bears, nesting eagles, wolves and moose. Stands of white and red pine trees tower over the birch, aspen and fir trees. Located just south of the Boundary Waters Canoe Area, the park shares a similar wilderness quality. Explore miles of shoreline by canoe. Swim at the beach, picnic in the shelter building, or fish for walleye, bass, crappies or trout. Trails in the park link-up with the Taconite State Trail and offer snowmobilers, skiers and hikers plenty to enjoy. Rent a three-bedroom guest house or camper cabin any season of the year.', 'Camping, Fishing, Great Hiking Trails, Wilderness Atmosphere, Wildlife, 23 Miles of Lakeshore'),
('Beaver Creek Valley State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_006.jpg', 'Nestled in the blufflands of southeastern Minnesota, Beaver Creek Valley State Park is known for its clear streams fed by the "Big Spring." Its streams are home to brown and native brook trout. In spring, wildflowers that blanket the woodland hills and valleys attract migratory songbirds like the rare Acadian flycatcher, Cerulean warbler, and Louisiana waterthrush. These birds nest in the park. A hiking trail meanders along the stream and up into a maple-basswood and oak forest. Campers are lulled to sleep by the murmuring stream.', 'Camping, Trout Fishing, Hiking, Bird Watching, Spring Woodland Flowers, The "Big Spring"');
INSERT INTO "state_park" ("name", "photo", "description", "activities") 
VALUES ('Big Bog State Recreation Area', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/sra00308.jpg', 'Big Bog State Recreation Area has been called Minnesota''s last true wilderness. This two-part recreation area includes a northern unit and a southern unit. The 500-square-mile peat bog, the largest in the lower 48 states, is located in the northern unit. A mile-long boardwalk, completed in 2005, enables visitors to get a first-hand look at the unique plant and animal life of this rare resource. The bog, which has long been a source of medicinal plants for the Ojibwe Indians, represented a barrier to European settlers who tried in vain to drain it. Today, many of the native plants, including yellow-eyed grass, bog rush and two kinds of sundews, are on Minnesota''s endangered or threatened species list. From orchids to carnivorous plants to rare birds, visitors will see a mixture of fascinating and rare resources. The southern unit includes a campground with 31 campsites (26 electric sites) winterized camper cabins, a sandy beach, picnic grounds, and great fishing.', 'Fishing, Camping, Birdwatching, Bog Boardwalk, Swimming, Picnicking'),
('Big Stone Lake State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_001.jpg', 'Big Stone Lake is 26 miles long and is located on the South Dakota-Minnesota border. The lake is the source of the Minnesota River and attracts anglers who catch walleye, northern pike, yellow perch and bluegills. The northern section of the park, called the Bonanza Area, provides a picnic area and boat launch for guests. The area also includes the Bonanza Education Center which provides a place to discover the past and ways to preserve it. The southern section of the park, called the Meadowbrook Area, contains a campground, swimming beach and hiking trails.', 'Lakeside Campsites, Fishing, Bird Watching, Native Prairie/Oak Savanna in Scientific and Natural Area, Wildflowers Spring/Summer'),
('Blue Mounds State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_002.jpg', 'Blue Mounds State Park is full of natural surprises. Start with the Sioux Quartzite cliff, rising 100 feet from the plains. A bison herd grazes on the prairie. Prickly pear cactus blooms in June and July. A sea of prairie grasses and flowers sway in the wind. The park is also a favorite for birdwatchers who want to see nesting blue grosbeaks and other birds. Enjoy camping and hiking.', 'Camping, Hiking, Rock Climbing, Wildlife, Bison Herd, Prairie Wildflowers / Grasses'),
('Buffalo River State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_001.jpg', 'Prairie lovers, this park is for you. Trails wind through one of Minnesota''s finest and largest remnant prairies. Listen for bobolinks, prairie chickens, marbled godwits and upland sandpipers. A picnic area, swimming area and campground are located in the hardwood forest along the Buffalo River. The park is only 14 miles from the large metropolitan area of Fargo, North Dakota - Moorhead, Minnesota.', 'Swimming Beach, Great Picnicking, Camping, Fishing, Native Prairie Landscape'),
('Camden State Park','https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_005.jpg', 'Camden State Park offers much for visitors to enjoy. Fish for brown trout in the Redwood River or bass and bluegill in Brawner Lake. Hike the trails or cool off in the spring-fed pool. Walk along the wooded river valley, climb the Dakota Valley Trail to the lookout for great fall colors, or go canoeing on Brawner Lake. Woodlands, maples, basswoods, oaks, and cottonwoods, dominate this park. Sun-drenched prairies, grasslands, and marshes offer added diversity. The park provides picnic areas, campgrounds (drive-in, horseback, and group), swimming, hiking, and cross-country skiing.', 'Camping, Fishing, Fall Colors, Dakota Overlook, Wildflowers, Native and Restored Prairies'),
('Carley State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00130.jpg', 'Beauty and quiet, that is the essence of Carley State Park. In the spring, delicate bluebells (Mertensia virginica), and other wildflowers carpet the valley with a profusion of color. Hike along the trail that follows the Whitewater River and take in the grand old white pines. Listen for the sweet song of orioles, song sparrows, house wrens, and indigo buntings. Enjoy the picnic area, play on the swings or practice softball. Try your hand at horseshoes or sit back and see a red-tailed hawk ride thermals in the sky. The north branch of the Whitewater River is a designated trout stream and provides habitat for brown trout. Rustic campsites are located near the picnic area.', 'Camping, Fishing/Trout, Stream, Spring Wildflowers, Hiking, White Pine Stands, Bluebells in May'),
('Cascade River State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_006.jpg', 'Come to Cascade for the rushing river and grand waterfalls that lay within a gorge, lush with moss and ferns that grow on black volcanic rocks. Hike the trail through birch, spruce and white cedar; stop to see the views of Lake Superior, the largest freshwater lake in the world. Trails connect with the Superior Hiking Trail and the North Shore State Trail and offer great recreational opportunities to hikers and cross-country skiers. Drive-in and backpack campsites are available.', 'Hiking, Camping, Skiing, Waterfalls, Fishing, Scenic areas along river and lake');

INSERT INTO "state_park" ("name", "photo", "description", "activities") 
VALUES ('Charles A. Lindbergh State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_004.jpg', 'Located on the Mississippi River, Charles A. Lindbergh State Park offers visitors a wooded campground, hiking and skiing trails, and a quaint picnic area. The picnic area includes a historic Work Projects Administration (WPA) picnic shelter and a stone water tower. Fish the waters of the Mississippi River, canoe Pike Creek, or walk the trails amid grand red and white pine, aspen, oak and prairie. Look for bald eagles year round. During your summer visit, stop in at the historic home of Charles A. Lindbergh, Sr., father of the famous aviator, Charles A. Lindbergh, Jr. The home and adjacent museum are operated by the Minnesota Historical Society (MHS) and are adjacent to the park.', 'Camping, Historic Site, Picnicking, Spring Wildflowers, Mississippi River, Great Family Reunion Park'),
('Crow Wing State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_001.jpg', 'This is a nature lover''s delight. Explore prairie, pine, and hardwood forests. View the Mississippi River from historic and picturesque "Chippewa Lookout." Novice canoeists can paddle the calm waters of the Crow Wing and Mississippi Rivers. Crow Wing is a park rich in cultural history. In this area, a frontier town emerged to serve the needs of travelers and traders. The town died when the railroad chose to cross the river at Brainerd. Walk through the site of the Old Crow Wing Village for a sense of history. The park still has a section of the famous Woods Trail, which served ox cart traffic that carried supplies between St. Paul and the Red River settlements.', 'Camping, Fishing, Scenic Hiking, Trails, Historic Sites, Canoeing/Mississippi River, Great Wildlife Observation Opportunities'),
('Cuyuna Country State Recreation Area', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00302_001.jpg', 'Abandoned by mining companies more than 30 years ago, this area of former mining pits and rock deposit stockpiles now boasts regenerated vegetation and clear lakes that draw a wide range of recreation enthusiasts. Twenty-five miles of natural shoreline can be explored by boat or canoe and anglers can cast a line for trout, northern, bass, crappie, or sunfish. As one of Minnesota''s newest State Recreation Areas, Cuyuna''s 5,000 acres are mostly undeveloped. Off-highway vehicles are not permitted within the boundaries of Cuyuna Country State Recreation Area.', 'Camping, Trout Fishing, Canoeing, Mountain Biking, Scuba Diving, Fat Biking'),
('Father Hennepin State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00142.jpg', 'Father Hennepin State Park is located on the southeast shore of Mille Lacs Lake. Visitors enjoy a large sandy beach for swimming, two boat accesses, fishing piers and picnic sites with a panoramic view of the lake. The park''s 320 acres include two campgrounds and hiking trails that wind through a hardwood forest and along the rocky shoreline of Mille Lacs. The park''s original vegetation was northern hardwoods mixed with marsh areas and pines along the lake. The hardwoods provide shade during the summer and spectacular color in the fall.', 'Camping, Fishing, Wheelchair Accessible Fishing Piers, Sandy Beach, Home of Several Albino Deer'),
('Flandrau State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_001.jpg', 'The gentle flowing Big Cottonwood River meanders through this southern park. The sand-bottom swimming pond, picnic area, campgrounds and group center attract many visitors every summer to this very popular state park. The terrain is diverse, offering views of wooded river bottoms, oxbow marshes and open grasslands. Hikers and cross-country skiers enjoy the flat trails on the bottom of the valley or more challenging routes on the oak-shaded bluffs. Visit historic stone buildings crafted by Works Progress Administration(WPA)crews. Vegetative features include goat prairies, small white lady''s slippers, and the floodplain forest.', 'Shaded Campsites, Sand-bottom Swimming Pool, Enclosed Picnic Shelter, Scenic Overlooks, Hiking/Cross-Country Skiing, Modern Group Center'),
('Forestville/Mystery Cave State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_001.jpg', 'Visit Forestville/Mystery Cave State Park to see natural wonders above and below ground. In the summer, beat the heat with a visit below ground. Explore the world of Mystery Cave with its stalactites, stalagmites, and underground pools. Park naturalists provide tours of the cave throughout the summer and on weekends in the spring and fall. The temperature stays at a constant 48 degrees Fahrenheit. Above ground, stop by Historic Forestville, a restored 1800s village operated by the Minnesota Historical Society (MHS). Fish three blue-ribbon trout streams for brown trout. Take in the soft pastels of wildflowers in spring or listen to ruffed grouse drumming and wild turkeys gobbling. Hike or bring your horse to ride the ridge tops and stream valleys. Observe interesting geologic features along the way including sinkholes and dramatic Big Spring. In the fall, don''t miss the bold colors of the forest. Winter invites visitors to ski or snowmobile the Bluff Country.', 'Tours of Mystery Cave, Historic Forestville Tours, Trout Streams, Camping, Great Hiking/Horseback Trails, Spring Flowers');
INSERT INTO "state_park" ("name", "photo", "description", "activities") 
VALUES ('Fort Ridgely State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00151.jpg', 'Tour Historic Fort Ridgely and wander through the ruins of this once thriving outpost. Learn about the U.S.-Dakota War of 1862, a major event in Minnesota''s early history. Visit the museum and the cemetery to learn more. For recreation, this park offers plenty. In the summer, hike or ride the trails on horseback, fish the stocked pond or trout stream, camp (drive-in and walk-in sites are available), or stay overnight in the renovated farmhouse. In the winter, ski, snowmobile, or stay overnight at the chalet.', 'Camping, Historic Site,, Horseback Riding, Scenic Rolling Hills, Forests and Prairies'),
('Franz Jevne State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00157.jpg', 'Secluded and peaceful, this park offers picturesque views of Ontario and the Rainy River. Short paths and a boat launch offer access to the river for fishing, where anglers can catch walleye, northern, small mouth bass and sturgeon. Pitch a tent in the rustic campsites, equipped with pit toilets, and a hand pump for water. A picnic area overlooks Sault Rapids.', 'Great Fishing, Hiking, Quiet, Peaceful Park, Scenic Hiking Trails'),
('Frontenac State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00160.jpg', 'Located on the Mississippi River, Frontenac is a birdwatcher''s paradise. It''s one of the best spots in the country to view birds migrating in the spring and fall. More than 260 species of birds have been recorded here. No wonder: Lake Pepin''s diverse habitats: bluffland, prairie, floodplain forest and upland hardwood forest. Attract numerous warblers, hawks, waterfowl and shorebirds. Hikers and skiers enjoy spectacular views of this beautifully wooded river valley. Fishing, swimming and boat tours are all available nearby.', 'Camping, Wonderful Fall Colors, Excellent Birding Opportunities, Wildflowers in Spring Through Fall, Winter Sliding Hill, Great Hiking/Ski Trails'),
('George H. Crosby Manitou State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_001.jpg', 'Come to this north-country wilderness park where waterfalls cascade through a volcanic canyon surrounded by majestic forest. The trails in the park are carved through a forest of fir, cedar, spruce, and northern hardwoods. Although the trails are steep and challenging for hikers and backpackers, they offer spectacular views. Secluded campsites are for backpackers only. Trout (brown, rainbow, and brook) and splake (a hybrid of brook and lake trout) reside in Benson Lake. Watch for moose, deer, bear, and wolves.', 'Camping, Hiking, Scenic views, Waterfalls, Wildlife'),
('Glacial Lakes State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_004.jpg', 'Stand on top of the scenic glacial hills and experience the vast, open prairie which once dominated Minnesota. Wildflowers and prairie grasses blanket the landscape from spring through fall. Swim, fish or boat (electric motors only) in the fresh, clear waters of 56-acre Signalness Lake. Canoe rental is available. A shady, spacious campground is available; horseback riders and backpack campers can camp at the trail center and at remote sites. A picnic area deck overlooks Signalness Lake.', 'Camping, Fishing'),
('Glendalough State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00167.jpg', 'Nestled in the transition zone between prairie and hardwood forest, Glendalough offers a true respite from civilization. Crystal clear Annie Battle Lake is a 335-acre, non-motorized "Heritage Fishery" that provides a tranquil fishing experience second to none. Special regulations sustain a steady supply of large sunfish, crappie, and the occasional walleye for the frying pan, and large bass for the camera. Near the pristine shores of this lake are a cart-in campground and canoe-in campsites, all free from the traffic and noise of traditional drive-in camping. Annie can also be the starting point for an exploration of the park by canoe or kayak on the connecting creeks. The restored historic Glendalough lodge on the north side of the lake details the park''s history as a private retreat and game farm for the Minneapolis Tribune. A paved bike trail loop and numerous hiking trails, including two interpretive trails, meander along five lakes, through rich woods and blooming prairies. Wildlife abounds year-round, and there are many observation decks along the trails. Trails are groomed in winter for skiing and snowshoeing. Picnicking and swimming is available on two sandy lakes.', 'Cart-in Tent Camping, Hiking and Biking, Wildlife Observation, Heritage Fishing/Large Panfish, Canoeing on Chain of Lakes, Sandy Swimming Beach'),
('Gooseberry Falls State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_005.jpg', 'Gooseberry Falls is the gateway to the North Shore. It is known for its spectacular waterfalls, river gorge, Lake Superior shoreline, Civilian Conservation Corps log and stone structures, and north woods wildlife. Listen to the thunderous roar of the Upper, Middle and Lower Falls of the Gooseberry River as it plummets through a rocky gorge. Watch for waves, ships, or the moon rise on Lake Superior from an ancient lava flow known as the Picnic Flow. Hike or ski to see the Fifth Falls through a forest of evergreens, aspen, and birch, and enjoy camping in modern campsites, picnicking, and relaxing along the Lake Superior shoreline or the Gooseberry River. To get the most out of your visit, stop by the Joseph N. Alexander Visitor Center where you can find park information, interpretive displays, a park video, Nature Store, and more. Don''t miss the Gateway Plaza for outdoor interpretive signs on area resources and history.', 'Scenic Waterfalls/Lake Superior Shoreline, Visitor Center/Nature Store, Historic CCC Log & Stone Structures, Year-Round Naturalist, Multi-Use/Accessible Trails, Gateway Plaza'),
('Great River Bluffs State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00244.jpg', 'This is beautiful bluff country! The park contains two Scientific and Natural Areas (SNAs), King''s and Queen''s Bluff. The King''s Bluff trail offers a breathtaking view of the Mississippi River Valley. Bring your binoculars; the river valley is a major flyway for waterfowl, eagles, and hawks. Explore the diversity in this park: oak-hickory and maple-basswood forests, pine plantations, fields, and goat prairies offer visitors excellent hiking and a diversity of wildlife. Look for ruffed grouse, wild turkeys, coyotes, and many species of songbirds.', 'Scenic Blufftop Views of Mississippi River Valley, Fall Colors, Goat Prairies, Prairie Plants/Flowers, Camping/Hiking/Picnicking, Birdwatching');
INSERT INTO "state_park" ("name", "photo", "description", "activities") 
VALUES ('Hayes Lake State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_005.jpg', 'Some days it''s just you, loons, and moose, while you traverse around Hayes Lake. Fed by the north fork of the Roseau River, the lake supports crappie, sunfish, large mouth bass, and northern. Birdwatchers have spotted over 200 species in or near the park. The summer is perfect to look for orchids, gentians, and blueberries (you can pick the berries, but not the flowers). Visitors also enjoy swimming and canoeing in the lake, along with camping. Trails for hiking, skiing, snowmobiling, and horseback riding connect with the Beltrami Island State Forest.', 'Scenic Views: Grefthen Bay Overlook, Hayes Dam Area, New Bog Boardwalk, History Trail, Great Wildlife Observation, Timberwolves'),
('Interstate State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00178.jpg', 'There is so much to do at Interstate State Park, located on the beautiful St. Croix River. Visitors can climb the cliffs of the St. Croix River Dalles, canoe the flat-water, watch kayakers rush through the rapids, or relax on an excursion boat. Spring brings a great diversity of wildflowers and in fall, the St. Croix River Valley forest is ablaze in the autumn colors of red, gold, and orange. The geology that formed this park intrigues visitors, and brings geologists from all over the world. At least 10 different lava flows are exposed in the park, along with two distinct glacial deposits, and traces of old streams valleys and faults. During the summer, hike the trails and explore the glacial potholes that make this park unique.', 'Scenic River Views, Canoeing, Camping, Fishing, Rock Climbing, Pothole Viewing'),
('Itasca State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_005.jpg', 'Established in 1891, Itasca is Minnesota''s oldest state park. Today, the park totals more than 32,000 acres and includes more than 100 lakes. Walk across the mighty Mississippi as it starts its winding journey 2,552 miles to the Gulf of Mexico. Stand under towering pines and visit landmarks of centuries gone by throughout the park. Camp under the stars or stay the night in one of our 45 overnight units. Explore Wilderness Drive past the 2,000-acre Wilderness Sanctuary, one of Minnesota''s seven National Natural Landmarks.', 'Camping, Fishing, Hiking, Historic Sites, Unique Ecosystem, Old Growth'),
('Jay Cooke State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_001.jpg', 'Trailblazers: this park is a must! Park trails link up to the Willard Munger State Trail at the north edge of the park; perfect for backpackers, bikers (both mountain and tour), hikers, horseback riders, and skiers. Check out the wildflowers in the spring, and the vivid colors in the fall. Walk on the swinging suspension bridge high above the raging St. Louis River. Visit the historic cemetery and the gorge at Thomson Dam.', 'Camping, Hiking, Swinging Bridge, Pioneer Cemetery, Thomson Dam, Oldenburg Point'),
('Judge C.R. Magney State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00193.jpg', 'Come for the quiet, the solitude, and the famous Devil''s Kettle waterfall. The most popular hike leads from the trailhead upstream along the Brule River to Devil''s Kettle, where the river splits around a mass of volcanic rock. Half of the river plunges 50 feet into a pool, while the rest pours into a huge pothole. Anglers can catch brook and rainbow trout in the Brule River or its tributary, Gauthier Creek. The park offers camping, picnicking and hiking.', 'Scenic Waterfalls, Trout Fishing, Camping, Hiking/Picnicking, Wildlife Observation, Superior Hiking Trail'),
('Kilen Woods State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_006.jpg', 'For a quiet, relaxing time, hike the cool woodland trail which meanders along the tranquil Des Moines River, or enjoy the view of the river valley from Dinosaur Ridge Overlook. You''ll find pleasant surprises as you explore small creeks, prairie grasslands, and oak savannas. Visitors enjoy camping, canoeing, fishing, picnicking and hiking.', 'Peaceful/Quiet Park, Birdwatching, Hiking, Camping, Spring Wildflowers'),
('La Salle Lake State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/sra00311.jpg', 'La Salle Lake State Recreation Area is Minnesota''s newest state recreation area. It offers a great wilderness experience and peaceful getaway amid red and jack pine forests and woodlands. Take advantage of fishing opportunities on Minnesota''s deepest inland lake at 213 feet. Other highlights include a coldwater stream, a scientific and natural area and a pristine stretch of the Mississippi River.', 'Fishing, Boating, Camping, Unique Ecosystem, Hiking, Snowshoeing'),
('Lac qui Parle State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_004.jpg', 'Lac qui Parle is a French translation of the name given to the lake by the Dakota Indians who called it the "lake that speaks." If you visit in the spring or fall you''ll understand why. The lake is a stop over for thousands of migratory Canada geese and other waterfowl. You''ll hear a chorus of honking, quacking, and other vocalizations. Paddle the lake, or cast a line and catch walleye, northerns, perch, or crappie. Explore one of the trails by foot or horseback. Visit the historic Fort Renville and Lac qui Parle mission sites. While in the area, be sure to visit the 33,000 acre Lac qui Parle Wildlife Management Area.', 'Camping, Fishing, Bird Watching/Winter Eagle Sightings, Hunting, Canoeing, Cross-country Skiing'),
('Lake Bemidji State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_008.jpg', 'This park is the perfect playground any time of year, offering visitors swimming, boating, fishing, birdwatching, hiking, camping, biking, picnicking, snowmobiling, cross-country skiing and year-round naturalist-led activities. Hikers can explore the beauty of a tamarack bog carpeted with showy lady''s slippers, pitcher plants, dragon''s mouth, grass pink, and insect-eating sundews. Most flowers are blooming in the bog during late spring and early summer.', 'Camping, Fishing, Unique Ecosystem, Bog Walk, Eagle/Osprey Viewing, Lake Recreation'),
('Lake Bronson State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_001.jpg', 'From the observation tower in the park, view the prairie and aspen-oak forests or watch for deer, sharp-tailed grouse, and sandhill cranes. The South Branch of the Two Rivers fills Lake Bronson. The lake, which is actually a reservoir, offers visitors swimming, fishing, boating, great camping, and a tranquil backdrop for the picnic grounds. For those who prefer a prairie experience, one of the campground areas allows camping on the prairie. Trails for hiking, biking and snowmobiling provide visitors with great recreation choices.', 'Largest Observation/Water Tower in MN State Park System, Historic WPA-Built Structures, Playground, Excellent Prairie & Aspen Parkland Habitat, Camping/Hiking, Visitor Center'),
('Lake Carlos State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00211.jpg', 'Sculpted by ancient glaciers, Lake Carlos State Park contains a tamarack bog, marshes, woodland ponds, and lakes. A variety of recreational activities revolve around the lake. Clear and deep, Lake Carlos offers visitors a perfect setting for swimming, fishing, boating, camping, hiking and horseback riding. In the winter, ski from the tamarack bog to a maple-basswood forest.', 'Camping, Fishing on Chain of Lakes, Birdwatching, Hiking Through Rolling Hills, Swimming/Boating, Water Recreation'),
('Lake Louise State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00214.jpg', 'Lake Louise lures hikers and horseback riders to its trails, which wind through open meadows and lush hardwoods. It also provides bicyclists with access to the paved Shooting Star State Trail, which bisects the park. A historic dam impounds the Upper Iowa and Little Iowa River, allowing for great paddling, swimming and fishing on Lake Louise. In addition, visitors swim, boat, or fish in Lake Louise. Hiking and horseback riding are also popular sports at this park. The lakeside picnic grounds and beach area draws visitors in the summer.', 'Quiet Park, Seasonal Wildflowers, Peaceful Campgrounds, Canoeing on Lake Louise, Swimming Beach, Horse Trails Through Varied Habitat'),
('Lake Maria State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00217.jpg', 'Visitors who come to Lake Maria State Park will enjoy one of the few remaining stands of the "Big Woods," a maple, oak and basswood forest that once covered part of southern Minnesota. The park is perfect for hikers, backpackers, horseback riders, and cross-country skiers who enjoy the challenge of the rolling terrain. Take a stroll on the boardwalk which winds through a marsh. Backpack sites, located on remote lakes and ponds throughout the park, are one to two miles from the trailhead parking. New log camper cabins, located near lakes and ponds, provide bunk beds for six people and a table and benches for campers who want more of the creature comforts. Lake Maria State Park is home to the Blandings turtle, easily identified by bright yellow spots on its shell. It is one of Minnesota''s threatened species.', 'Secluded Backpack Campsites, Endangered Blandings Turtle, Hiking/Spring Wildflowers/Fall Colors, Nesting Osprey and Eagles, Remote Ski-in/Walk-in Camper Cabins, Lake SCross-Country Skiing'),
('Lake Shetek State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_006.jpg', 'The word "Shetek" is Ojibwe for "pelican," a bird which visits Lake Shetek during the summer and fall. The park contains the largest lake in southwestern Minnesota, which forms the headwaters of the Des Moines River. Expect great fishing for walleye, northern, crappie, and bullheads. Loon Island, a 45-acre island on Lake Shetek, is accessible on foot via a causeway and includes an interpretive trail. Visit the Koch Cabin and monument memorializing pioneer settlers. The park includes a swimming beach, boat launch, campgrounds and a scenic six-mile loop bicycle trail into the town of Currie. Boat, canoe, and kayak rentals are available.', 'Camping, Fishing, Bicycle Trail, Shetek Monument and Koch Cabin'),
('Lake Vermillion-Soudan Underground Mine State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_001.jpg', 'Adventure abounds at Lake Vermilion-Soudan Underground Mine State Park! Tour the historic underground mine, take a boat out or cast a line on Lake Vermilion, or hike through acres of old growth pine forest. The addition of nearly 3,000 acres and five miles of Lake Vermilion shoreline in 2010 adds even more opportunities to experience the wonders of northern Minnesota.', 'Mine Tours and Hiking, Campground and Day Use Areas, Historic Site, Lake Recreation and Public Water Access, Geologic Formations, Birding and Wildlife Watching'),
('Maplewood State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_007.jpg', 'The maple forest turns brilliant shades of orange, gold, and red in the fall. Eight major lakes and many ponds offer water lovers places to swim, fish, boat, and simply relax. Lake Lida has a sandy beach and large picnic areas for visitors. Drive along the scenic route to observe the wildlife: the park is host to 150 bird species and 50 species of mammals. The extensive trail system attracts hikers, horseback riders, and cross-country skiers.', 'Camping, Fishing, Hiking, Horseback Trails'),
('McCarthy Beach State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00226.jpg', 'Come to McCarthy Beach State Park and you’ll remember the lakes. The sandy beach on Sturgeon Lake was rated one of the top 17 beaches in North America by Highway’s Magazine. Walk along the half-mile of shoreline, or venture out into the shallow water that extends hundreds of feet into the lake. Launch a boat on Side Lake or Sturgeon Lake to explore the five connected lakes of the Sturgeon chain. Hikers, mountain bikers, and snowshoers enjoy scenic trails that wind along pine-covered ridges and through stands of birch. Snowmobilers and horseback riders take advantage of the Taconite State Trail to access miles of trails outside the park. Located near many tourist attractions, McCarthy Beach State Park offers opportunities for both relaxation and exploration.', 'Swimming Beach, Camping, Hiking, Horse Trails, Picnicking, Snowshoeing/snowmobiling'),
('Mille Lacs State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_002.jpg', 'Mille Lacs Kathio State Park has so much to offer and discover. It''s 9,000 years of human history and archaeological significance has made it a National Historic Landmark. You can learn about its rich history and all of Kathio''s other treasures at the Interpretive Center. Climb the 100 foot observation/fire tower and look across the majesty of Mille Lacs Lake. Take part in Mille Lacs Kathio State Park''s extensive interpretive/nature programs or get out by yourself and hike on the park''s varied trail system. Kathio has a wonderful swimming beach plus canoes or rowboats you can rent for a trip on the historic Rum River and Ogechie and Shakopee lakes. In the winter, visitors can cross-country ski on trails described as the best in Minnesota or take the family sledding on our popular sliding hill. The river, lakes, and park trails offer visitors excellent opportunities to watch waterfowl, bald eagles, osprey, beaver, loons, deer, coyotes, and many others.', 'Nature Programs, Camping, Swimming/Playground, 100 Ft. Observation Tower, Historic Sites, Cross-Country Skiing'),
('Minneopa State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_005.jpg', 'The word Minneopa is derived from the Dakota language and is interpreted to mean "water falling twice," referring to the beautiful waterfalls of Minneopa Creek. Walk the trail which encircles the falls, leading down a limestone stairway to the valley below. Ascend the opposite side and enjoy a panoramic view of the valley which reveals the underlying geology of this area. Visit Seppmann Mill, a wind driven grist mill fashioned in German style from native stone and lumber, or hike through oak savanna and native prairie grasslands overlooking the scenic Minnesota River Valley.', 'Camping, Fishing, Bison herd'),
('Minnesota Valley State Recreation Area', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00304_002.jpg', 'Just minutes from the Twin Cities, this state recreation area preserves part of the Minnesota River Valley. The multi-use Minnesota Valley State Trail parallels the Minnesota River. The section of trail from Shakopee to Chaska is paved and a natural surface trail runs from Chaska to Belle Plaine. The area is ideal for hiking, biking, cross-country skiing, horseback riding, mountain biking, and snowmobiling. The landscapes are just as diverse as the trail system and include wetlands, floodplain forest and blufftop oak savanna. Wildlife observation and birdwatching are popular activities year-round.', 'Picnicking, Hiking, Horse Trails, Wildlife Observation'),
('Monson Lake State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_004.jpg', 'Cast your line for walleye, northerns, bass, and sunfish in Monson Lake. Birdwatchers look for white pelicans, herons, western grebes, and songbirds in this 346 acre park with a diverse landscape of wetlands and hardwood forests. The park includes a quiet campground and wooded picnic area. Paddle the lake and take a short portage that leads from Monson Lake to West Sunburg Lake.', 'Camping, Fishing'),
('Moose Lake State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_002.jpg', 'Rolling hills surrounded by fields, woods, ponds and fishing lakes make this park popular for hikers, anglers, canoeists, swimmers and campers. Quiet Echo Lake is ideal for catching bass, northerns and panfish. The Willard Munger Trail is located two miles west of the park. The trail stretches for 60 miles from Hinckley to west Duluth.', 'Close Access To Recreation, Quiet Lake Offers Great Canoeing, Lots Of Family Activity Choices, Fishing/Fishing Pier, Wildflowers & Wildlife Viewing'),
('Myre-Big Island State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_003.jpg', 'This park has something for everyone. The trails take visitors around wet lowlands, oak savanna, and grasslands. Albert Lea Lake and park marshes draw hundreds of waterfowl during migration. Oak savanna and prairie landscape, including wetlands, dominate most of the park. One of the more unique aspects of the park is the 116-acre Big Island, covered with maple/basswood forest. Another is the glacial esker located in the northeast section of the park.', 'Spring and Fall Migrations, Glacial Esker, Great Marsh/Birdwatching, Hiking, Canoeing, Camping'),
('Nerstrand Big Woods State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_001.jpg', 'Enjoy this park on foot, any season of the year. In the spring, the park is a wildflower garden where hepatica, bloodroot, Dutchman''s breeches, and the dwarf trout lily bloom. The dwarf trout lily is only found here. Relax by Hidden Falls in the summer. The autumn brings a burst of red, orange, and gold in the maple-basswood forest, one of the last extensive stands of the "Big Woods." When winter comes, hike, snowshoe, or snowmobile the trails through picturesque woods.', '"Big Woods" Landscape, Spectacular Spring Wildflowers, Fabulous Fall Color, Visitor Center, Self-guided Interpretive Trail, Hidden Falls Waterfall'),
('Old Mill State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00247.jpg', 'A log cabin and a steam-powered flour mill at Old Mill State Park are bold landmarks from the past. The grist mill still gets fired up once a year to grind flour. The Middle River meanders through the park and visitors can see deer, beaver, and ruffed grouse. Enjoy the prairie and the ever-changing parade of wildflowers along wooded trails. A swimming area, swinging bridge, picnic grounds, campground, and interpretive displays are popular among visitors.', 'Camping, Wildlife, Historic Site'),
('Red River State Recreation Area', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/sra00309.jpg', 'The creation of the Red River State Recreation Area was a grass roots effort that came about as a result of the flood of 1997 that devastated the communities of East Grand Forks, MN and Grand Forks, ND. After the U.S. Army Corps of Engineers redrew the floodplain, the Federal Emergency Management Agency bought 500 homes and other buildings in East Grand Forks along the Red and Red Lake Rivers. Various structures and homes were removed and the land -- now a 1,200-acre greenway -- became a state recreation area. Included in this greenway area is a new campground that features 113 campsites, including 85 electric sites that have full hookups (sewer and water). The new recreation area also includes trails for walking and biking, areas for picnicking, and rivers for fishing and boating. The recreation area''s setting in an urban area offers visitors access to outdoor recreational opportunities, as well as shopping and dining facilities within walking distance of one another.', 'Full Hook-up Campsites, Boating/Fishing/Birding, Picnicking, Paved Multi-use Trails, Nearby Dining and Shopping, Urban Setting'),
('Rice Lake State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_002.jpg', 'Long ago, American Indians harvested wild rice from this lake where today, the shallow waters and marshy edges of Rice Lake attract many waterfowl during migrations. Rice Lake is a major wetland in the area. Visitors enjoy camping under the tall hardwoods, photographing spring wildflowers, picnicking, and birdwatching. For a more secluded camping experience, paddle across the lake and camp in a canoe campsite. Winter activities include cross-country skiing and snowmobiling on the trails.', 'Spring and Fall Migration, Birdwatching, Great Variety of Songbirds/Waterfowl, Wildflowers, Canoeing, Nature Observation');
INSERT INTO "state_park" ("name", "photo", "description", "activities") 
VALUES ('St. Croix State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_004.jpg', 'Plan an extended visit to St. Croix. With over 34,000 acres and two great rivers—the Saint Croix River, which is a National Scenic Riverway, and the Kettle River, a State Wild and Scenic River—there''s so much to do. Explore the rivers by canoe or with a fishing pole. Swim at Lake Clayton or climb a fire tower. The park has miles of trails for hikers, horseback riders, bicyclists, snowmobilers, and cross-country skiers. Campers can reserve drive-in, walk-in, backpack, and horseback campsites. Large groups can reserve the modern group centers or the primitive group camps.', 'Camping, Extensive Trail System, CCC Construction Buildings, Two Scenic Rivers Offer Excellent Canoeing, Birding/Wildlife Observation, Firetower'),
('Sakatah Lake State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00256.jpg', 'Sakatah Singing Hills State Trail runs through Sakatah Lake State Park and stretches 39 miles from Mankato to Faribault. The paved trail offers hikers, bikers, skiers, and snowmobilers beautiful scenery through Minnesota''s hardwoods. Sakatah Lake, a natural widening of the Cannon River, lures canoeists to paddle the calm waters, and anglers to catch walleye, large mouth and white bass, northern pike, and panfish. Whatever the season, visitors enjoy camping and picnicking.', 'Maple and Basswood Forests, Hiking, Biking - Access to Sakatah State Trail, Camping, Wildlife'),
('Savanna Portage State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_002.jpg', 'Time slips by when you visit this park of the north. Walk the Savanna Portage Trail, a historic trail traveled by fur traders, Dakota and Ojibwe Indians, and explorers more than 200 years ago. Savanna Portage State Park has 15,818 acres of rolling hills, lakes, and bogs. The Continental Divide marks the great division of water: water to the west flows into the Mississippi River; water to the east runs into Lake Superior. Visitors can hike the Continental Divide Trail and see forested vistas. During the summer, visitors enjoy swimming at Loon Lake. Bike enthusiasts can pedal on roads, or on dirt trails designated for mountain bikes. With four fishing lakes and a river, its common for anglers to catch panfish, trout and bass. Come winter, this park offers snowmobilers approximately 32 miles of trails to explore.', 'Hiking Trails, Swimming Beach, Fishing, Continental Divide, Snowmobiling, Historic Areas in Park'),
('Scenic State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_002.jpg', 'With its pristine lakes, virgin pines, swimming beach, and wilderness-like setting, Scenic State Park is well deserving of its name. Here, visitors can hike the Chase Point Trail for hypnotic views of Coon and Sandwick Lakes and listen to the wind whistle through the giant pines. The park''s overnight facilities include campsites (boat-in, drive-in, backpack), and a cabin. The historic lodge houses interpretive displays.', 'Camping, Hiking, Virgin Pines, Peaceful Setting, Fishing/Canoeing, Historic CCC Buildings'),
('Schoolcraft State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_006.jpg', 'This secluded north woods park is the perfect place to unwind. Quiet and peaceful, the trail system leads hikers through the virgin pine forest that includes a white pine more than 300 years old. Canoeists and anglers enjoy the gentle waters of the Mississippi River. A boat access, picnic area, canoe and drive-in campsites are available to visitors.', 'Camping, Hiking, Canoeing, Picnicking, Fishing, Quiet Park/Great Relaxation'),
('Sibley State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_001.jpg', 'There is something for everyone at this popular west-central Minnesota State Park. Hike to Mount Tom, one of several high points in a 50-mile radius, and see a patchwork of forest, farmland, prairie knolls, and lakes. Summer visitors enjoy swimming, boating, and fishing on Lake Andrew. A canoe route invites adventurers to portage and canoe on Henschien Lake and Swan Lake. The park offers campgrounds, a modern group center, horseback camps, picnic area, and interpretive programs year-around.', 'Interpretive Programs, Bird Watching, Camping, Fishing/Canoeing, Hiking, Cross-Country Skiing'),
('Split Rock Creek State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_001.jpg', 'Swim, fish, or boat the waters of Split Rock Lake, the largest body of water in Pipestone County. The lake is the predominant feature of this park. Stop by the Beach Side Trail Center for an excellent vista and to discover more about the area. Seven miles north of the park is the famous Pipestone National Monument.', 'Camping, Water Based Recreation / Swimming Beach, Fishing, Wildlife/Waterfowl Observation, Hiking, Horse riding trails'),
('Split Rock Lighthouse State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00266.jpg', 'This park is situated on the North Shore of Lake Superior. Perhaps best known for its historic lighthouse, this park offers numerous recreational opportunities. Visitors can cart-in their supplies to pristine campsites along Lake Superior. Scenic trails along the lake link up to the spectacular Superior Hiking Trail. Anglers cast their lines for lake trout, salmon, and brown trout. The rocky beach is perfect for skipping stones into Lake Superior.', 'Tent Camping/Cart-in Sites, Historic Lighthouse / History Center Tours, Picnicking Along Lake Superior Lakeshore, Scenic Views of Lake Superior, Waterfalls'),
('Temperance River State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00268.jpg', 'Take the trail that winds along the edge of the Temperance River gorge and enjoy the rushing waterfalls surrounded by pine, spruce, cedar and birch forests. The rapidly flowing river has cut deep potholes in and along the riverbed. Hike the trail to Hidden Falls or connect up with trails into the Superior National Forest and the Cross River Wayside. Visitors come to camp and picnic along the shore of Lake Superior. Winter brings snowshoers and snowmobilers to tackle the hilly terrain. Carlton Peak, a recent addition to the park, is popular with rock climbers and offers even more recreational opportunities to park visitors.', 'Rock Climbing, Fishing, Hiking, Camping, Many Scenic Areas Along River and Lake, Rocky Landscape'),
('Tettegouche State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00269.jpg', 'Come to Tettegouche for a great sense of the North Shore: the spectacular overlooks at Shovel Point; rocky, steep cliffs and inland bluffs; the cascading 60 ft. High Falls of the Baptism River; and the historic Tettegouche Camp where visitors can stay the night. This is a hiker''s paradise with miles of trails that overlook the Sawtooth Mountains and wind down to inland lakes accessible only by foot. The Palisade Valley Unit features broad scenic vistas coupled with an expanse of multi-use, four-season trails. Two more trout lakes complement the fishing opportunities within the rest of the park. The park is also known for rock climbing opportunities and quality birdwatching in the spring, summer, and especially the fall.', 'Waterfalls, Wildlife/Peregrine Falcons, Hiking, Camping, Rock Climbing, Cross-Country Skiing'),
('Upper Souix Agency State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_003.jpg', 'Upper Sioux Agency State Park contains the site of the Upper Sioux or Yellow Medicine Agency. The park was established in 1963 to preserve and interpret the remains of the old Agency site. The park covers 1,280 acres and offers diversity: open prairie knolls, bluffs, and cool, wooded slopes. From the vistas, visitors enjoy the trails which are ideal for horseback riding, hiking, skiing, and snowmobiling. The park also offers a huge sliding hill for winter fun.', 'Camping Including Tipi Sites, Historic Site, Horse Trails/Camp, Varied Landscape/Hiking Trails, Birdwatching'),
('Whitewater State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00280.jpg', 'Picturesque limestone bluffs and deep ravines make Whitewater a very popular southeastern state park. The 2,700 acre park is an angler''s paradise with brown, brook, and rainbow trout swimming in the spring-fed Whitewater River and Trout Run Creek. Visitors enjoy a sandy swimming beach, a year-round visitor center, easy-to-challenging hiking trails, camping, a group camp, and a modern group center. Come in the winter to enjoy cross-country skiing and snowshoeing, and stay at the group center in rustic, winterized cabins. All through the year, discover the natural and human history of the area at one of the many interpretive programs, visitor center exhibits or self-guided trails.', 'Rugged Hiking Trails to Scenic Bluffland, Noticeable Lack of Mosquitoes, Excellent Trout Fishing summer and winter, Year-round Interpretive Programs, Visitor Center, Spectacular Spring Wildflowers'),
('Wild River State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_001.jpg', 'Wild River State Park is located along 18 miles of the beautiful St. Croix River. The park attracts people who enjoy camping, hiking, horseback riding, canoeing, interpretive programs, self-guided trails, and cross-country skiing and snowshoeing. Day visitors can enjoy a leisurely paddle down the St. Croix River from the Sunrise river access to the southern park river access. The park provides opportunities for semi-modern camping, group camping, equestrian camping, backpack camping, and canoe camping. Visitors who want modern amenities can reserve the guest house which provides a living room, dining room, kitchen, and fireplace. The park also has six camping cabins which include bunkbeds, a table, and benches. An all-season trail center is a great spot to relax after hiking or cross-country skiing on the 35-mile trail system. A visitor center with exhibits and environmental education programs is open year-round.', 'Camping, Canoeing, Cross-Country Skiing, McElroy Visitor Center, Nevers Dam Overlook, Wildlife/Wildflowers'),
('William O''Brien State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_001.jpg', 'A great "get away" park only one hour from the Twin Cities, William O''Brien provides a beautiful setting for quality recreation along the banks of the St. Croix River. Hiking trails offer quiet exploration of the park''s rolling, wooded hills. For anglers, the channels of the St. Croix have northerns, walleye, bass and trout. Ideal for canoeing, the river is also a migratory pathway that offers visitors an exciting diversity of sights and sounds. In the winter, snowshoeing, skiing and camping attract enthusiasts.', 'Camping, Fishing, Canoeing on the St. Croix, Cross-country Skiing, Naturalist Programs, Bird Watching, Oak Savanna Restoration'),
('Zippel Bay State Park', 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00284.jpg', 'After visiting Zippel Bay, you’ll remember the sunsets and the miles of white sand beach. The park is located on Lake of the Woods, one of the world’s largest lakes. The mood of the lake is always changing, from approaching storms that bring three-foot-high crashing waves and lightning flashes to an eerie stillness, broken only by the faint calls of a thousand raucous gulls, out of sight in the lake’s interior. In summer, the 3,000-acre park offers a swimming beach and picnic area on the big lake, drive-in campsites and a group camp, a marina on Zippel Bay and a stone jetty providing protected access to Lake of the Woods. Birding is excellent—be sure to watch for sandhill cranes and piping plovers. In the winter, three miles of snowmobile trail provide access to the lake, which snowmobilers will find dotted with fish houses making virtual towns on the ice. Seven miles of groomed cross-country trails wind to the lakeshore through jack pine, birch, and open fields.', 'Camping, Fishing, Beach, Bird Watching, Winter Recreation');
SELECT * FROM "state_park" where "id" = 1;


UPDATE "user" SET "first_name" = 'Cooper', "last_name"= 'Doten', "email" = 'cooper.doten@gmail.com',
 "street_address" = '6910 Lakewood Drive NE.', "city" = 'Albertville', "zip_code" = 55301
WHERE "id" = 1;
UPDATE "user" SET "first_name" = 'Cooper', "last_name"= 'Doten', "email" = 'cooper.doten@gmail.com',
 "street_address" = '6910 Lakewood Drive NE.', "city" = 'Albertville', "zip_code" = 55301
WHERE "id" = 3 RETURNING "id";
INSERT INTO "user_trip" ("user_id", "state_park_id", "camp_site", "start_date", "end_date")
        VALUES(3, 44, 'g', '10/14/2020', '10/16/2020');
        
        
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(2, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_001.jpg'),
	(2, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_002.jpg'),
	(2, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_003.jpg'),
	(2, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_004.jpg'),
	(2, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_005.jpg'),
	(2, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_006.jpg');     
	
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(3, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_4.jpg'),
	(3, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_2.jpg'),
	(3, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_3.jpg'),
	(3, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_6.jpg');
	
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(4, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00112.jpg'),
	(4, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_002.jpg'),
	(4, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_001.jpg'),
	(4, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_003.jpg'),
	(4, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_005.jpg'),
	(4, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_004.jpg');   
	
	
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(5, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00308_003.jpg'),
	(5, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00308_006.jpg'),
	(5, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00308_005.jpg'); 
	
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(6, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_002.jpg'),
	(6, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00115.jpg'),
	(6, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_003.jpg'),
	(6, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_004.jpg'),
	(6, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_005.jpg'),
	(6, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_006.jpg');  
	
			INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(7, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00121.jpg'),
	(7, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_001.jpg'),
	(7, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_003.jpg'),
	(7, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_004.jpg'),
	(7, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_005.jpg'),
	(7, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_006.jpg');  
	
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(8, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00124.jpg'),
	(8, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_002.jpg'),
	(8, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_003.jpg'),
	(8, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_004.jpg'),
	(8, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_005.jpg'),
	(8, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_006.jpg');  
	
			INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(9, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_001.jpg'),
	(9, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00127.jpg'),
	(9, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_002.jpg'),
	(9, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/camden_redwood_exterior.jpg'),
	(9, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_004.jpg'),
	(9, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_006.jpg');  
				INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(10, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_001.jpg'),
	(10, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_002.jpg'),
	(10, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_003.jpg'),
	(10, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_004.jpg'),
	(10, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_005.jpg'),
	(10, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(11, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00133.jpg'),
	(11, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_001.jpg'),
	(11, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_002.jpg'),
	(11, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_003.jpg'),
	(11, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_004.jpg'),
	(11, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_005.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(12, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_001.jpg'),
	(12, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_002.jpg'),
	(12, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_003.jpg'),
	(12, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_005.jpg'),
	(12, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_006.jpg'),
	(12, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00136.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(13, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00139.jpg'),
	(13, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_002.jpg'),
	(13, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_003.jpg'),
	(13, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_004.jpg'),
	(13, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_005.jpg'),
	(13, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(14, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/sra00302.jpg'),
	(14, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00302_003.jpg'),
	(14, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00302_004.jpg'),
	(14, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00302_005.jpg'),
	(14, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00302_006.jpg'),
	(14, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00302_002.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(15, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_012.jpg'),
	(15, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_010.jpg'),
	(15, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_001.jpg'),
	(15, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(16, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00145.jpg'),
	(16, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_002.jpg'),
	(16, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_005.jpg'),
	(16, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_006.jpg'),
	(16, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_004.jpg'),
	(16, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_003.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(17, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_002.jpg'),
	(17, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_004.jpg'),
	(17, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_005.jpg'),
	(17, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_006.jpg'),
	(17, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_003.jpg'),
	(17, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00148.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(18, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_011.jpg'),
	(18, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_001.jpg'),
	(18, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_010.jpg'),
	(18, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_007.jpg'),
	(18, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_012.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(19, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_6.jpg'),
	(19, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_5.jpg'),
	(19, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_4.jpg'),
	(19, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_3.jpg'),
	(19, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_2.jpg'),
	(19, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_1.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(20, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_001.jpg'),
	(20, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_002.jpg'),
	(20, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_003.jpg'),
	(20, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_004.jpg'),
	(20, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_005.jpg'),
	(20, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(21, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00163.jpg'),
	(21, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_002.jpg'),
	(21, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_003.jpg'),
	(21, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_004.jpg'),
	(21, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_006.jpg'),
	(21, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_005.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(22, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00166.jpg'),
	(22, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_001.jpg'),
	(22, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_002.jpg'),
	(22, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_003.jpg'),
	(22, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_005.jpg'),
	(22, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(23, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_007.jpg'),
	(23, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_012.jpg'),
	(23, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_011.jpg'),
	(23, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_009.jpg'),
	(23, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_008.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(24, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00172.jpg'),
	(24, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_001.jpg'),
	(24, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_002.jpg'),
	(24, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_003.jpg'),
	(24, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_004.jpg'),
	(24, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(25, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_001.jpg'),
	(25, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_002.jpg'),
	(25, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_003.jpg'),
	(25, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_004.jpg'),
	(25, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_005.jpg'),
	(25, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(27, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00174.jpg'),
	(27, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_001.jpg'),
	(27, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_002.jpg'),
	(27, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_003.jpg'),
	(27, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_004.jpg'),
	(27, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(28, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_001.jpg'),
	(28, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_002.jpg'),
	(28, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_003.jpg'),
	(28, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_004.jpg'),
	(28, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_005.jpg'),
	(28, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(29, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00181.jpg'),
	(29, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_001a.jpg'),
	(29, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_010.jpg'),
	(29, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_009.jpg'),
	(29, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_003.jpg'),
	(29, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_004.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(30, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00187.jpg'),
	(30, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_002.jpg'),
	(30, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_003.jpg'),
	(30, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_004.jpg'),
	(30, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_005.jpg'),
	(30, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(31, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_001.jpg'),
	(31, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_002.jpg'),
	(31, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_003.jpg'),
	(31, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_004.jpg'),
	(31, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_005.jpg'),
	(31, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(32, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_001.jpg'),
	(32, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_005.jpg'),
	(32, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_004.jpg'),
	(32, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_003.jpg'),
	(32, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_002.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(33, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/la_salle_lake9.jpg'),
	(33, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/la_salle_lake1.jpg'),
	(33, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/la_salle_lake8.jpg'),
	(33, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/la_salle_lake10.jpg'),
	(33, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/la_salle_lake5.jpg'),
	(33, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/la_salle_lake2.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(34, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00197.jpg'),
	(34, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_006.jpg'),
	(34, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_005.jpg'),
	(34, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_002.jpg'),
	(34, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_001.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(35, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00205.jpg'),
	(35, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_007.jpg'),
	(35, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_001.jpg'),
	(35, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_002.jpg'),
	(35, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_003.jpg'),
	(35, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_004.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(36, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00208.jpg'),
	(36, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_002.jpg'),
	(36, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_003.jpg'),
	(36, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_004.jpg'),
	(36, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_005.jpg'),
	(36, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(37, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_pelicans.jpg'),
	(37, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_campercabin.jpg'),
	(37, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_marshmarigold.jpg'),
	(37, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_turtle.jpg'),
	(37, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_fawn.jpg'),
	(37, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_fishing.jpg');
			INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(38, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_001.jpg'),
	(38, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_003.jpg'),
	(38, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_004.jpg'),
	(38, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_005.jpg'),
	(38, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_006.jpg');
			INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(39, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_001.jpg'),
	(39, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_002.jpg'),
	(39, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_003.jpg'),
	(39, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_004.jpg'),
	(39, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_005.jpg'),
	(39, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(40, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00220.jpg'),
	(40, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_001.jpg'),
	(40, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_002.jpg'),
	(40, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_003.jpg'),
	(40, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_004.jpg'),
	(40, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_005.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(41, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00285.jpg'),
	(41, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_002.jpg'),
	(41, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_003.jpg'),
	(41, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_004.jpg'),
	(41, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_005.jpg'),
	(41, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(42, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00229.jpg'),
	(42, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_001.jpg'),
	(42, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_002.jpg'),
	(42, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_003.jpg'),
	(42, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_004.jpg'),
	(42, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_005.jpg');
			INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(43, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_003.jpg'),
	(43, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_004.jpg'),
	(43, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_005.jpg'),
	(43, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_006.jpg'),
	(43, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_002.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(44, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00232.jpg'),
	(44, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_001.jpg'),
	(44, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_003.jpg'),
	(44, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_004.jpg'),
	(44, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_005.jpg'),
	(44, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(45, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00235.jpg'),
	(45, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_007.jpg'),
	(45, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_001.jpg'),
	(45, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_002.jpg'),
	(45, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_003.jpg'),
	(45, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_004.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(46, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/sra00304.jpg'),
	(46, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00304_001.jpg'),
	(46, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00304_003.jpg'),
	(46, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00304_004.jpg'),
	(46, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00304_005.jpg'),
	(46, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00304_006.jpg');
			INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(47, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_002.jpg'),
	(47, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_003.jpg'),
	(47, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_001.jpg'),
	(47, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_005.jpg'),
	(47, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_006.jpg'),
	(47, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00238.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(48, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00239.jpg'),
	(48, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_006.jpg'),
	(48, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_005.jpg'),
	(48, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_004.jpg'),
	(48, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_003.jpg'),
	(48, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_002.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(49, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00175.jpg'),
	(49, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_001.jpg'),
	(49, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_002.jpg'),
	(49, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_004.jpg'),
	(49, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_005.jpg'),
	(49, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(50, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00241.jpg'),
	(50, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_002.jpg'),
	(50, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_003.jpg'),
	(50, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_004.jpg'),
	(50, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_005.jpg'),
	(50, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(51, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_001.jpg'),
	(51, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_002.jpg'),
	(51, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_003.jpg'),
	(51, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_004.jpg'),
	(51, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_005.jpg'),
	(51, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(52, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00309_001.jpg'),
	(52, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00309_003.jpg'),
	(52, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00309_004.jpg'),
	(52, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00309_005.jpg'),
	(52, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00309_006.jpg'),
	(52, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SRA00309_002.jpg');
			INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(53, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00250.jpg'),
	(53, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_001.jpg'),
	(53, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_003.jpg'),
	(53, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_004.jpg'),
	(53, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_005.jpg'),
	(53, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_006.jpg');
				INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(54, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00253.jpg'),
	(54, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_001.jpg'),
	(54, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_002.jpg'),
	(54, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_003.jpg'),
	(54, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_005.jpg'),
	(54, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_006.jpg');

	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(55, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_001.jpg'),
	(55, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_002.jpg'),
	(55, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_003.jpg'),
	(55, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_004.jpg'),
	(55, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_005.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(56, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00259.jpg'),
	(56, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_001.jpg'),
	(56, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_003.jpg'),
	(56, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_004.jpg'),
	(56, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_005.jpg'),
	(56, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(57, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00262.jpg'),
	(57, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_001.jpg'),
	(57, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_003.jpg'),
	(57, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_004.jpg'),
	(57, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_005.jpg'),
	(57, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(58, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00263.jpg'),
	(58, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_001.jpg'),
	(58, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_002.jpg'),
	(58, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_003.jpg'),
	(58, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_004.jpg'),
	(58, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_005.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(59, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00265.jpg'),
	(59, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_002.jpg'),
	(59, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_003.jpg'),
	(59, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_005.jpg'),
	(59, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_006.jpg'),
	(59, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_004.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(60, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00267.jpg'),
	(60, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_002.jpg'),
	(60, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_003.jpg'),
	(60, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_004.jpg'),
	(60, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_005.jpg'),
	(60, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(61, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_001.jpg'),
	(61, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_002.jpg'),
	(61, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_003.jpg'),
	(61, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_004.jpg'),
	(61, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_005.jpg'),
	(61, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(62, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00268.jpg'),
	(62, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_001.jpg'),
	(62, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_002.jpg'),
	(62, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_003.jpg'),
	(62, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_004.jpg'),
	(62, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_005.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(63, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_8.jpg'),
	(63, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_1.jpg'),
	(63, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_2.jpg'),
	(63, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_3.jpg'),
	(63, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_4.jpg'),
	(63, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_5.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(64, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00277.jpg'),
	(64, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_001.jpg'),
	(64, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_002.jpg'),
	(64, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_004.jpg'),
	(64, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_005.jpg'),
	(64, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_006.jpg');
		INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(65, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_006.jpg'),
	(65, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_005.jpg'),
	(65, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_004.jpg'),
	(65, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_003.jpg'),
	(65, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_002.jpg'),
	(65, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_001.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(66, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00254.jpg'),
	(66, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_002.jpg'),
	(66, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_003.jpg'),
	(66, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_004.jpg'),
	(66, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_005.jpg'),
	(66, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(67, 'https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00283.jpg'),
	(67, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_002.jpg'),
	(67, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_003.jpg'),
	(67, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_004.jpg'),
	(67, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_005.jpg'),
	(67, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_006.jpg');
	INSERT INTO "state_park_images" ("state_park_id", "photo")
	VALUES(68, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_1.jpg'),
	(68, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_3.jpg'),
	(68, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_4.jpg'),
	(68, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_5.jpg'),
	(68, 'https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_6.jpg');
	
	SELECT "state_park_images"."photo" FROM "state_park_images"
	JOIN "state_park"
	 ON "state_park"."id" = "state_park_images"."state_park_id"
	WHERE "state_park"."id" = 8;