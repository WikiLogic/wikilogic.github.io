
A good article that explains the way arango thinks about docuents and graphs: https://www.arangodb.com/2013/01/querying-documents-and-graphs-in-one-database-with-aql-easily/

const database = "_system";
db.dropDatabase('wl_dev').catch((err) => {console.log("drop err", err);});
db.dropDatabase('wl_dev1').catch((err) => {console.log("drop err", err);});
db.dropDatabase('wl_dev2').catch((err) => {console.log("drop err", err);});
db.dropDatabase('wl_dev3').catch((err) => {console.log("drop err", err);});
db.dropDatabase('wl_dev4').catch((err) => {console.log("drop err", err);});

