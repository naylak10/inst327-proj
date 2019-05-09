// import stuff
const models  = require('./models');
var csv       = require('fast-csv');
var fs        = require('fs');
const http    = require('http');
// database connection
const sequelize = models.sequelize;
const Sequelize = models.Sequelize;

var csvstream = fs.createReadStream('legislators-current.csv');

// read csv data
var csvdata = [];
csv
  .fromStream(csvstream, {headers : ['last_name','first_name','middle_name','suffix','nickname','full_name','birthday','gender','type','state','district','senate_class','party','url','address','phone','contact_form','rss_url','twitter','facebook','youtube','youtube_id','bioguide_id','thomas_id','opensecrets_id','lis_id','fec_ids','cspan_id','govtrack_id','votesmart_id','ballotpedia_id','washington_post_id','icpsr_id','wikipedia_id']})
  .on("data", function(data){

    csvdata.push(data);

  })
  .on("end", function(){

    generateInserts(csvdata);

  });

// generate insert statements
function generateInserts(people) {

  var statements = [];

  for (var ind = 1; ind < people.length; ind++) {
    var person = people[ind];
    var statement = 'INSERT INTO leader_prof (first_name, last_name, contact_num, dob) VALUES ';
    statement += '(\'' + person['first_name'] + '\',' 
                + '\'' + person['last_name']  + '\','
                + '\'' + person['phone']      + '\',' 
                + '\'' + person['birthday']   + '\')';
    statements.push(statement);

    // make call to open secrets api
    var cid = person['opensecrets_id'];
    if (cid != '' &&  cid.length > 0) {
      getCandSummary(cid);
    }
  }

  writeInsertsToFile(statements);
}

function writeInsertsToFile(statements) {
  // write insert statements to file
  var scriptStatments = '';
  for (var ind = 0; ind < statements.length; ind++) {
    scriptStatments += statements[ind] + '\n';
  }

  var tempFile = fs.createWriteStream('insert-statements.sql');
  tempFile.on('open', function(fd) {
    //tempFile.write(scriptStatments);
  });
}


// open secrets api calls
// http://www.opensecrets.org/api/?method=candSummary&cid=N00007360&cycle=2018&apikey=__apikey__

url = 'http://www.opensecrets.org/api/'

// make a get request to the opensecrets api

function getCandSummary(cid) {

  var candURL = url + '?method=candSummary&'
  candURL += 'apikey=a88d489b2c6add856a945f5cca12852b&'
  candURL += 'cycle=2018&output=json&'
  candURL += 'cid=' + cid

  console.log(candURL);

  http.get(candURL, (resp) => {

    // A chunk of data has been recieved.
    resp.on('data', (chunk) => {
  
      var respJSON = JSON.parse(chunk);
      var respData = respJSON['response']['summary']['@attributes']
  
      var cand_name = respData['cand_name']
      var cash_on_hand = respData['cash_on_hand']
      var chamber = respData['chamber']
      var cid = respData['cid']
      var debt = respData['debt']
      var first_elected = respData['first_elected']
      var party = respData['party']
      var state = respData['state']
      
      console.log(respData)
  
    });
  });
}

