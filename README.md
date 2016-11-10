# DT228/DT282 Object Oriented Programming 2016-2017

Resources
---------
* [Webcourses](http://dit.ie/webcourses) - Course code: CMPU2016
* [Slack](https://oop-2016-2017.slack.com)
* [Processing](http://processing.org)
* [The Processing language reference](http://processing.org/reference/)
* [Learning Processing: A Beginner's Guide to Programming Images, Animation, and Interaction (Morgan Kaufmann Series in Computer Graphics)](http://http://www.learningprocessing.com/)
* [The Nature of Code](http://natureofcode.com/)
* [Eclipse](http://eclipse.org)
* [The git manual - read the first three chapters](http://git-scm.com/documentation)
* [A video tutorial all about git/github](https://www.youtube.com/watch?v=p_PGUltnB6w)
* [The Java Tutorial from Oracle](http://docs.oracle.com/javase/tutorial/)
* [Games Fleadh](http://www.gamesfleadh.ie/)
* [The Imagine Cup](https://www.imaginecup.com/)

## Contact the lecturer
* Email: bryan.duggan@dit.ie
* Twitter: [@skooter500](http://twitter.com/skooter500)
* Slack: [oop-2016-2017.slack.com](https://oop-2016-2017.slack.com)

Some assignments from previous years:

[![YouTube](http://img.youtube.com/vi/sPjZSRCmt1U/0.jpg)](https://www.youtube.com/watch?v=sPjZSRCmt1U)

[![YouTube](http://img.youtube.com/vi/0hQt7BKxBcU/0.jpg)](https://www.youtube.com/watch?v=0hQt7BKxBcU)

[![YouTube](http://img.youtube.com/vi/S575a92AsuQ/0.jpg)](https://www.youtube.com/watch?v=S575a92AsuQ)

# Assessments

- [Assignments](assignments.md)

- 8 November 2016 lab test 14%
- 29 November 2016 Assignment 1 submission 20%
- 31 January 2017  Assignment 2 submission - 20%
- Assignment 3 - 30%
- MCQ's - 16%

# Week 9
- [The map method example from Tuesday's class](processing/mapExample)
- [YASC Work in progress](processing/YASC1)
- [YASC on github](http://github.com/skooter500/YASC)

# Lab
- [Lab Test 1](https://github.com/skooter500/OOP-LabTest1-2016)
- [SOlution](https://github.com/skooter500/StarMap)


# Week 8
- [Lab test 2](https://github.com/skooter500/irishEconomy/)
- [Radar example implemented using various techniques](processing/RadarExample)
- [Detecting multiple key presses in Processing](processing/multipleKeys)
- [Timers](processing\timers)
- [Formatting numbers](processing/decimalFormat)

# Week 7
- [Hashmaps in Processing](https://processing.org/reference/HashMap.html)
- [Iterating over a HashMap](http://stackoverflow.com/questions/1066589/iterate-through-a-hashmap)
- All about git

[![YouTube](http://img.youtube.com/vi/p_PGUltnB6w/0.jpg)](https://www.youtube.com/watch?v=p_PGUltnB6w)

# Lab
### Learning Outcomes
- Learn how to use the main features of git via the git bash shell

This lab is all about practicing using git and github. This will work best if you for a group of 2, so that you can get experience collaborating with someone on a project through git. Firstly, make sure you know what the following bash commands do. Fire up the bash shell and try them out. There are lots more, but these are the most common ones I use. Google them and try them out!

```
pwd
ls
ls -a
cd
mkdir
mv
find
grep
```

Note, folders in the bash shell are seperated using / and in Windows explorer you should have the following options checked:

- Show file name extensions
- Hidden files

You will find these options on the View tab of any Windows Explorer window

Also from the bash shell, you can use TAB to complete commands.

Setting up git
- I recommend you install [git for Windows](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) rather than the github client. You can optionally install [SourceTree](https://www.sourcetreeapp.com/) which is a nice git gui program that allows you to *diff* commits (view the changes) amongst lots of other cool stuff.
- The first time you try and do a commit or a push you may have to run come commands to set up your email address and username. Just follow the instructions to do this.
- At some stage you should read the [first 3 chapters of the git manual](https://git-scm.com/documentation). This is pretty much all you need to know.

Note! Select the text using your mouse in the bash shell window and it will get copied to the clipboard. Press Ctrl + Ins to paste.

Basic stuff
- Create a project in Processing and save it somewhere
- Fire up the bash shell and use cd to navigate to the project folder
- Type ```git init``` in the project folder to create an empty git repo. Notice that a new hidden folder called .git will appear in the folder
- Create the project on your github account on github.com. Dont forget to create a .gitignore and a readme.
- Get the url of the new repo and type:
  - ```git remote add origin THE_URL_OF_YOUR_REPO```
- Type ```git pull origin master``` to get the changes from the server. Type ```la -a``` and you should see the new files listed.
- Type ```git add .``` to add your local changes to the staging area
- Type ```git commit -m "some message"``` to make a commit
- Type ```git push --set-upstream origin master``` This creates the connection between your master branch and the master branch on the server
- Type ```git push``` to send your changes to the server

Rolling back to a previous commit
- Make a few more commits and push them
- Type ```git log``` to see the history of your branch and see the 40 digit hexedecimal id's of your commits. It should look something like this

  ```
  commit 7ccd905733dc710ecf38b0431d1143528b5dc1c7
  Author: skooter500 <skooter500@gmail.com>
  Date:   Thu Apr 14 10:03:17 2016 +0100

      Added todays lab

  commit 4b46bea9d2ccd434076310049a5553ccc241adc6
  Author: Bryan Duggan <skooter500@gmail.com>
  Date:   Fri Mar 25 12:55:44 2016 +0000

      classes and bullets example

  commit 6e949c599f038209c9b22da99d5b014a7c47387a
  Author: Bryan Duggan <skooter500@gmail.com>
  Date:   Thu Mar 3 09:15:18 2016 +0000

      broken link

  ```


- Copy one of the 40 digit ids and type ```git checkout THE-40-DIGIT-ID``` Open up your sketch and you should see it has reverted to the old version.
- Type ```git checkout master``` and the head pointer will move to the head of the branch (the latest commit). Open up your sketch and you should see it has changed to the latest version

Rolling back to a previous commit and making a new branch
- If you want to go back to an old version of a project and make changes, you will often see articles on stack overflow etc saying that you should hard reset the head. I recommend that you don't do this as this will delete the subsequent commits on the branch and you might want to get these changes back sometime. Instead, the best thing to do is make the changes on a new branch.
- Checkout one of the old commits again. Make some changes to the sketch
- Type ```git checkout -b my_new_branch``` You can call the branch something different if you want! The -b flag means create the new branch.
- Add and commit your changes to the new branch
- Now switch back to the master branch by typing ```git checkout master```. Open your sketch and verify that you are at the latest version of the project on the master branch.
- You can switch branches at anytime by typing ```git checkout THE_BRANCH_NAME```
- If you want to send this new branch to the server, checkout the branch (no -b flag this time) and type:
  - ```git push --set-upstream origin my_new_branch```
  - ```git push```

Deleting files
- git will normally just store files that have been added or modified in a commit. Files that are deleted don't get deleted in the commit so that if you checkout that commit, the files that you deleted will reappear. If you have deleted files in a commit you should use ```git add . --all```. Try it!

Branching
- You can create multiple branches in git if you want to try new stuff without screwing up your project. In fact it is common to create a new branch every time you want to add a new feature and then merge the branch into the master branch when the feature is completed. Lets try this.
- Type ```git checkout master``` to switch to the head of the master branch
- Type ```git branch``` This shows you what branch you are currently on. You can also type ```git branch --all`` to show all the branches.
- Type ```git checkout -b test_branch``` to create a new branch and switch to it
- Make some changes to to your Processing sketch and save them
- Add and commit these changes.
- To send this new branch to the server type:
  - ```git push --set-upstream origin test_branch```
  - ```git push```
- Type ```git checkout master``` to switch to the master branch and check your Processing sketch to make sure your changes are gone.
- Type ```git checkout test_branch``` and open the Processing sketch to make sure your changes are back again
- Type ```git checkout master``` to switch to the master branch again
- Now lets merge the test_branch changes into the master branch. Type ```git merge test_branch``` to do this
- Open your sketch and see that the changes you made on the test_branch have been merged in.
- Add and commit your merged changes.


Dealing with merge conficts
- Often, git will merge edits in files automatically, but merge conflicts can occur whenever commits have edits on the same line of the same file. This can happen even when only one person is working on a project. When this happens, git will tell you what files are causing problems and mark up the files with the changes from both commits.
- Give your team mate permission to commit to the repository. To do this, go to Settings | Collaborators and add their github id. Your team mate can clone the repository by typing:
  - ```git clone THE_URL_OF_THE_REPO```
- Now both of you should make some edits to the same file. Make some edits on the same lines of the file and on different lines of the file
- Your team mate should add, commit an push their changes. You can jump onto the github website and verify that their changes have been pushed
- Now you should add commit and try and push your changes. You will get a message that looks like this:

  ```
  To https://github.com/skooter500/TestGit
   ! [rejected]        master -> master (non-fast-forward)
  error: failed to push some refs to 'https://github.com/skooter500/TestGit'
  hint: Updates were rejected because the tip of your current branch is behind
  hint: its remote counterpart. Integrate the remote changes (e.g.
  hint: 'git pull ...') before pushing again.
  hint: See the 'Note about fast-forwards' in 'git push --help' for details.
  ```
- What this is saying is that there are changes on the server that you dont have and you need to pull and merge them before you can send your commit. To do this type:
- ```git pull```
- Now the changes from the head of the master branch on the server will get merged into your local git repository. git will attempt to merge files, but in this case you should get a merge conflict. It looks like this:

  ```
  Auto-merging TestGit/TestGit.pde
  CONFLICT (content): Merge conflict in TestGit/TestGit.pde
  Automatic merge failed; fix conflicts and then commit the result.
  ```
- If you open the file in question, you will see that it has been edited to look something like this:

  ```
  <<<<<<< HEAD
  // Hello from Bryan!
  =======
  // Hello from Tara!
  >>>>>>> c365e047b35d76bf3b2d48f38980db4b68746825

  void setup()
  {
  }
  ```
- The bits between <<<<<<< HEAD and ======= are the changes from your commit and the changes between ======= and >>>>>>> c365e047b35d76bf3b2d48f38980db4b68746825 are the changes from your team mates commit. Decide which bit you want to keep and delete the unwanted bits from the file and then add, commit and push your changes.

Merge conflicts on binary files
- Git can merge text files, with source code, but it cant merge binary files such as images. Lets see how to handle this
- Add an image to your project and have your team mate, commit and push this change.
- Have your team mate pull the repo to get the image.
- Now you should both have the image. Both of you should edit the image and save the changes
- Both you and your team mate should add and commit this change, but have your team mate push first
- When you try to push, you will get a message saying that your push has been rejected and you need to do a pull first

  ```
  To https://github.com/skooter500/TestGit
   ! [rejected]        master -> master (fetch first)
  error: failed to push some refs to 'https://github.com/skooter500/TestGit'
  hint: Updates were rejected because the remote contains work that you do
  hint: not have locally. This is usually caused by another repository pushing
  hint: to the same ref. You may want to first integrate the remote changes
  hint: (e.g., 'git pull ...') before pushing again.
  hint: See the 'Note about fast-forwards' in 'git push --help' for details.
  ```

- When you do a pull, you will get a merge conflict on the image file:

  ```
  From https://github.com/skooter500/TestGit
     c365e04..43b59e5  master     -> origin/master
  warning: Cannot merge binary files: TestGit/test.JPG (HEAD vs. 43b59e5d2c53c909fb227a02b6e65681fa91e42a)
  Auto-merging TestGit/test.JPG
  CONFLICT (content): Merge conflict in TestGit/test.JPG
  Automatic merge failed; fix conflicts and then commit the result.

  ```
- git doesn't know how to deal with these edits and so to resolve this conflict, you have to decide which version of the file you want to keep, the one from the server, or your version. If you want to keep your version, you type:
  - ```git checkout --ours THE_FILE_NAME```
  - Don't forget to use / to seperate paths and use TAB to complete commands
  - If you want to keep the version from the server you can type
  - ```git checkout --theirs THE_FILE_NAME```
  - You can type these commands multiple times if you want to just swicth between the two versions to compare them.
- When you are done, add, commit and push your changes

Congratulations! I suggest you finish the lab by setting your assignment up on git

# Week 6
- [Irish economic data lab test from 2015](https://github.com/skooter500/irishEconomy/)
- [Politicians expenses lab test from 2014](processing/ExpensesProcessing)

- Video about map, ArrayList's, splitting strings, converting String to float:

[![YouTube](http://img.youtube.com/vi/jMC_y9Nhq04/0.jpg)](https://www.youtube.com/watch?v=jMC_y9Nhq04)

- Datasets in processing video:

[![YouTube](http://img.youtube.com/vi/ccnjXlSnL2Y/0.jpg)](https://www.youtube.com/watch?v=ccnjXlSnL2Y)

- [The expenses program we wrote in class](processing\expenses)

## Lab

### Learning Outcomes
- Create classes & objects
- Practice using an ArrayList
- Get experience loading data from a file
- Practice useful stuff for the upcoming lab test

Here is [the lab test document](docs/Lab Test 1.docx). You can attempt the entire test but dont worry if you can't figure out the party expenses part. What would be good to get done today would be the following:

- Create an ArrayList for Expense objects. Here is the [Processing reference for the ArrayList](https://processing.org/reference/ArrayList.html). Also [here is the example we wrote in the class today](processing/expenses).
- Load the expense data from the file into the ArrayList of Expense objects. You can use the processing method [loadTable](https://processing.org/reference/loadTable_.html) to do this. *Read the processing reference page for this carefully!!*
- Draw a barchart of the barchart of Expense objects.

Share your work on the Slack! Do the MCQ

# Week 5
- [Incomplete Game of Life code for the lab today](processing/lifeIncomplete)

- Stephen Hawkings on the Game of Life:

  [![YouTube](http://img.youtube.com/vi/CgOcEZinQ2I/0.jpg)](https://www.youtube.com/watch?v=CgOcEZinQ2I)

- John Conway on the Game of Life:

  [![YouTube](http://img.youtube.com/vi/C2vgICfQawE/0.jpg)](https://www.youtube.com/watch?v=C2vgICfQawE)

- Epic Conway's Game of Life:

  [![YouTube](http://img.youtube.com/vi/FdMzngWchDk/0.jpg)](https://www.youtube.com/watch?v=FdMzngWchDk)

- And finally, Alan Watts

  [![YouTube](http://img.youtube.com/vi/wU0PYcCsL6o/0.jpg)](https://www.youtube.com/watch?v=wU0PYcCsL6o)

- [Conway's Game of Life on Wikipedia](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)
- [The Game of Life Wiki](http://www.conwaylife.com/wiki/Main_Page)

## Lab
### Learning Outcomes
- Complete the game of life code
- Practice iterating over a 2D array
- Discover the amazing power of cellular automata

Try and complete the Game of Life we started in the class today. Here is the [code from the class](processing/lifeIncomplete).  you weren't in the class, you could take a read of the Game of Life wiki page and have a crack at implementing it from scratch yourselves. It's not too difficult. If you get your basic game of life to evolve, you could try these additions:

- The method ```void mousePressed()``` gets called in your sketch whenever the mouse is pressed. The method ```mouseDragged``` gets called whenever you hold the mouse down and move it over your sketch. You can get the mouse x and y coordinates by using the built in variables ```mouseX``` and ```mouseY```. You can use these methods to implement mouse drawing. To do this you need to calculate which row and column in the 2D array the mouse is over and then set this cell to be true.

- When you press the space key, the game should pause and unmpause, in other words, not update the game board while the game is paused
- When you press the c key, the board should clear. In otherwords, you should set every element in th 2D array to be false.
- When you press the r key, you should randomly set 50% of the elements to be true. To do this, you need to iterate through the array and generate a random number between 0.0f and 1.0f. If the number is > 0.5f, you set the element to be true otherwise set it to be false.

There some interesting starting patterns you can program also. You could write code so that when you press a number key it creates the starting pattern at the mouse x and y. I used the mouse x and y to be the top left of the shape.

| Pattern | Description |
|---------|-------------|
|![Sketch](images/p13.png) | Gosper Gun |
|![Sketch](images/p14.png) | Lightweight spaceship |
|![Sketch](images/p15.png) | Tumbler |
|![Sketch](images/p16.png) | Glider |
|![Sketch](images/p17.png) | I'm not sure what this is called, but it makes amazing patterns |

Here is a video of what my sketch looks like:

[![YouTube](http://img.youtube.com/vi/72X38iT74As/0.jpg)](https://www.youtube.com/watch?v=72X38iT74As)

Please share your work on the class slack and don't forget to do the MCQ this week.

- [A solution](processing/Life)
- [A solution that uses classes](processing/ProcessingLife)

# Week 4
- [The arrays program we wrote in the class](processing/arrays)
- [Arrays in Processing reference](https://processing.org/reference/Array.html)

- Arrays in processing - the basics

[![YouTube](http://img.youtube.com/vi/cMWxN4j30A0/0.jpg)](https://www.youtube.com/watch?v=cMWxN4j30A0)

- A video from last year about arrays in Processing

  [![YouTube](http://img.youtube.com/vi/ccnjXlSnL2Y/0.jpg)](https://www.youtube.com/watch?v=ccnjXlSnL2Y)

- Making the trend line:

  [![YouTube](http://img.youtube.com/vi/K9R5yQCPXIE/0.jpg)](https://www.youtube.com/watch?v=K9R5yQCPXIE)


## Lab

### Learning outcomes
- Practice iterating over arrays in Java
- Practice in using the for loop and variables to generate sequences of numbers
- Understand how a line graph is made
- Practice constructing alogorithms as part of a system
- Practice presenting data visually

Log into the slack and let me know how you are getting on today!

Use the code you wrote yesterday in the class as starter code for today's lab.
If you missed the class, [this is a link to my version](processing/arrays).

Here is what you can try and make today:

![Sketch](images/p7.png)

These are the steps I suggest you follow:

- Figure out how to draw a trend line graph first
- Then figure out how to leave horizontal and vertical borders around the graph. I would suggest making a variable called border to control this.
- Then figure out how to scale it so that it scales the data when drawing to the range 0-150. You could make this a variable
- Then figure out how to draw the horizontal axis. This will be a for loop obviously. You might find the following Java/Processing methods useful:
  - [The Processing map method](https://processing.org/reference/map_.html)
  - [textAlign](https://processing.org/reference/textAlign_.html)
  - [substring](http://www.tutorialspoint.com/java/java_string_substring.htm)
- Finally figure out how to draw the vertical axis. Another loop! This is the trickiest part I think

Try and parameterise as much of your sketch with variables, so that you could reuse the code to graph other types of data.
For example, I found it useful to write a method:

```Java
void drawAxis(float[] data, String[] horizLabels, int verticalIntervals, int maxVertical, float border)
```

to draw the horizontal and vertical axes. You might like to write seperate methods for the horizontal and vertical axis.
This took me about an hour to complete today, so it's tricky enough to get everything working, but worth it!
Take a screenshot of your sketch and [upload it to the slack](http://dt228-oop-2015.slack.com)!

### Advanced!

Try and draw this pie chart:

![Sketch](images/p8.png)

Upload screenshots of your sketches to Slack and log on to webcourses to do today's MCQ.

- [Solution to the lab](processing/data)

# Week 3
## Lecture
- [Trigonometry problem set](http://www.tippcityschools.com/cms/lib6/OH01000855/Centricity/Domain/111/Acc%20Geom%20eDay%201.pdf)
- [Simple Spirals sketch](processing/spiral)
- [Trigonometry problem visualised in processing](processing/kitetriangle)
- [Psychedelic Spirals sketch](https://github.com/skooter500/psychedelicSpirals)
- [Circles explained](https://www.khanacademy.org/math/trigonometry/unit-circle-trig-func/unit-circle-definition-of-trig-functions/v/unit-circle-definition-of-trig-functions-1)

Some interesting videos about generative art:

[![YouTube](http://img.youtube.com/vi/LaarVR1AOvs/0.jpg)](https://www.youtube.com/watch?v=LaarVR1AOvs)

[![YouTube](http://img.youtube.com/vi/x0OK1GiI83s/0.jpg)](https://www.youtube.com/watch?v=x0OK1GiI83s)

# Lab

## Learning outcomes

- Use variables
- Use for loops
- Use methods
- Construct an algorithm to solve a problem using sin, cos and the unit circle
- Use drawing and colours in a Processing sketch
- Use random numbers
- Be creative with code

In the lecture we learned how to make spiral shapes using a for loop with sin and cos. In the lab today you will make a sketch that draws star shapes with random numbers of points and random colours. Here is what the finished sketch could look like:

![Sketch](images/p5.png)

Here are some things you might need to read up on first:

- [random function in Processing](https://processing.org/reference/random_.html)
- [Using the modulus operator](http://www.cafeaulait.org/course/week2/15.html)

You can put all your code into the setup method as this sketch doesn't use any animation (unles you want to attempt the advanced part)

This is how I suggest you think about the problem.

- You will need a for loop that goes from 0 - TWO_PI. There will be twice as many steps as there are points on the star.
- You can use % (modulus) to decide whether the x and y values you calculate should be the tip of a point or base of the point (the pointy bit or the trough).
- Use line in your solution
- I strongly suggest you start the lab by just drawing a single star and then maybe move on to drawing multiple stars using a for loop.
- You could write a methdod to draw a single star with parameters

### Advanced
- Make a beautiful animated sketch with stars and spirals and share a picture/video/animated gif on the slack
- Use sin and cos to control colours

Do MCQ 2 and MCQ 3

- [Solution to the lab](processing\star)

## Tutorial
- [My generartive art project](https://github.com/skooter500/genart1)

# Week 2
## Lecture
- [Quadrants sketch](processing/quadrants) - How to use the if statement
- [Rectangle sketch](processing/rectangle) - Rectangle moves back and forth across the screen
- [Examples of using loops in Processing](processing/loops)
- [Solution to the BugZap lab](https://github.com/skooter500/BugZap)

* Data types, the if statement and dynamic sketches in Processing video (from last year)

  [![YouTube](http://img.youtube.com/vi/Y0b9W3UJ2BU/0.jpg)](https://www.youtube.com/watch?v=Y0b9W3UJ2BU)

# Lab
## Learning Outcomes
- Use what you learned in class to build a complete game system in Processing
- Practice drawing stuff and working out relative co-ordinates
- Practice using variables and compound if statements
- Gain experience thinking computationally
- Learn how to use random numbers
- Learn how to get input from the keyboard
- Learn how to import libraries into Processing

This is a video of a game called Bugzap that you can try and make in Processing today. There is a fair bit to it, so don't worry if you don't manage to complete everything.

[![YouTube](http://img.youtube.com/vi/s6PA8jtWneQ/0.jpg)](https://www.youtube.com/watch?v=s6PA8jtWneQ)

How you should do it:
- Get the main game working first and then if you have time, add fonts, sound, the splash screen and the game over screen.
- Write some code to draw the bug. You can write a method to do this if you like (but it's not essential). Here is [an article on using methods in processing](https://processing.org/examples/functions.html). Also make global variables for the bug position and size.
- Get the bug moving. The bug moves a random amount either to the left or the right and it also moves down the screen. Use the random method in Processing to generate random numbers. Also the bug can't move off the screen. You can use the % operator to make something happen on an interval. For example:

  ```Java
  if (frameCount % 60 == 0)
  {
    // Code in here will happen once per second
  }
  ```
- Write some code to draw the player. Use variables to control the player position and size. A method is good here too!
- Write code to move the player in response to a key presses. This is one way to do keyboard handling in Processing:

```Java
if (keyPressed)
{
  if (keyCode == LEFT)
  {
    // This will happen if the left key is pressed
  }
}
```
- Now add the player lazer. I used to UP key for this. I just drew a line for the lazer.
- Make a variable for score and check for collisions between the lazer and the bug. Add a variable for score. You can print stuff to the screen using the text method in Processing. In my version, I actually used [this processing library](http://www.foobarquarium.de/blog/processing/MovingLetters/) which makes wireframe text.
- Make some sound effects and add them to the game. I used [BFXR](http://www.bfxr.net/) to make the sounds and the Minim library to play them, but you might prefer to use the [built-in audio methods in Processing](https://processing.org/tutorials/sound/).
- Add the splash screen and game over screen

Upload pictures of your creations to the Slack and do this weeks MCQ.

# Week 1

## Lecture
* [Introduction slides](https://1drv.ms/p/s!Ak7y2552PWCrhONjAgskv4PATGqdpw)
* [The contract for this course](https://1drv.ms/w/s!Ak7y2552PWCrjPYXt8HlWl1T1cg5Og)

## Lab

### Learning Outcomes
- Sign up for the class Slack
- Enroll on Webcourses
- Become familiar with the syntax of Processing
- Become familiar with writing and running sketches in Processing

Firstly, go to https://oop-2016-2017.slack.com and sign up for the slack with your DIT email address. Make sure and click *Create an account* rather than try and enter your DIT credentials at the login screen, which wont work. When you are signed up, send a little greeting to everyone on the #general channel. If you have a smartphone, you might want to install the Slack app. It's free. Also if you install the app, you will probably want to disable certain notifications, otherwise your phone will be buzzing every time someone posts anything. [Here is an article that explains how to do this](https://slack.zendesk.com/hc/en-us/articles/201649323-Channel-and-group-notification-preferences).

Log onto Webcourses and enroll on the module CMPU2016.

Look up the following methods in the [Processing language reference](http://processing.org/reference/ ) to make sure you are clear about the syntax and parameters:

* noStroke
* noFill
* line
* ellipse
* rect
* background
* stroke
* fill
* size
* arc
* triangle

Write a processing sketch to draw the following shapes:

![Sketch](images/p1.png)

![Sketch](images/p1.1.png)

![Sketch](images/p1.2.png)

I prefer to draw the shapes on paper first before I try and work out the coordinates. Try experimenting with different colours

[Log onto webcourses](http://dit.ie/webcourses) and do this weeks MCQ.