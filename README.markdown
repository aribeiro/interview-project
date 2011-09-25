#Davia.com Interview Test

## Instructions

Please create a inventory importer that will take a csv file of products and create/update the items as necessary. 
Access to do the update needs to occur through both a admin web interface and a rake task.

Notes: 

 * The admin web interface need not be styled or look good (just functional).
 * For simplicty's sake don't upload images or worry about them as part of the uploader.

## Starting Data

The items csv can be found in the /db directory of the rails app.

## Ambiguity

When dealing with ambiguity make your best guess at what an e-commerce site would need and execute according to 
your insights. The job requires you to be more than just a simple coder but an intellectual that can problem
solve and own his/her features.

## Common Issues

There are a number of issues that occur with product importers including:
 
 * Duplication control
 * User errors (blank fields, prices that have typos, copy paste errors)
 * preflighting (running the importer in a 'test' mode) is a common way to solve many issues. 

## Quality
 
Treat this project as a real production project complete with :
 * tests you normally write
 * appropriate git comments and commits
 * documentation when code is rather tricky (don't over document though)
 * dependability in product (no excuses for why something doesn't work)
 * general good understandable code 

## Speed

The faster you can do it without sacrificing anything in code quality is a bonus!

The maxium amount of time is 2x our fastest developers time doing this project or 10 hours. Good luck!

## Editor settings

We use 2 spaces (as spaces) for our tabs.

## Submission

We use heroku as our provider and will ask that you deploy to heroku as well.

Please create a free account on heroku and deploy there using a free system. 
See this link on how to setup a RoR app on heroku in 5 minutes (http://devcenter.heroku.com/articles/quickstart)

When you are finished send a email to jobs@davia.com with the url where we can test the web interface
and another url to your fork with your code updates so we can review your code.

## Contact

If you have any questions you can't solve on your own or general questions about the project you can also use 
jobs@davia.com to get a quick answer.

