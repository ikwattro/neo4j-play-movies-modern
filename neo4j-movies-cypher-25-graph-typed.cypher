// SET GRAPH TYPE

ALTER CURRENT GRAPH TYPE SET {
  (:Person => {id:: STRING IS KEY, name:: STRING!, born:: DATE, bornIn:: STRING, bornPosition:: POINT}),
  (:Movie => {id:: STRING IS KEY, title:: STRING!, released:: DATE!, tagline:: STRING}),
  (:Person)-[:ACTED_IN => {id:: STRING IS KEY, roles:: LIST<STRING!>!}]->(:Movie),
  (:Person)-[:DIRECTED => {id:: STRING IS KEY}]->(:Movie),
  (:Person)-[:PRODUCED => {id:: STRING IS KEY}]->(:Movie),
  (:Person)-[:REVIEWED => {id:: STRING IS KEY, rating:: INTEGER!, summary:: STRING!}]->(:Movie),
  (:Person)-[:WROTE => {id:: STRING IS KEY}]->(:Movie),
  (:Person)-[:FOLLOWS => {id:: STRING IS KEY}]->(:Person)
};

// CREATE GRAPH DATA

CREATE (TheMatrix:Movie {id: "the matrix", title:"The Matrix", released: date({year: 1999}), tagline:'Welcome to the Real World'})
CREATE (Keanu:Person {id: "keanu reeves", name: "Keanu Reeves", born: date({year: 1964, month: 9, day: 2})})
SET Keanu.bornIn = 'Beirut, Lebanon'
SET Keanu.bornPosition = point({latitude: 33.8938, longitude: 35.5018})
CREATE (Carrie:Person {id: "carrie-anne moss", name: "Carrie-Anne Moss", born: date({year: 1967, month: 8, day: 21})})
SET Carrie.bornIn = 'Burnaby, British Columbia, Canada'
SET Carrie.bornPosition = point({latitude: 49.2488, longitude: -122.9805})
CREATE (Laurence:Person {id: "laurence fishburne", name: "Laurence Fishburne", born: date({year: 1961, month: 7, day: 30})})
SET Laurence.bornIn = 'Augusta, Georgia, USA'
SET Laurence.bornPosition = point({latitude: 33.4735, longitude: -82.0105})
CREATE (Hugo:Person {id: "hugo weaving", name: "Hugo Weaving", born: date({year: 1960, month: 4, day: 4})})
SET Hugo.bornIn = 'Ibadan, Nigeria'
SET Hugo.bornPosition = point({latitude: 7.3775, longitude: 3.9470})
CREATE (LillyW:Person {id: "lilly wachowski", name: "Lilly Wachowski", born: date({year: 1967})})
CREATE (LanaW:Person {id: "lana wachowski", name: "Lana Wachowski", born: date({year: 1965})})
CREATE (JoelS:Person {id: "joel silver", name: "Joel Silver", born: date({year: 1952})})
CREATE
(Keanu)-[:ACTED_IN {id:randomUuid(), roles:['Neo']}]->(TheMatrix),
(Carrie)-[:ACTED_IN {id:randomUuid(), roles:['Trinity']}]->(TheMatrix),
(Laurence)-[:ACTED_IN {id:randomUuid(), roles:['Morpheus']}]->(TheMatrix),
(Hugo)-[:ACTED_IN {id:randomUuid(), roles:['Agent Smith']}]->(TheMatrix),
(LillyW)-[:DIRECTED {id: randomUuid()}]->(TheMatrix),
(LanaW)-[:DIRECTED {id: randomUuid()}]->(TheMatrix),
(JoelS)-[:PRODUCED {id: randomUuid()}]->(TheMatrix)

CREATE (Emil:Person {id: "emil eifrem", name: "Emil Eifrem", born: date({year: 1978})})
CREATE (Emil)-[:ACTED_IN {id:randomUuid(), roles:["Emil"]}]->(TheMatrix)

CREATE (TheMatrixReloaded:Movie {id: "the matrix reloaded", title:"The Matrix Reloaded", released: date({year: 2003}), tagline:'Free your mind'})
CREATE
(Keanu)-[:ACTED_IN {id:randomUuid(), roles:['Neo']}]->(TheMatrixReloaded),
(Carrie)-[:ACTED_IN {id:randomUuid(), roles:['Trinity']}]->(TheMatrixReloaded),
(Laurence)-[:ACTED_IN {id:randomUuid(), roles:['Morpheus']}]->(TheMatrixReloaded),
(Hugo)-[:ACTED_IN {id:randomUuid(), roles:['Agent Smith']}]->(TheMatrixReloaded),
(LillyW)-[:DIRECTED {id: randomUuid()}]->(TheMatrixReloaded),
(LanaW)-[:DIRECTED {id: randomUuid()}]->(TheMatrixReloaded),
(JoelS)-[:PRODUCED {id: randomUuid()}]->(TheMatrixReloaded)

CREATE (TheMatrixRevolutions:Movie {id: "the matrix revolutions", title:"The Matrix Revolutions", released: date({year: 2003}), tagline:'Everything that has a beginning has an end'})
CREATE
(Keanu)-[:ACTED_IN {id:randomUuid(), roles:['Neo']}]->(TheMatrixRevolutions),
(Carrie)-[:ACTED_IN {id:randomUuid(), roles:['Trinity']}]->(TheMatrixRevolutions),
(Laurence)-[:ACTED_IN {id:randomUuid(), roles:['Morpheus']}]->(TheMatrixRevolutions),
(Hugo)-[:ACTED_IN {id:randomUuid(), roles:['Agent Smith']}]->(TheMatrixRevolutions),
(LillyW)-[:DIRECTED {id: randomUuid()}]->(TheMatrixRevolutions),
(LanaW)-[:DIRECTED {id: randomUuid()}]->(TheMatrixRevolutions),
(JoelS)-[:PRODUCED {id: randomUuid()}]->(TheMatrixRevolutions)

CREATE (TheDevilsAdvocate:Movie {id: "the devil's advocate", title:"The Devil's Advocate", released: date({year: 1997}), tagline:'Evil has its winning ways'})
CREATE (Charlize:Person {id: "charlize theron", name: "Charlize Theron", born: date({year: 1975})})
CREATE (Al:Person {id: "al pacino", name: "Al Pacino", born: date({year: 1940})})
CREATE (Taylor:Person {id: "taylor hackford", name: "Taylor Hackford", born: date({year: 1944})})
CREATE
(Keanu)-[:ACTED_IN {id:randomUuid(), roles:['Kevin Lomax']}]->(TheDevilsAdvocate),
(Charlize)-[:ACTED_IN {id:randomUuid(), roles:['Mary Ann Lomax']}]->(TheDevilsAdvocate),
(Al)-[:ACTED_IN {id:randomUuid(), roles:['John Milton']}]->(TheDevilsAdvocate),
(Taylor)-[:DIRECTED {id: randomUuid()}]->(TheDevilsAdvocate)

CREATE (AFewGoodMen:Movie {id: "a few good men", title:"A Few Good Men", released: date({year: 1992}), tagline:"In the heart of the nation's capital, in a courthouse of the U.S. government, one man will stop at nothing to keep his honor, and one will stop at nothing to find the truth."})
CREATE (TomC:Person {id: "tom cruise", name: "Tom Cruise", born: date({year: 1962, month: 7, day: 3})})
SET TomC.bornIn = 'Syracuse, New York, USA'
SET TomC.bornPosition = point({latitude: 43.0481, longitude: -76.1474})
CREATE (JackN:Person {id: "jack nicholson", name: "Jack Nicholson", born: date({year: 1937})})
CREATE (DemiM:Person {id: "demi moore", name: "Demi Moore", born: date({year: 1962})})
CREATE (KevinB:Person {id: "kevin bacon", name: "Kevin Bacon", born: date({year: 1958})})
CREATE (KieferS:Person {id: "kiefer sutherland", name: "Kiefer Sutherland", born: date({year: 1966})})
CREATE (NoahW:Person {id: "noah wyle", name: "Noah Wyle", born: date({year: 1971})})
CREATE (CubaG:Person {id: "cuba gooding jr.", name: "Cuba Gooding Jr.", born: date({year: 1968})})
CREATE (KevinP:Person {id: "kevin pollak", name: "Kevin Pollak", born: date({year: 1957})})
CREATE (JTW:Person {id: "j.t. walsh", name: "J.T. Walsh", born: date({year: 1943})})
CREATE (JamesM:Person {id: "james marshall", name: "James Marshall", born: date({year: 1967})})
CREATE (ChristopherG:Person {id: "christopher guest", name: "Christopher Guest", born: date({year: 1948})})
CREATE (RobR:Person {id: "rob reiner", name: "Rob Reiner", born: date({year: 1947})})
CREATE (AaronS:Person {id: "aaron sorkin", name: "Aaron Sorkin", born: date({year: 1961})})
CREATE
(TomC)-[:ACTED_IN {id:randomUuid(), roles:['Lt. Daniel Kaffee']}]->(AFewGoodMen),
(JackN)-[:ACTED_IN {id:randomUuid(), roles:['Col. Nathan R. Jessup']}]->(AFewGoodMen),
(DemiM)-[:ACTED_IN {id:randomUuid(), roles:['Lt. Cdr. JoAnne Galloway']}]->(AFewGoodMen),
(KevinB)-[:ACTED_IN {id:randomUuid(), roles:['Capt. Jack Ross']}]->(AFewGoodMen),
(KieferS)-[:ACTED_IN {id:randomUuid(), roles:['Lt. Jonathan Kendrick']}]->(AFewGoodMen),
(NoahW)-[:ACTED_IN {id:randomUuid(), roles:['Cpl. Jeffrey Barnes']}]->(AFewGoodMen),
(CubaG)-[:ACTED_IN {id:randomUuid(), roles:['Cpl. Carl Hammaker']}]->(AFewGoodMen),
(KevinP)-[:ACTED_IN {id:randomUuid(), roles:['Lt. Sam Weinberg']}]->(AFewGoodMen),
(JTW)-[:ACTED_IN {id:randomUuid(), roles:['Lt. Col. Matthew Andrew Markinson']}]->(AFewGoodMen),
(JamesM)-[:ACTED_IN {id:randomUuid(), roles:['Pfc. Louden Downey']}]->(AFewGoodMen),
(ChristopherG)-[:ACTED_IN {id:randomUuid(), roles:['Dr. Stone']}]->(AFewGoodMen),
(AaronS)-[:ACTED_IN {id:randomUuid(), roles:['Man in Bar']}]->(AFewGoodMen),
(RobR)-[:DIRECTED {id: randomUuid()}]->(AFewGoodMen),
(AaronS)-[:WROTE {id: randomUuid()}]->(AFewGoodMen)

CREATE (TopGun:Movie {id: "top gun", title:"Top Gun", released: date({year: 1986}), tagline:'I feel the need, the need for speed.'})
CREATE (KellyM:Person {id: "kelly mcgillis", name: "Kelly McGillis", born: date({year: 1957, month: 7, day: 9})})
SET KellyM.bornIn = 'Newport Beach, California, USA'
SET KellyM.bornPosition = point({latitude: 33.6189, longitude: -117.9298})
CREATE (ValK:Person {id: "val kilmer", name: "Val Kilmer", born: date({year: 1959, month: 12, day: 31})})
SET ValK.bornIn = 'Los Angeles, California, USA'
SET ValK.bornPosition = point({latitude: 34.0522, longitude: -118.2437})
CREATE (AnthonyE:Person {id: "anthony edwards", name: "Anthony Edwards", born: date({year: 1962, month: 7, day: 19})})
SET AnthonyE.bornIn = 'Santa Barbara, California, USA'
SET AnthonyE.bornPosition = point({latitude: 34.4208, longitude: -119.6982})
CREATE (TomS:Person {id: "tom skerritt", name: "Tom Skerritt", born: date({year: 1933, month: 8, day: 25})})
SET TomS.bornIn = 'Detroit, Michigan, USA'
SET TomS.bornPosition = point({latitude: 42.3314, longitude: -83.0458})
CREATE (MegR:Person {id: "meg ryan", name: "Meg Ryan", born: date({year: 1961})})
SET MegR.bornIn = 'Fairfield, Connecticut, USA'
SET MegR.bornPosition = point({latitude: 41.1415, longitude: -73.2637})
CREATE (TonyS:Person {id: "tony scott", name: "Tony Scott", born: date({year: 1944})})
CREATE (JimC:Person {id: "jim cash", name: "Jim Cash", born: date({year: 1941})})
CREATE
(TomC)-[:ACTED_IN {id:randomUuid(), roles:['Maverick']}]->(TopGun),
(KellyM)-[:ACTED_IN {id:randomUuid(), roles:['Charlie']}]->(TopGun),
(ValK)-[:ACTED_IN {id:randomUuid(), roles:['Iceman']}]->(TopGun),
(AnthonyE)-[:ACTED_IN {id:randomUuid(), roles:['Goose']}]->(TopGun),
(TomS)-[:ACTED_IN {id:randomUuid(), roles:['Viper']}]->(TopGun),
(MegR)-[:ACTED_IN {id:randomUuid(), roles:['Carole']}]->(TopGun),
(TonyS)-[:DIRECTED {id: randomUuid()}]->(TopGun),
(JimC)-[:WROTE {id: randomUuid()}]->(TopGun)

CREATE (JerryMaguire:Movie {id: "jerry maguire", title:"Jerry Maguire", released: date({year: 2000}), tagline:'The rest of his life begins now.'})
CREATE (ReneeZ:Person {id: "renee zellweger", name: "Renee Zellweger", born: date({year: 1969})})
CREATE (KellyP:Person {id: "kelly preston", name: "Kelly Preston", born: date({year: 1962})})
CREATE (JerryO:Person {id: "jerry o'connell", name: "Jerry O'Connell", born: date({year: 1974})})
CREATE (JayM:Person {id: "jay mohr", name: "Jay Mohr", born: date({year: 1970})})
CREATE (BonnieH:Person {id: "bonnie hunt", name: "Bonnie Hunt", born: date({year: 1961})})
CREATE (ReginaK:Person {id: "regina king", name: "Regina King", born: date({year: 1971})})
CREATE (JonathanL:Person {id: "jonathan lipnicki", name: "Jonathan Lipnicki", born: date({year: 1996})})
CREATE (CameronC:Person {id: "cameron crowe", name: "Cameron Crowe", born: date({year: 1957})})
CREATE
(TomC)-[:ACTED_IN {id:randomUuid(), roles:['Jerry Maguire']}]->(JerryMaguire),
(CubaG)-[:ACTED_IN {id:randomUuid(), roles:['Rod Tidwell']}]->(JerryMaguire),
(ReneeZ)-[:ACTED_IN {id:randomUuid(), roles:['Dorothy Boyd']}]->(JerryMaguire),
(KellyP)-[:ACTED_IN {id:randomUuid(), roles:['Avery Bishop']}]->(JerryMaguire),
(JerryO)-[:ACTED_IN {id:randomUuid(), roles:['Frank Cushman']}]->(JerryMaguire),
(JayM)-[:ACTED_IN {id:randomUuid(), roles:['Bob Sugar']}]->(JerryMaguire),
(BonnieH)-[:ACTED_IN {id:randomUuid(), roles:['Laurel Boyd']}]->(JerryMaguire),
(ReginaK)-[:ACTED_IN {id:randomUuid(), roles:['Marcee Tidwell']}]->(JerryMaguire),
(JonathanL)-[:ACTED_IN {id:randomUuid(), roles:['Ray Boyd']}]->(JerryMaguire),
(CameronC)-[:DIRECTED {id: randomUuid()}]->(JerryMaguire),
(CameronC)-[:PRODUCED {id: randomUuid()}]->(JerryMaguire),
(CameronC)-[:WROTE {id: randomUuid()}]->(JerryMaguire)

CREATE (StandByMe:Movie {id: "stand by me", title:"Stand By Me", released: date({year: 1986}), tagline:"For some, it's the last real taste of innocence, and the first real taste of life. But for everyone, it's the time that memories are made of."})
CREATE (RiverP:Person {id: "river phoenix", name: "River Phoenix", born: date({year: 1970})})
CREATE (CoreyF:Person {id: "corey feldman", name: "Corey Feldman", born: date({year: 1971})})
CREATE (WilW:Person {id: "wil wheaton", name: "Wil Wheaton", born: date({year: 1972})})
CREATE (JohnC:Person {id: "john cusack", name: "John Cusack", born: date({year: 1966})})
CREATE (MarshallB:Person {id: "marshall bell", name: "Marshall Bell", born: date({year: 1942})})
CREATE
(WilW)-[:ACTED_IN {id:randomUuid(), roles:['Gordie Lachance']}]->(StandByMe),
(RiverP)-[:ACTED_IN {id:randomUuid(), roles:['Chris Chambers']}]->(StandByMe),
(JerryO)-[:ACTED_IN {id:randomUuid(), roles:['Vern Tessio']}]->(StandByMe),
(CoreyF)-[:ACTED_IN {id:randomUuid(), roles:['Teddy Duchamp']}]->(StandByMe),
(JohnC)-[:ACTED_IN {id:randomUuid(), roles:['Denny Lachance']}]->(StandByMe),
(KieferS)-[:ACTED_IN {id:randomUuid(), roles:['Ace Merrill']}]->(StandByMe),
(MarshallB)-[:ACTED_IN {id:randomUuid(), roles:['Mr. Lachance']}]->(StandByMe),
(RobR)-[:DIRECTED {id: randomUuid()}]->(StandByMe)

CREATE (AsGoodAsItGets:Movie {id: "as good as it gets", title:"As Good as It Gets", released: date({year: 1997}), tagline:'A comedy from the heart that goes for the throat.'})
CREATE (HelenH:Person {id: "helen hunt", name: "Helen Hunt", born: date({year: 1963})})
CREATE (GregK:Person {id: "greg kinnear", name: "Greg Kinnear", born: date({year: 1963})})
CREATE (JamesB:Person {id: "james l. brooks", name: "James L. Brooks", born: date({year: 1940})})
CREATE
(JackN)-[:ACTED_IN {id:randomUuid(), roles:['Melvin Udall']}]->(AsGoodAsItGets),
(HelenH)-[:ACTED_IN {id:randomUuid(), roles:['Carol Connelly']}]->(AsGoodAsItGets),
(GregK)-[:ACTED_IN {id:randomUuid(), roles:['Simon Bishop']}]->(AsGoodAsItGets),
(CubaG)-[:ACTED_IN {id:randomUuid(), roles:['Frank Sachs']}]->(AsGoodAsItGets),
(JamesB)-[:DIRECTED {id: randomUuid()}]->(AsGoodAsItGets)

CREATE (WhatDreamsMayCome:Movie {id: "what dreams may come", title:"What Dreams May Come", released: date({year: 1998}), tagline:'After life there is more. The end is just the beginning.'})
CREATE (AnnabellaS:Person {id: "annabella sciorra", name: "Annabella Sciorra", born: date({year: 1960})})
CREATE (MaxS:Person {id: "max von sydow", name: "Max von Sydow", born: date({year: 1929})})
CREATE (WernerH:Person {id: "werner herzog", name: "Werner Herzog", born: date({year: 1942})})
CREATE (Robin:Person {id: "robin williams", name: "Robin Williams", born: date({year: 1951})})
CREATE (VincentW:Person {id: "vincent ward", name: "Vincent Ward", born: date({year: 1956})})
CREATE
(Robin)-[:ACTED_IN {id:randomUuid(), roles:['Chris Nielsen']}]->(WhatDreamsMayCome),
(CubaG)-[:ACTED_IN {id:randomUuid(), roles:['Albert Lewis']}]->(WhatDreamsMayCome),
(AnnabellaS)-[:ACTED_IN {id:randomUuid(), roles:['Annie Collins-Nielsen']}]->(WhatDreamsMayCome),
(MaxS)-[:ACTED_IN {id:randomUuid(), roles:['The Tracker']}]->(WhatDreamsMayCome),
(WernerH)-[:ACTED_IN {id:randomUuid(), roles:['The Face']}]->(WhatDreamsMayCome),
(VincentW)-[:DIRECTED {id: randomUuid()}]->(WhatDreamsMayCome)

CREATE (SnowFallingonCedars:Movie {id: "snow falling on cedars", title:"Snow Falling on Cedars", released: date({year: 1999}), tagline:'First loves last. Forever.'})
CREATE (EthanH:Person {id: "ethan hawke", name: "Ethan Hawke", born: date({year: 1970})})
CREATE (RickY:Person {id: "rick yune", name: "Rick Yune", born: date({year: 1971})})
CREATE (JamesC:Person {id: "james cromwell", name: "James Cromwell", born: date({year: 1940})})
CREATE (ScottH:Person {id: "scott hicks", name: "Scott Hicks", born: date({year: 1953})})
CREATE
(EthanH)-[:ACTED_IN {id:randomUuid(), roles:['Ishmael Chambers']}]->(SnowFallingonCedars),
(RickY)-[:ACTED_IN {id:randomUuid(), roles:['Kazuo Miyamoto']}]->(SnowFallingonCedars),
(MaxS)-[:ACTED_IN {id:randomUuid(), roles:['Nels Gudmundsson']}]->(SnowFallingonCedars),
(JamesC)-[:ACTED_IN {id:randomUuid(), roles:['Judge Fielding']}]->(SnowFallingonCedars),
(ScottH)-[:DIRECTED {id: randomUuid()}]->(SnowFallingonCedars)

CREATE (YouveGotMail:Movie {id: "you've got mail", title:"You've Got Mail", released: date({year: 1998}), tagline:'At odds in life... in love on-line.'})
CREATE (ParkerP:Person {id: "parker posey", name: "Parker Posey", born: date({year: 1968})})
CREATE (DaveC:Person {id: "dave chappelle", name: "Dave Chappelle", born: date({year: 1973})})
CREATE (SteveZ:Person {id: "steve zahn", name: "Steve Zahn", born: date({year: 1967})})
CREATE (TomH:Person {id: "tom hanks", name: "Tom Hanks", born: date({year: 1956})})
CREATE (NoraE:Person {id: "nora ephron", name: "Nora Ephron", born: date({year: 1941})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Joe Fox']}]->(YouveGotMail),
(MegR)-[:ACTED_IN {id:randomUuid(), roles:['Kathleen Kelly']}]->(YouveGotMail),
(GregK)-[:ACTED_IN {id:randomUuid(), roles:['Frank Navasky']}]->(YouveGotMail),
(ParkerP)-[:ACTED_IN {id:randomUuid(), roles:['Patricia Eden']}]->(YouveGotMail),
(DaveC)-[:ACTED_IN {id:randomUuid(), roles:['Kevin Jackson']}]->(YouveGotMail),
(SteveZ)-[:ACTED_IN {id:randomUuid(), roles:['George Pappas']}]->(YouveGotMail),
(NoraE)-[:DIRECTED {id: randomUuid()}]->(YouveGotMail)

CREATE (SleeplessInSeattle:Movie {id: "sleepless in seattle", title:"Sleepless in Seattle", released: date({year: 1993}), tagline:'What if someone you never met, someone you never saw, someone you never knew was the only someone for you?'})
CREATE (RitaW:Person {id: "rita wilson", name: "Rita Wilson", born: date({year: 1956})})
CREATE (BillPull:Person {id: "bill pullman", name: "Bill Pullman", born: date({year: 1953})})
CREATE (VictorG:Person {id: "victor garber", name: "Victor Garber", born: date({year: 1949})})
CREATE (RosieO:Person {id: "rosie o'donnell", name: "Rosie O'Donnell", born: date({year: 1962})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Sam Baldwin']}]->(SleeplessInSeattle),
(MegR)-[:ACTED_IN {id:randomUuid(), roles:['Annie Reed']}]->(SleeplessInSeattle),
(RitaW)-[:ACTED_IN {id:randomUuid(), roles:['Suzy']}]->(SleeplessInSeattle),
(BillPull)-[:ACTED_IN {id:randomUuid(), roles:['Walter']}]->(SleeplessInSeattle),
(VictorG)-[:ACTED_IN {id:randomUuid(), roles:['Greg']}]->(SleeplessInSeattle),
(RosieO)-[:ACTED_IN {id:randomUuid(), roles:['Becky']}]->(SleeplessInSeattle),
(NoraE)-[:DIRECTED {id: randomUuid()}]->(SleeplessInSeattle)

CREATE (JoeVersustheVolcano:Movie {id: "joe versus the volcano", title:"Joe Versus the Volcano", released: date({year: 1990}), tagline:'A story of love, lava and burning desire.'})
CREATE (JohnS:Person {id: "john patrick stanley", name: "John Patrick Stanley", born: date({year: 1950})})
CREATE (Nathan:Person {id: "nathan lane", name: "Nathan Lane", born: date({year: 1956})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Joe Banks']}]->(JoeVersustheVolcano),
(MegR)-[:ACTED_IN {id:randomUuid(), roles:['DeDe', 'Angelica Graynamore', 'Patricia Graynamore']}]->(JoeVersustheVolcano),
(Nathan)-[:ACTED_IN {id:randomUuid(), roles:['Baw']}]->(JoeVersustheVolcano),
(JohnS)-[:DIRECTED {id: randomUuid()}]->(JoeVersustheVolcano)

CREATE (WhenHarryMetSally:Movie {id: "when harry met sally", title:"When Harry Met Sally", released: date({year: 1998}), tagline:'Can two friends sleep together and still love each other in the morning?'})
CREATE (BillyC:Person {id: "billy crystal", name: "Billy Crystal", born: date({year: 1948})})
CREATE (CarrieF:Person {id: "carrie fisher", name: "Carrie Fisher", born: date({year: 1956})})
CREATE (BrunoK:Person {id: "bruno kirby", name: "Bruno Kirby", born: date({year: 1949})})
CREATE
(BillyC)-[:ACTED_IN {id:randomUuid(), roles:['Harry Burns']}]->(WhenHarryMetSally),
(MegR)-[:ACTED_IN {id:randomUuid(), roles:['Sally Albright']}]->(WhenHarryMetSally),
(CarrieF)-[:ACTED_IN {id:randomUuid(), roles:['Marie']}]->(WhenHarryMetSally),
(BrunoK)-[:ACTED_IN {id:randomUuid(), roles:['Jess']}]->(WhenHarryMetSally),
(RobR)-[:DIRECTED {id: randomUuid()}]->(WhenHarryMetSally),
(RobR)-[:PRODUCED {id: randomUuid()}]->(WhenHarryMetSally),
(NoraE)-[:PRODUCED {id: randomUuid()}]->(WhenHarryMetSally),
(NoraE)-[:WROTE {id: randomUuid()}]->(WhenHarryMetSally)

CREATE (ThatThingYouDo:Movie {id: "that thing you do", title:"That Thing You Do", released: date({year: 1996}), tagline:'In every life there comes a time when that thing you dream becomes that thing you do'})
CREATE (LivT:Person {id: "liv tyler", name: "Liv Tyler", born: date({year: 1977})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Mr. White']}]->(ThatThingYouDo),
(LivT)-[:ACTED_IN {id:randomUuid(), roles:['Faye Dolan']}]->(ThatThingYouDo),
(Charlize)-[:ACTED_IN {id:randomUuid(), roles:['Tina']}]->(ThatThingYouDo),
(TomH)-[:DIRECTED {id: randomUuid()}]->(ThatThingYouDo)

CREATE (TheReplacements:Movie {id: "the replacements", title:"The Replacements", released: date({year: 2000}), tagline:'Pain heals, Chicks dig scars... Glory lasts forever'})
CREATE (Brooke:Person {id: "brooke langton", name: "Brooke Langton", born: date({year: 1970})})
CREATE (Gene:Person {id: "gene hackman", name: "Gene Hackman", born: date({year: 1930})})
CREATE (Orlando:Person {id: "orlando jones", name: "Orlando Jones", born: date({year: 1968})})
CREATE (Howard:Person {id: "howard deutch", name: "Howard Deutch", born: date({year: 1950})})
CREATE
(Keanu)-[:ACTED_IN {id:randomUuid(), roles:['Shane Falco']}]->(TheReplacements),
(Brooke)-[:ACTED_IN {id:randomUuid(), roles:['Annabelle Farrell']}]->(TheReplacements),
(Gene)-[:ACTED_IN {id:randomUuid(), roles:['Jimmy McGinty']}]->(TheReplacements),
(Orlando)-[:ACTED_IN {id:randomUuid(), roles:['Clifford Franklin']}]->(TheReplacements),
(Howard)-[:DIRECTED {id: randomUuid()}]->(TheReplacements)

CREATE (RescueDawn:Movie {id: "rescuedawn", title:"RescueDawn", released: date({year: 2006}), tagline:"Based on the extraordinary true story of one man's fight for freedom"})
CREATE (ChristianB:Person {id: "christian bale", name: "Christian Bale", born: date({year: 1974})})
CREATE (ZachG:Person {id: "zach grenier", name: "Zach Grenier", born: date({year: 1954})})
CREATE
(MarshallB)-[:ACTED_IN {id:randomUuid(), roles:['Admiral']}]->(RescueDawn),
(ChristianB)-[:ACTED_IN {id:randomUuid(), roles:['Dieter Dengler']}]->(RescueDawn),
(ZachG)-[:ACTED_IN {id:randomUuid(), roles:['Squad Leader']}]->(RescueDawn),
(SteveZ)-[:ACTED_IN {id:randomUuid(), roles:['Duane']}]->(RescueDawn),
(WernerH)-[:DIRECTED {id: randomUuid()}]->(RescueDawn)

CREATE (TheBirdcage:Movie {id: "the birdcage", title:"The Birdcage", released: date({year: 1996}), tagline:'Come as you are'})
CREATE (MikeN:Person {id: "mike nichols", name: "Mike Nichols", born: date({year: 1931})})
CREATE
(Robin)-[:ACTED_IN {id:randomUuid(), roles:['Armand Goldman']}]->(TheBirdcage),
(Nathan)-[:ACTED_IN {id:randomUuid(), roles:['Albert Goldman']}]->(TheBirdcage),
(Gene)-[:ACTED_IN {id:randomUuid(), roles:['Sen. Kevin Keeley']}]->(TheBirdcage),
(MikeN)-[:DIRECTED {id: randomUuid()}]->(TheBirdcage)

CREATE (Unforgiven:Movie {id: "unforgiven", title:"Unforgiven", released: date({year: 1992}), tagline:"It's a hell of a thing, killing a man"})
CREATE (RichardH:Person {id: "richard harris", name: "Richard Harris", born: date({year: 1930})})
CREATE (ClintE:Person {id: "clint eastwood", name: "Clint Eastwood", born: date({year: 1930})})
CREATE
(RichardH)-[:ACTED_IN {id:randomUuid(), roles:['English Bob']}]->(Unforgiven),
(ClintE)-[:ACTED_IN {id:randomUuid(), roles:['Bill Munny']}]->(Unforgiven),
(Gene)-[:ACTED_IN {id:randomUuid(), roles:['Little Bill Daggett']}]->(Unforgiven),
(ClintE)-[:DIRECTED {id: randomUuid()}]->(Unforgiven)

CREATE (JohnnyMnemonic:Movie {id: "johnny mnemonic", title:"Johnny Mnemonic", released: date({year: 1995}), tagline:'The hottest data on earth. In the coolest head in town'})
CREATE (Takeshi:Person {id: "takeshi kitano", name: "Takeshi Kitano", born: date({year: 1947})})
CREATE (Dina:Person {id: "dina meyer", name: "Dina Meyer", born: date({year: 1968})})
CREATE (IceT:Person {id: "ice-t", name: "Ice-T", born: date({year: 1958})})
CREATE (RobertL:Person {id: "robert longo", name: "Robert Longo", born: date({year: 1953})})
CREATE
(Keanu)-[:ACTED_IN {id:randomUuid(), roles:['Johnny Mnemonic']}]->(JohnnyMnemonic),
(Takeshi)-[:ACTED_IN {id:randomUuid(), roles:['Takahashi']}]->(JohnnyMnemonic),
(Dina)-[:ACTED_IN {id:randomUuid(), roles:['Jane']}]->(JohnnyMnemonic),
(IceT)-[:ACTED_IN {id:randomUuid(), roles:['J-Bone']}]->(JohnnyMnemonic),
(RobertL)-[:DIRECTED {id: randomUuid()}]->(JohnnyMnemonic)

CREATE (CloudAtlas:Movie {id: "cloud atlas", title:"Cloud Atlas", released: date({year: 2012}), tagline:'Everything is connected'})
CREATE (HalleB:Person {id: "halle berry", name: "Halle Berry", born: date({year: 1966})})
CREATE (JimB:Person {id: "jim broadbent", name: "Jim Broadbent", born: date({year: 1949})})
CREATE (TomT:Person {id: "tom tykwer", name: "Tom Tykwer", born: date({year: 1965})})
CREATE (DavidMitchell:Person {id: "david mitchell", name: "David Mitchell", born: date({year: 1969})})
CREATE (StefanArndt:Person {id: "stefan arndt", name: "Stefan Arndt", born: date({year: 1961})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Zachry', 'Dr. Henry Goose', 'Isaac Sachs', 'Dermot Hoggins']}]->(CloudAtlas),
(Hugo)-[:ACTED_IN {id:randomUuid(), roles:['Bill Smoke', 'Haskell Moore', 'Tadeusz Kesselring', 'Nurse Noakes', 'Boardman Mephi', 'Old Georgie']}]->(CloudAtlas),
(HalleB)-[:ACTED_IN {id:randomUuid(), roles:['Luisa Rey', 'Jocasta Ayrs', 'Ovid', 'Meronym']}]->(CloudAtlas),
(JimB)-[:ACTED_IN {id:randomUuid(), roles:['Vyvyan Ayrs', 'Captain Molyneux', 'Timothy Cavendish']}]->(CloudAtlas),
(TomT)-[:DIRECTED {id: randomUuid()}]->(CloudAtlas),
(LillyW)-[:DIRECTED {id: randomUuid()}]->(CloudAtlas),
(LanaW)-[:DIRECTED {id: randomUuid()}]->(CloudAtlas),
(DavidMitchell)-[:WROTE {id: randomUuid()}]->(CloudAtlas),
(StefanArndt)-[:PRODUCED {id: randomUuid()}]->(CloudAtlas)

CREATE (TheDaVinciCode:Movie {id: "the da vinci code", title:"The Da Vinci Code", released: date({year: 2006}), tagline:'Break The Codes'})
CREATE (IanM:Person {id: "ian mckellen", name: "Ian McKellen", born: date({year: 1939})})
CREATE (AudreyT:Person {id: "audrey tautou", name: "Audrey Tautou", born: date({year: 1976})})
CREATE (PaulB:Person {id: "paul bettany", name: "Paul Bettany", born: date({year: 1971})})
CREATE (RonH:Person {id: "ron howard", name: "Ron Howard", born: date({year: 1954})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Dr. Robert Langdon']}]->(TheDaVinciCode),
(IanM)-[:ACTED_IN {id:randomUuid(), roles:['Sir Leight Teabing']}]->(TheDaVinciCode),
(AudreyT)-[:ACTED_IN {id:randomUuid(), roles:['Sophie Neveu']}]->(TheDaVinciCode),
(PaulB)-[:ACTED_IN {id:randomUuid(), roles:['Silas']}]->(TheDaVinciCode),
(RonH)-[:DIRECTED {id: randomUuid()}]->(TheDaVinciCode)

CREATE (VforVendetta:Movie {id: "v for vendetta", title:"V for Vendetta", released: date({year: 2006}), tagline:'Freedom! Forever!'})
CREATE (NatalieP:Person {id: "natalie portman", name: "Natalie Portman", born: date({year: 1981})})
CREATE (StephenR:Person {id: "stephen rea", name: "Stephen Rea", born: date({year: 1946})})
CREATE (JohnH:Person {id: "john hurt", name: "John Hurt", born: date({year: 1940})})
CREATE (BenM:Person {id: "ben miles", name: "Ben Miles", born: date({year: 1967})})
CREATE
(Hugo)-[:ACTED_IN {id:randomUuid(), roles:['V']}]->(VforVendetta),
(NatalieP)-[:ACTED_IN {id:randomUuid(), roles:['Evey Hammond']}]->(VforVendetta),
(StephenR)-[:ACTED_IN {id:randomUuid(), roles:['Eric Finch']}]->(VforVendetta),
(JohnH)-[:ACTED_IN {id:randomUuid(), roles:['High Chancellor Adam Sutler']}]->(VforVendetta),
(BenM)-[:ACTED_IN {id:randomUuid(), roles:['Dascomb']}]->(VforVendetta),
(JamesM)-[:DIRECTED {id: randomUuid()}]->(VforVendetta),
(LillyW)-[:PRODUCED {id: randomUuid()}]->(VforVendetta),
(LanaW)-[:PRODUCED {id: randomUuid()}]->(VforVendetta),
(JoelS)-[:PRODUCED {id: randomUuid()}]->(VforVendetta),
(LillyW)-[:WROTE {id: randomUuid()}]->(VforVendetta),
(LanaW)-[:WROTE {id: randomUuid()}]->(VforVendetta)

CREATE (SpeedRacer:Movie {id: "speed racer", title:"Speed Racer", released: date({year: 2008}), tagline:'Speed has no limits'})
CREATE (EmileH:Person {id: "emile hirsch", name: "Emile Hirsch", born: date({year: 1985})})
CREATE (JohnG:Person {id: "john goodman", name: "John Goodman", born: date({year: 1960})})
CREATE (SusanS:Person {id: "susan sarandon", name: "Susan Sarandon", born: date({year: 1946})})
CREATE (MatthewF:Person {id: "matthew fox", name: "Matthew Fox", born: date({year: 1966})})
CREATE (ChristinaR:Person {id: "christina ricci", name: "Christina Ricci", born: date({year: 1980})})
CREATE (Rain:Person {id: "rain", name: "Rain", born: date({year: 1982})})
CREATE
(EmileH)-[:ACTED_IN {id:randomUuid(), roles:['Speed Racer']}]->(SpeedRacer),
(JohnG)-[:ACTED_IN {id:randomUuid(), roles:['Pops']}]->(SpeedRacer),
(SusanS)-[:ACTED_IN {id:randomUuid(), roles:['Mom']}]->(SpeedRacer),
(MatthewF)-[:ACTED_IN {id:randomUuid(), roles:['Racer X']}]->(SpeedRacer),
(ChristinaR)-[:ACTED_IN {id:randomUuid(), roles:['Trixie']}]->(SpeedRacer),
(Rain)-[:ACTED_IN {id:randomUuid(), roles:['Taejo Togokahn']}]->(SpeedRacer),
(BenM)-[:ACTED_IN {id:randomUuid(), roles:['Cass Jones']}]->(SpeedRacer),
(LillyW)-[:DIRECTED {id: randomUuid()}]->(SpeedRacer),
(LanaW)-[:DIRECTED {id: randomUuid()}]->(SpeedRacer),
(LillyW)-[:WROTE {id: randomUuid()}]->(SpeedRacer),
(LanaW)-[:WROTE {id: randomUuid()}]->(SpeedRacer),
(JoelS)-[:PRODUCED {id: randomUuid()}]->(SpeedRacer)

CREATE (NinjaAssassin:Movie {id: "ninja assassin", title:"Ninja Assassin", released: date({year: 2009}), tagline:'Prepare to enter a secret world of assassins'})
CREATE (NaomieH:Person {id: "naomie harris", name: "Naomie Harris"})
CREATE
(Rain)-[:ACTED_IN {id:randomUuid(), roles:['Raizo']}]->(NinjaAssassin),
(NaomieH)-[:ACTED_IN {id:randomUuid(), roles:['Mika Coretti']}]->(NinjaAssassin),
(RickY)-[:ACTED_IN {id:randomUuid(), roles:['Takeshi']}]->(NinjaAssassin),
(BenM)-[:ACTED_IN {id:randomUuid(), roles:['Ryan Maslow']}]->(NinjaAssassin),
(JamesM)-[:DIRECTED {id: randomUuid()}]->(NinjaAssassin),
(LillyW)-[:PRODUCED {id: randomUuid()}]->(NinjaAssassin),
(LanaW)-[:PRODUCED {id: randomUuid()}]->(NinjaAssassin),
(JoelS)-[:PRODUCED {id: randomUuid()}]->(NinjaAssassin)

CREATE (TheGreenMile:Movie {id: "the green mile", title:"The Green Mile", released: date({year: 1999}), tagline:"Walk a mile you'll never forget."})
CREATE (MichaelD:Person {id: "michael clarke duncan", name: "Michael Clarke Duncan", born: date({year: 1957})})
CREATE (DavidM:Person {id: "david morse", name: "David Morse", born: date({year: 1953})})
CREATE (SamR:Person {id: "sam rockwell", name: "Sam Rockwell", born: date({year: 1968})})
CREATE (GaryS:Person {id: "gary sinise", name: "Gary Sinise", born: date({year: 1955})})
CREATE (PatriciaC:Person {id: "patricia clarkson", name: "Patricia Clarkson", born: date({year: 1959})})
CREATE (FrankD:Person {id: "frank darabont", name: "Frank Darabont", born: date({year: 1959})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Paul Edgecomb']}]->(TheGreenMile),
(MichaelD)-[:ACTED_IN {id:randomUuid(), roles:['John Coffey']}]->(TheGreenMile),
(DavidM)-[:ACTED_IN {id:randomUuid(), roles:['Brutus "Brutal" Howell']}]->(TheGreenMile),
(BonnieH)-[:ACTED_IN {id:randomUuid(), roles:['Jan Edgecomb']}]->(TheGreenMile),
(JamesC)-[:ACTED_IN {id:randomUuid(), roles:['Warden Hal Moores']}]->(TheGreenMile),
(SamR)-[:ACTED_IN {id:randomUuid(), roles:['"Wild Bill" Wharton']}]->(TheGreenMile),
(GaryS)-[:ACTED_IN {id:randomUuid(), roles:['Burt Hammersmith']}]->(TheGreenMile),
(PatriciaC)-[:ACTED_IN {id:randomUuid(), roles:['Melinda Moores']}]->(TheGreenMile),
(FrankD)-[:DIRECTED {id: randomUuid()}]->(TheGreenMile)

CREATE (FrostNixon:Movie {id: "frost/nixon", title:"Frost/Nixon", released: date({year: 2008}), tagline:'400 million people were waiting for the truth.'})
CREATE (FrankL:Person {id: "frank langella", name: "Frank Langella", born: date({year: 1938})})
CREATE (MichaelS:Person {id: "michael sheen", name: "Michael Sheen", born: date({year: 1969})})
CREATE (OliverP:Person {id: "oliver platt", name: "Oliver Platt", born: date({year: 1960})})
CREATE
(FrankL)-[:ACTED_IN {id:randomUuid(), roles:['Richard Nixon']}]->(FrostNixon),
(MichaelS)-[:ACTED_IN {id:randomUuid(), roles:['David Frost']}]->(FrostNixon),
(KevinB)-[:ACTED_IN {id:randomUuid(), roles:['Jack Brennan']}]->(FrostNixon),
(OliverP)-[:ACTED_IN {id:randomUuid(), roles:['Bob Zelnick']}]->(FrostNixon),
(SamR)-[:ACTED_IN {id:randomUuid(), roles:['James Reston, Jr.']}]->(FrostNixon),
(RonH)-[:DIRECTED {id: randomUuid()}]->(FrostNixon)

CREATE (Hoffa:Movie {id: "hoffa", title:"Hoffa", released: date({year: 1992}), tagline:"He didn't want law. He wanted justice."})
CREATE (DannyD:Person {id: "danny devito", name: "Danny DeVito", born: date({year: 1944})})
CREATE (JohnR:Person {id: "john c. reilly", name: "John C. Reilly", born: date({year: 1965})})
CREATE
(JackN)-[:ACTED_IN {id:randomUuid(), roles:['Hoffa']}]->(Hoffa),
(DannyD)-[:ACTED_IN {id:randomUuid(), roles:['Robert "Bobby" Ciaro']}]->(Hoffa),
(JTW)-[:ACTED_IN {id:randomUuid(), roles:['Frank Fitzsimmons']}]->(Hoffa),
(JohnR)-[:ACTED_IN {id:randomUuid(), roles:['Peter "Pete" Connelly']}]->(Hoffa),
(DannyD)-[:DIRECTED {id: randomUuid()}]->(Hoffa)

CREATE (Apollo13:Movie {id: "apollo 13", title:"Apollo 13", released: date({year: 1995}), tagline:'Houston, we have a problem.'})
CREATE (EdH:Person {id: "ed harris", name: "Ed Harris", born: date({year: 1950})})
CREATE (BillPax:Person {id: "bill paxton", name: "Bill Paxton", born: date({year: 1955})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Jim Lovell']}]->(Apollo13),
(KevinB)-[:ACTED_IN {id:randomUuid(), roles:['Jack Swigert']}]->(Apollo13),
(EdH)-[:ACTED_IN {id:randomUuid(), roles:['Gene Kranz']}]->(Apollo13),
(BillPax)-[:ACTED_IN {id:randomUuid(), roles:['Fred Haise']}]->(Apollo13),
(GaryS)-[:ACTED_IN {id:randomUuid(), roles:['Ken Mattingly']}]->(Apollo13),
(RonH)-[:DIRECTED {id: randomUuid()}]->(Apollo13)

CREATE (Twister:Movie {id: "twister", title:"Twister", released: date({year: 1996}), tagline:"Don't Breathe. Don't Look Back."})
CREATE (PhilipH:Person {id: "philip seymour hoffman", name: "Philip Seymour Hoffman", born: date({year: 1967})})
CREATE (JanB:Person {id: "jan de bont", name: "Jan de Bont", born: date({year: 1943})})
CREATE
(BillPax)-[:ACTED_IN {id:randomUuid(), roles:['Bill Harding']}]->(Twister),
(HelenH)-[:ACTED_IN {id:randomUuid(), roles:['Dr. Jo Harding']}]->(Twister),
(ZachG)-[:ACTED_IN {id:randomUuid(), roles:['Eddie']}]->(Twister),
(PhilipH)-[:ACTED_IN {id:randomUuid(), roles:['Dustin "Dusty" Davis']}]->(Twister),
(JanB)-[:DIRECTED {id: randomUuid()}]->(Twister)

CREATE (CastAway:Movie {id: "cast away", title:"Cast Away", released: date({year: 2000}), tagline:'At the edge of the world, his journey begins.'})
CREATE (RobertZ:Person {id: "robert zemeckis", name: "Robert Zemeckis", born: date({year: 1951})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Chuck Noland']}]->(CastAway),
(HelenH)-[:ACTED_IN {id:randomUuid(), roles:['Kelly Frears']}]->(CastAway),
(RobertZ)-[:DIRECTED {id: randomUuid()}]->(CastAway)

CREATE (OneFlewOvertheCuckoosNest:Movie {id: "one flew over the cuckoo's nest", title:"One Flew Over the Cuckoo's Nest", released: date({year: 1975}), tagline:"If he's crazy, what does that make you?"})
CREATE (MilosF:Person {id: "milos forman", name: "Milos Forman", born: date({year: 1932})})
CREATE
(JackN)-[:ACTED_IN {id:randomUuid(), roles:['Randle McMurphy']}]->(OneFlewOvertheCuckoosNest),
(DannyD)-[:ACTED_IN {id:randomUuid(), roles:['Martini']}]->(OneFlewOvertheCuckoosNest),
(MilosF)-[:DIRECTED {id: randomUuid()}]->(OneFlewOvertheCuckoosNest)

CREATE (SomethingsGottaGive:Movie {id: "something's gotta give", title:"Something's Gotta Give", released: date({year: 2003})})
CREATE (DianeK:Person {id: "diane keaton", name: "Diane Keaton", born: date({year: 1946})})
CREATE (NancyM:Person {id: "nancy meyers", name: "Nancy Meyers", born: date({year: 1949})})
CREATE
(JackN)-[:ACTED_IN {id:randomUuid(), roles:['Harry Sanborn']}]->(SomethingsGottaGive),
(DianeK)-[:ACTED_IN {id:randomUuid(), roles:['Erica Barry']}]->(SomethingsGottaGive),
(Keanu)-[:ACTED_IN {id:randomUuid(), roles:['Julian Mercer']}]->(SomethingsGottaGive),
(NancyM)-[:DIRECTED {id: randomUuid()}]->(SomethingsGottaGive),
(NancyM)-[:PRODUCED {id: randomUuid()}]->(SomethingsGottaGive),
(NancyM)-[:WROTE {id: randomUuid()}]->(SomethingsGottaGive)

CREATE (BicentennialMan:Movie {id: "bicentennial man", title:"Bicentennial Man", released: date({year: 1999}), tagline:"One robot's 200 year journey to become an ordinary man."})
CREATE (ChrisC:Person {id: "chris columbus", name: "Chris Columbus", born: date({year: 1958})})
CREATE
(Robin)-[:ACTED_IN {id:randomUuid(), roles:['Andrew Marin']}]->(BicentennialMan),
(OliverP)-[:ACTED_IN {id:randomUuid(), roles:['Rupert Burns']}]->(BicentennialMan),
(ChrisC)-[:DIRECTED {id: randomUuid()}]->(BicentennialMan)

CREATE (CharlieWilsonsWar:Movie {id: "charlie wilson's war", title:"Charlie Wilson's War", released: date({year: 2007}), tagline:"A stiff drink. A little mascara. A lot of nerve. Who said they couldn't bring down the Soviet empire."})
CREATE (JuliaR:Person {id: "julia roberts", name: "Julia Roberts", born: date({year: 1967})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Rep. Charlie Wilson']}]->(CharlieWilsonsWar),
(JuliaR)-[:ACTED_IN {id:randomUuid(), roles:['Joanne Herring']}]->(CharlieWilsonsWar),
(PhilipH)-[:ACTED_IN {id:randomUuid(), roles:['Gust Avrakotos']}]->(CharlieWilsonsWar),
(MikeN)-[:DIRECTED {id: randomUuid()}]->(CharlieWilsonsWar)

CREATE (ThePolarExpress:Movie {id: "the polar express", title:"The Polar Express", released: date({year: 2004}), tagline:'This Holiday Season... Believe'})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Hero Boy', 'Father', 'Conductor', 'Hobo', 'Scrooge', 'Santa Claus']}]->(ThePolarExpress),
(RobertZ)-[:DIRECTED {id: randomUuid()}]->(ThePolarExpress)

CREATE (ALeagueofTheirOwn:Movie {id: "a league of their own", title:"A League of Their Own", released: date({year: 1992}), tagline:'Once in a lifetime you get a chance to do something different.'})
CREATE (Madonna:Person {id: "madonna", name: "Madonna", born: date({year: 1954})})
CREATE (GeenaD:Person {id: "geena davis", name: "Geena Davis", born: date({year: 1956})})
CREATE (LoriP:Person {id: "lori petty", name: "Lori Petty", born: date({year: 1963})})
CREATE (PennyM:Person {id: "penny marshall", name: "Penny Marshall", born: date({year: 1943})})
CREATE
(TomH)-[:ACTED_IN {id:randomUuid(), roles:['Jimmy Dugan']}]->(ALeagueofTheirOwn),
(GeenaD)-[:ACTED_IN {id:randomUuid(), roles:['Dottie Hinson']}]->(ALeagueofTheirOwn),
(LoriP)-[:ACTED_IN {id:randomUuid(), roles:['Kit Keller']}]->(ALeagueofTheirOwn),
(RosieO)-[:ACTED_IN {id:randomUuid(), roles:['Doris Murphy']}]->(ALeagueofTheirOwn),
(Madonna)-[:ACTED_IN {id:randomUuid(), roles:['"All the Way" Mae Mordabito']}]->(ALeagueofTheirOwn),
(BillPax)-[:ACTED_IN {id:randomUuid(), roles:['Bob Hinson']}]->(ALeagueofTheirOwn),
(PennyM)-[:DIRECTED {id: randomUuid()}]->(ALeagueofTheirOwn)

CREATE (PaulBlythe:Person {id: "paul blythe", name: "Paul Blythe"})
CREATE (AngelaScope:Person {id: "angela scope", name: "Angela Scope"})
CREATE (JessicaThompson:Person {id: "jessica thompson", name: "Jessica Thompson"})
CREATE (JamesThompson:Person {id: "james thompson", name: "James Thompson"})

CREATE
(JamesThompson)-[:FOLLOWS {id: randomUuid()}]->(JessicaThompson),
(AngelaScope)-[:FOLLOWS {id: randomUuid()}]->(JessicaThompson),
(PaulBlythe)-[:FOLLOWS {id: randomUuid()}]->(AngelaScope)

CREATE
(JessicaThompson)-[:REVIEWED {id:randomUuid(), summary:'An amazing journey', rating:95}]->(CloudAtlas),
(JessicaThompson)-[:REVIEWED {id:randomUuid(), summary:'Silly, but fun', rating:65}]->(TheReplacements),
(JamesThompson)-[:REVIEWED {id:randomUuid(), summary:'The coolest football movie ever', rating:100}]->(TheReplacements),
(AngelaScope)-[:REVIEWED {id:randomUuid(), summary:'Pretty funny at times', rating:62}]->(TheReplacements),
(JessicaThompson)-[:REVIEWED {id:randomUuid(), summary:'Dark, but compelling', rating:85}]->(Unforgiven),
(JessicaThompson)-[:REVIEWED {id:randomUuid(), summary:"Slapstick redeemed only by the Robin Williams and Gene Hackman's stellar performances", rating:45}]->(TheBirdcage),
(JessicaThompson)-[:REVIEWED {id:randomUuid(), summary:'A solid romp', rating:68}]->(TheDaVinciCode),
(JamesThompson)-[:REVIEWED {id:randomUuid(), summary:'Fun, but a little far fetched', rating:65}]->(TheDaVinciCode),
(JessicaThompson)-[:REVIEWED {id:randomUuid(), summary:'You had me at Jerry', rating:92}]->(JerryMaguire)

WITH TomH as a
MATCH (a)-[:ACTED_IN {id: randomUuid()}]->(m)<-[:DIRECTED {id: randomUuid()}]-(d) RETURN a,m,d LIMIT 10;