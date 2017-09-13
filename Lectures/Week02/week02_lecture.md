Week 2 - R Markdown and Github
================
Thomas Brambor
September 13, 2017

-   [Roadmap](#roadmap)
-   [Administrative](#administrative)
-   [R Studio and R Markdown](#r-studio-and-r-markdown)
-   [R Markdown](#r-markdown)
-   [Version Control with Git and Github](#version-control-with-git-and-github)
-   [Tutorial - How to use Github](#tutorial---how-to-use-github)
-   [Github - Branching (optional for this course)](#github---branching-optional-for-this-course)

Roadmap
-------

-   How to use R Markdown? Tutorial with example document.
-   How to use Git and Github for version control?

Administrative
==============

New Students - Welcome!
-----------------------

<img src="images/data_analysis_excel.jpg" width="70%" />

Github usernames
----------------

Please go to this link now and submit you Github username (if you have not done so yet):

<http://bit.ly/github-username>

Office Hours set
----------------

Office hours of TAs now set as well.

Shriya Balaji Palsamudram
[sbp2148@columbia.edu](sbp2148@columbia.edu)
IAB 270 Mon 2-4pm

Sahil Manocha
[sahil.manocha@columbia.edu](sahil.manocha@columbia.edu)
IAB 270 Fri 2-4pm

Advanced Material
-----------------

-   To allow advanced students or students with interest in specific topics to go a bit further than what is covered in the course, I will be including a section called *Advanced Topics (optional, on your own only)* on the syllabus for each week.
-   **Feel free to completely ignore these sections!**
-   These sections are meant to be autodidactive. The TAs and myself are first and foremost concerned with the material covered in the course.

<img src="images/Citadel-Library.png" width="50%" />

Types of course registration
----------------------------

-   **For credit, graded**: Required to hand in all exercises and complete the final project/exam.

-   **Pass-Fail**: Same process as graded students. I submit a letter grade which the registrar converts to either P or F.

-   **R registered students (audit)**:
    -   Complete 1 of the assignments from week 3 or later.
    -   No need to take final exam/project.

Extra weeks
-----------

-   two additional weeks in course
-   possible extensions:
    -   Functions
    -   Bringing data in (i.e. text from PDFs)
    -   Hands on analysis of big(ish) data set (&gt;100 million obs)

<img src="images/soccerclock.jpg" width="50%" />

R Studio and R Markdown
=======================

Using R in RStudio | Typical new R user
---------------------------------------

<img src="images/rlevel-1.png" width="100%" />

<span style="font-size: 50%">Source: R Studio Webinar ["Introducing Notebooks with R Markdown"](https://www.rstudio.com/resources/webinars/introducing-notebooks-with-r-markdown/)</span>

Using R in RStudio | Literate R programming with R Markdown
-----------------------------------------------------------

<img src="images/rlevel-3.png" width="100%" />

<span style="font-size: 50%">Source: R Studio Webinar ["Introducing Notebooks with R Markdown"](https://www.rstudio.com/resources/webinars/introducing-notebooks-with-r-markdown/)</span>

Using R in RStudio | R Notebooks
--------------------------------

<img src="images/rlevel-4.png" width="47%" />

<span style="font-size: 50%">Source: R Studio Webinar ["Introducing Notebooks with R Markdown"](https://www.rstudio.com/resources/webinars/introducing-notebooks-with-r-markdown/)</span>

R Markdown
==========

R Markdown
----------

-   I asked everyone to familiarize themselves with R Markdown.
-   Success?

R Markdown Cheat Sheet
----------------------

-   Use the R Markdown [cheat sheet](https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf) for a nice overview on Markdown in RStudio.

<img src="images/rmarkdown-cheatsheet-2.0_p1.png" width="45%" /> <img src="images/rmarkdown-cheatsheet-2.0_p2.png" width="45%" />

Reporting in R Markdown
-----------------------

-   Try yourself:
-   **File -&gt; New File -&gt; R Markdown -&gt; Document -&gt; HTML**
-   Set output to different file formats (with the *Knit* button)

What is Markdown?
-----------------

<img src="images/markdown_what_is1.png" width="100%" />

What is Markdown?
-----------------

<img src="images/markdown_what_is2.png" width="100%" />

Markdown Syntax
---------------

-   Need to learn a bit of markdown syntax
-   Take a look a the [cheat sheet](https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf) and/or [reference guide](http://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)

Simple Formatting and Links
---------------------------

You can use Markdown to embed formatting instructions into your text. For example, you can make a word *italicized* by surrounding it in asterisks, **bold** by surrounding it in two asterisks, and `monospaced` (like code) by surrounding it in backticks:

\**italics*\*, \*\***bold**\*\*, `` `code` ``

You can turn a word into a [link](www.google.com) by surrounding it in hard brackets and then placing the link behind it in parentheses, like this:

\[Columbia U\](www.columbia.edu)

Headers
-------

To create titles and headers, use leading hastags. The number of hashtags determines the header's level:

\# First level header
\#\# Second level header
\#\#\# Third level header

Lists
-----

To make a bulleted list in Markdown, place each item on a new line after an asterisk and a space, like this:

\* item 1
\* item 2
\* item 3

You can make an ordered list by placing each item on a new line after a number followed by a period followed by a space.

1. item 1
2. item 2
3. item 3

Embedding equations
-------------------

You can also use the Markdown syntax to embed latex math equations into your reports. To embed an equation in its own centered equation block, surround the equation with two pairs of dollar signs like this,

`$$1 + 1 = 2$$`

To embed an equation inline, surround it with a single pair of dollar signs, like this: `$1 + 1 = 2$`

All [standard Latex symbols](https://en.wikibooks.org/wiki/LaTeX/Mathematics) work.

Knitr
-----

[knitr](https://yihui.name/knitr/) is an engine for dynamic report generation with R and is used to convert (or "knit") R Markdown files into the desired output format.

<img src="images/knitr.png" width="30%" />

Including R code inline and in chunks
-------------------------------------

-   R code can be included as chunk with

    \`\`\`{r} \`\`\`

or inline with a single tickmark.

-   R functions sometimes return messages, warnings, and even error messages. By default, R Markdown will include these messages in your report. You can use the `message`, `warning` and `error` options to prevent R Markdown from displaying these.

Popular chunk options
---------------------

Three of the most popular chunk options are `echo`, `eval` and `results`.

-   If `echo = FALSE`, R Markdown will not display the code in the final document (but it will still run the code and display its results unless told otherwise).

-   If `eval = FALSE`, R Markdown will not run the code or include its results, (but it will still display the code unless told otherwise).

-   If `results = 'hide'`, R Markdown will not display the results of the code (but it will still run the code and display the code itself unless told otherwise).

Pandoc
------

-   The Pandoc program (by John MacFarlane) renders R Markdown documents into the output we want.
-   We can include specific options into the **YAML** header on top of our document to control this process.

<img src="images/yaml.png" width="80%" />

R Notebooks
-----------

**Switch to the demo file `Rmarkdown_demo.Rmd` in the exercise folder for this week.**

R Notebooks
-----------

1.  Interact with R in a single, seamless stream.
2.  Iterate quickly on code and output; see code and output together.
3.  Leave a clean, reproducible record of your analysis in a simple text file.
4.  Document your analysis with rich, literate prose.
5.  Share and publish easily.
6.  One-click export to PDF, Word, etc.

<br><br><br><br><br> <span style="font-size: 50%">Source: R Studio Webinar ["Introducing Notebooks with R Markdown"](https://www.rstudio.com/resources/webinars/introducing-notebooks-with-r-markdown/)</span>

Other Output Formats
--------------------

-   html\_document
-   pdf\_document
-   word\_document
-   beamer\_presentation / slidy\_presentation / ioslides\_presentation
-   github\_document

Note: see also description in exercise document.

Version Control with Git and Github
===================================

Why version control?
--------------------

<img src="images/why_version_control.png" width="100%" />

Why version control?
--------------------

-   Confusing
-   Prone to errors
-   Collaboration
-   Describe the changes
-   Feature development

Why Git?
--------

-   Git
    -   master-branch workflow
    -   distributed (rather than centralized) version control
    -   pull requests to manage/discuss updates
    -   de facto standard on version control
-   GitHub
    -   Github is like facebook for programmers. Everyone’s on there.
    -   open source
    -   lowers the barriers to collaboration

Resources to get started with Git and GitHub
--------------------------------------------

-   Git
    -   [Official git command line and GUI clients, official documentation](https://git-scm.com/)
-   Clients
    -   [Desktop Client for Mac and Windows](https://desktop.github.com/)
    -   [Sourcetree - another free visual Git](https://www.sourcetreeapp.com/)
-   Tutorials
    -   [Setting up git](https://help.github.com/articles/set-up-git/)
    -   [Try.github](https://try.github.io)
    -   [Hello World - GitHub for the non-programming beginner.](https://guides.github.com/activities/hello-world/)
    -   [Guides at GitHub](https://guides.github.com/)
    -   [Pro Git - a full book with lots of details](https://git-scm.com/book/en/v2)

Intro Git - version control
---------------------------

-   **Version control**
    -   VC is a great way to keep track of changes in code, manuscripts, presentations, and data analysis projects.
    -   Allows you to save and annotate all changes to your code and files.
    -   No need to rename files as "analysis\_v1.R", "analysis\_with second graph.R", "analysis\_Mike update.R"

<img src="images/version-control.png" width="60%" />

Intro Git - Local vs. Shared Repository
---------------------------------------

<img src="images/git_four_stages.png" width="35%" />

Intro Git - Master-Branch
-------------------------

<img src="images/git_master_branch.png" width="50%" />

Intro Git - Centralized vs. Distributed Version Control
-------------------------------------------------------

<img src="images/git_dvn_cvn.png" width="100%" />

Intro Git - Popularity
----------------------

<img src="images/git_popularity.png" width="100%" />

<small><small>[Google Trends Comparison](https://www.google.com/trends/explore?date=all&q=%2Fm%2F05vqwg,%2Fm%2F012ct9,%2Fm%2F08441_,%2Fm%2F08w6d6,%2Fm%2F09d6g&hl=en-US) </small></small>

Intro GitHub
------------

-   single largest host for Git repositories, and is the central point of collaboration for millions of developers and projects
-   Free. Allows easy open source hosting. Private repositories available with your .edu email address.
-   While Git is a command line tool, GitHub provides a web-based graphical interface.
-   Provides access control and several collaboration features, such as a wikis and basic task management tools for every project.

Why / For what should you use GitHub?
-------------------------------------

-   Use GitHub for your **homework exercises**
-   Get the **class material and resources** on GitHub.
-   Find useful repositories, packages, data, code, and tutorials: e.g. [tidyverse](https://github.com/tidyverse), Hadley Wickham's ["Advanced R" book](https://github.com/hadley/adv-r) etc.

Tutorial - How to use Github
============================

Creating a new repository
-------------------------

<img src="images/github_step1_new_repo.png" width="80%" />

Cloning a repository
--------------------

-   A clone is a copy of a repository that lives on your computer instead of on a website's server somewhere, or the act of making that copy

<img src="images/github_step2_clone.png" width="90%" />

Forking a repository
--------------------

-   A fork is a copy of another user's repository that you manage (and lives on your account).

-   Forks let you make changes to a project without affecting the original repository.

-   You can fetch updates from or submit changes to the original repository with pull requests.

<img src="images/github_step3_fork.png" width="90%" />

Forking the course repository
-----------------------------

-   Go to: <https://github.com/QMSS-G5072-2017/QMSS-G5072-Modern-Data-Structures>
-   Fork the course repository
-   Fetch changes through Github Desktop

Commit to Master
----------------

-   A commit, or "revision", is an individual change to a file (or set of files)
-   It's like when you *save* a file, except every time you save it creates a unique ID. A commit also contains a description of *what has changed*.

<img src="images/github_step4_commit.png" width="50%" />

Upload to Remote (Push)
-----------------------

-   Pushing refers to sending your committed changes to a remote repository such as GitHub.com

<img src="images/github_step5_push.png" width="90%" />

Changing files online
---------------------

-   You can change files directly through the github.com website. Click the edit button, change, and the commit.

<img src="images/github_step6_edit_online.png" width="100%" />

Changing files online
---------------------

<img src="images/github_step7_pull.png" width="100%" />

Github - Branching (optional for this course)
=============================================

Github Flow - Create a branch
-----------------------------

<img src="images/gihub_flow_branch.png" width="80%" />

-   Try out ideas for your project by creating a branch.
-   Changes you make on a branch don't affect the master branch, so you're free to experiment and commit changes.

Github Flow - Add commits
-------------------------

<img src="images/gihub_flow_commits.png" width="80%" />

-   Whenever you add, edit, or delete a file, you're making a commit, and adding them to your branch.
-   Keeps track of your progress as you work on a branch.
-   Transparent history of your work with associated commit message (i.e a description of your change).
-   Allows you to roll back if things go awry.

Github Flow - Pull Request
--------------------------

<img src="images/gihub_flow_pullrequest.png" width="80%" />

-   Pull Requests initiate discussion about your commits.
-   Anyone can see exactly what changes would be merged if they accept your request.
-   Using GitHub's @mention system in your Pull Request message to ask for feedback from your team.

Github Flow - Discuss and Review
--------------------------------

<img src="images/gihub_flow_discuss.png" width="80%" />

-   Discuss and review the changes.
-   Continue to fix code and push up the change with new commits.
-   GitHub will show your new commits and any additional feedback you may receive in the unified Pull Request view.

Github Flow - Deploy
--------------------

<img src="images/gihub_flow_deploy.png" width="80%" />

-   Check your branch to verify it works.
-   If your branch causes issues, you can roll it back by deploying the existing master again.

Github Flow - Merge
-------------------

<img src="images/gihub_flow_merge.png" width="80%" />

-   Merge your code into the master branch.
-   Pull Requests preserve a record of the historical changes to your code. Because they're searchable, they let anyone go back in time to understand why and how a decision was made.
