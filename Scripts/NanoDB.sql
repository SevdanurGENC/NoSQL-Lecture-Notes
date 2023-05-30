use NanoDB
db.getCollection("post").find({})
show dbs

NanoDB


db.getCollection("unknown").find({})


-- createCollection

db.movie.insert({"name":"tutorials point"})

db.dropDatabase()

db.createCollection("mycollection")

show collections
 
db.tutorialspoint.insert({"name" : "tutorialspoint"})
db.mycollection.drop()


--insert

db.users.insert({
 _id : ObjectId("507f191e810c19729de860ea"),
 title: "MongoDB Overview",
 description: "MongoDB is no sql database",
 by: "tutorials point",
 url: "http://www.tutorialspoint.com",
 tags: ['mongodb', 'database', 'NoSQL'],
 likes: 100
 })
WriteResult({ "nInserted" : 1 })

db.createCollection("post") 
db.post.insert([
	{
		title: "MongoDB Overview",
		description: "MongoDB is no SQL database",
		by: "tutorials point",
		url: "http://www.tutorialspoint.com",
		tags: ["mongodb", "database", "NoSQL"],
		likes: 100
	},
	{
	title: "NoSQL Database",
	description: "NoSQL database doesn't have tables",
	by: "tutorials point",
	url: "http://www.tutorialspoint.com",
	tags: ["mongodb", "database", "NoSQL"],
	likes: 20,
	comments: [
		{
			user:"user1",
			message: "My first comment",
			dateCreated: new Date(2013,11,10,2,35),
			like: 0
		}
	]
}
])
BulkWriteResult({
	"writeErrors" : [ ],
	"writeConcernErrors" : [ ],
	"nInserted" : 2,
	"nUpserted" : 0,
	"nMatched" : 0,
	"nModified" : 0,
	"nRemoved" : 0,
	"upserted" : [ ]
})

use NanoDB

db.createCollection("mycol")

db.mycol.insert([
	{
		title: "MongoDB Overview",
		description: "MongoDB is no SQL database",
		by: "tutorials point",
		url: "http://www.tutorialspoint.com",
		tags: ["mongodb", "database", "NoSQL"],
		likes: 100
	},
	{
		title: "NoSQL Database",
		description: "NoSQL database doesn't have tables",
		by: "tutorials point",
		url: "http://www.tutorialspoint.com",
		tags: ["mongodb", "database", "NoSQL"],
		likes: 20,
		comments: [
			{
				user:"user1",
				message: "My first comment",
				dateCreated: new Date(2013,11,10,2,35),
				like: 0
			}
		]
	}
])


--query


db.mycol.find()
 
db.mycol.find().pretty() 

db.mycol.findOne({title: "MongoDB Overview"})

db.mycol.find({$and:[{"by":"tutorials point"},{"title": "MongoDB Overview"}]}).pretty()




--update

db.mycol.update({'title':'MongoDB Overview'},{$set:{'title':'New MongoDB Tutorial'}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

db.mycol.find()

db.mycol.update({'title':'MongoDB Overview'},
   {$set:{'title':'New MongoDB Tutorial'}},{multi:true})

db.mycol.save(
   {
      "_id" : ObjectId("507f191e810c19729de860ea"), 
		"title":"Tutorials Point New Topic",
      "by":"Tutorials Point"
   }
)
WriteResult({
	"nMatched" : 0,
	"nUpserted" : 1,
	"nModified" : 0,
	"_id" : ObjectId("507f191e810c19729de860ea")
})

db.mycol.find()

db.empDetails.insertMany(
	[
		{
			First_Name: "Radhika",
			Last_Name: "Sharma",
			Age: "26",
			e_mail: "radhika_sharma.123@gmail.com",
			phone: "9000012345"
		},
		{
			First_Name: "Rachel",
			Last_Name: "Christopher",
			Age: "27",
			e_mail: "Rachel_Christopher.123@gmail.com",
			phone: "9000054321"
		},
		{
			First_Name: "Fathima",
			Last_Name: "Sheik",
			Age: "24",
			e_mail: "Fathima_Sheik.123@gmail.com",
			phone: "9000054321"
		}
	]
)


db.empDetails.findOneAndUpdate(
	{First_Name: 'Radhika'},
	{ $set: { Age: '30',e_mail: 'radhika_newemail@gmail.com'}}
) 

db.empDetails.updateOne(
	{First_Name: 'Radhika'},
	{ $set: { Age: '30',e_mail: 'radhika_newemail@gmail.com'}}
)

db.empDetails.updateMany(
	{Age:{ $gt: "25" }},
	{ $set: { Age: '00'}}
)

db.empDetails.find()



--Delete


db.mycol.remove({'title':'MongoDB Overview'})
WriteResult({"nRemoved" : 1})

db.mycol.find()

db.mycol.remove({})
WriteResult({ "nRemoved" : 2 })

db.mycol.find()
