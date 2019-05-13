//Message from group section e.g. some text
{
"messageID" : int,
"content" : string,
"author" : string,
"creation_date" : date,
}

//Image info for gallery objects
{
"imageID" : int,
"URL" : string, // or Image?
"author" : string,
"creation_date" : date
}

//Message from event section (calendar)
{
"eventID" : int,
"content" : string,
"author" : string,
"creation_date" : date,
"event_date" : date,

}


//Date standard: ISO 8601 2014-01-01T23:28:56.782Z YYYY-MM-DD