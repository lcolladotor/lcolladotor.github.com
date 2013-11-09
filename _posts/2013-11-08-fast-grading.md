---
layout: post
title: My strategy for quickly grading homeworks
tags:
- TA
categories:
- JHU Biostat
---
{% include JB/setup %}

For the past year and a half [I have been a teaching assistant](http://www.biostat.jhsph.edu/~lcollado/teaching.html#.Un2BnJTF2Ql) (TA) for the Statistical Methods in Public Health I to IV (140.621 to 140.624) courses. As part of being a TA for these courses, we have to grade between 30 and 50 homeworks every two weeks or so: four problem sets per eight week terms. For example, I now have to grade 37 homeworks:

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/list-to-grade.png"><img src="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/list-to-grade.png" alt="HWs to grade" style="width: 400px;"/></a>
</center>

These courses have been polished over time and the instructors do a great job organizing the TA group. For every problem set that we have to grade, we are given a full answer key that is later published in the course site so all the students can access it. As TAs we also receive general grading comments from the instructor; typically a two page document describing the key points that we should expect the students to be able to answer. 

As part of the general grading comments, we are asked to give feedback beyond checkmarks such as "good job". When the student completely misses the answer, we can simply refer them to the answer key: if they miss too many, we ask them to re-do the homework. Things get more complicated when the student misses part of the question and writing comments specific to that answer can get very time consuming. We can always use "More detailed discussion on results needed. See answer key." but it can be nice for the student if we give them a hint on what they did wrong.

As a student [@jhubiostat](https://twitter.com/jhubiostat) we agree to dedicate five hours per week to TA responsibilities. In the courses I have been a TA for, the responsibilities include getting familiar with the content, attending TA office hours (either general questions or STATA questions), attending the TA meetings, grading the exams, and grading the homeworks. It might sound like a lot, but I currently feel like I can it all done within the five hours per week. To do so, I obviously need to be efficient grading the homeworks.

Here is how I do it.

### Setup

Programs used:

1. [Adobe Acrobat Pro](http://www.adobe.com/products/acrobatpro.html) which I believe we can get through Hopkins for free.
1. [Alfred v2](http://www.alfredapp.com/) with [Powerpack](http://www.alfredapp.com/powerpack/) purchased/installed.

Why Adobe Acrobat?

1. Adobe Acrobat allows you to post "stamps". It already includes a checkmark and a red __X__. I also imported some simple images I made to stamp the homework as: satisfactory, unsatisfactory, or incomplete. We have to clearly mark one of these options at the top of the graded homeworks.
1. Some of the PDF files we get are large, so I use the `Save as -> reduced size pdf` tool from Adobe Acrobat to save space and make it easier for the course administrator to upload the graded homeworks to [CoursePlus](http://courseplus.jhsph.edu/) (the tool the school uses for managing courses).

Why [Alfred v2](http://www.alfredapp.com/)?

1. For grading homeworks all I really need is a software that can remember my recent copy-pastes and make it easy for me to choose among them to paste them back. For example, [ClipMenu](http://www.clipmenu.com/) can do the job.
1. [Alfred v2](http://www.alfredapp.com/) has a `Clipboard` feature which does the above. Compared to [ClipMenu](http://www.clipmenu.com/) it has the advantage of allowing you to search within the recent copy-pastes, making it easy to find the comment you want to paste.

If you are on Windows or Linux, there must be some programs that have this functionality.


### Grading workflow

#### Most used comment: Good job!

Let me begin with a very simple case. Basically, you find a answer that is well done and you want to compliment the student for it.

In the homework I am currently grading, the students have to compute the 95 percent confidence interval for the difference in two proportions using the formula:

$$ \hat p_1 - \hat p_2 \pm 1.96 \times \sqrt{ \frac{ \hat p_1 (1 - \hat p_1)}{ n_1} + \frac{ \hat p_2 (1 - \hat p_2)}{ n_2} } $$

which leads to (0.00142, 0.00798) with the data they are using.

An anonymous student (I tried to choose examples that are not identifiable) wrote an answer that has very similar numbers to those we expect. Since they included the STATA output I can recognize that they used rounded numbers (oddly only for sample 1 but not sample 2) which lead the student to slightly different values. That is not a big deal and I think it deserves the "good job!" comment. So using the "stamps", I added a checkmark. Then I typed "Good job!" and finally, I copied it so I can paste it the next time I want to add this comment.

The image below shows the state at which I am copying the comment.

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/goodjob1.png"><img src="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/goodjob1.png" alt="Good job 1" style="width: 500px;"/></a>
</center>

Moving on, I later found another student that has the correct answer presented in a different format. If "Good job!" is the most recent comment on my clipboard, I can simply paste it. If it is not, then I can use [Alfred v2](http://www.alfredapp.com/) to show me my recent "copies" and select "Good job!" from the list. In this case it is under `cmd + 2`; you can also use the arrows and the return key, or the mouse. Although note that [Alfred v2](http://www.alfredapp.com/) is designed in such a way that you only have to use the keyboard to gain efficiency.

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/goodjob2.png"><img src="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/goodjob2.png" alt="Good job 2" style="width: 500px;"/></a>
</center>

The end result is a green checkmark with the "Good job!" comment pasted into it. The next time I use `cmd + v` (the regular paste shortcut in Mac), "Good job!" will be pasted. So you only really need to invoke [Alfred v2](http://www.alfredapp.com/) when you want to change comments.

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/goodjob3.png"><img src="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/goodjob3.png" alt="Good job 3" style="width: 500px;"/></a>
</center>

#### Detailed comments: where the strategy pays off!

You obviously do not all this setup just for pasting "Good job!" everywhere. However, when grading homeworks you will encounter much more complicated cases where you might need to write a short explanation, point the student to the answer key, etc. To save time you want to minimize having to type the long comments each time you need to. That is where this strategy pays its dividends.

In this example, I first find a plot that looks very similar to what the students were asked to do. It has a couple of mistakes. First, the age-gender group categories are not labeled in the plot, which makes it impossible to know which group is which unless you know how _agegen_ is coded. Given that it is the first time students were asked to make such a detailed plot, I can expect other students to make the same mistake. So I copy that comment and add it to my clipboard history as shown below.

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci1.png"><img src="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci1.png" alt="CI 1" style="width: 500px;"/></a>
</center>

This particular plot has another problem in that the confidence bands look much smaller than expected. The estimates per se look comparable to the expected plot, so I suspect that the student either used the wrong standard errors or forgot to multiply them by 1.96. So I copy this comment separately and add it to my clipboard history. Maybe other students made the same mistake, maybe they did not. 

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci2.png"><img src="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci2.png" alt="CI 2" style="width: 500px;"/></a>
</center>

Having copied both comments separately, I am now ready for cases where they forget to label the X axis, use the wrong confidence bands, or make both mistakes together.

Later on, I find another homework that has labels on the X axis. So instead of typing my comment, I simply invoke [Alfred v2](http://www.alfredapp.com/) and search the appropriate comment as shown below.

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci3.png"><img src="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci3.png" alt="CI 3" style="width: 500px;"/></a>
</center>

If my comment list is getting long, using [Alfred v2](http://www.alfredapp.com/) I can easily search my clipboard history by typing keywords. In this particular case, I know that my comment had something to do with the "axis", so typing it in I quickly find the comment I want to use.

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci4.png"><img src="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci4.png" alt="CI 4" style="width: 500px;"/></a>
</center>

And voila! The comment is pasted!

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci5.png"><img src="http://lcolladotor.github.io/figs/2013-11-08-fast-grading/ci5.png" alt="CI 5" style="width: 500px;"/></a>
</center>

### Alternatives

An alternative implementation is to create a spreadsheet where you manually save the comments you are using while grading the homework. When you want to use them, you open the spreadsheet, select the comment, manually copy it, and then you are set to paste it. Using [Alfred v2](http://www.alfredapp.com/) basically makes this a bit faster, but the key point is to save the comments in a way that you can re-use them and combine them if necessary. 

If you want more pointers on this alternative, ask [@YennyWebbV](https://twitter.com/YennyWebbV) who is an expert at it.

### Wrap up

I hope that others find this strategy useful. In my case, I went from taking 9-11 hours to grade homeworks when I first began as a TA to grading them in 3-4 hours.

If you are interested in reading more posts from students [@jhubiostat](https://twitter.com/jhubiostat) check out [bmorebiostat.com](http://bmorebiostat.com/).

<blockquote class="twitter-tweet"><p>&quot;Bmore Biostats is born!&quot; by Leonardo Collado Torres at <a href="http://t.co/CXVuni60gh">http://t.co/CXVuni60gh</a> <a href="http://t.co/uIovRg1bAP">pic.twitter.com/uIovRg1bAP</a></p>&mdash; bmorebiostats (@bmorebiostats) <a href="https://twitter.com/bmorebiostats/statuses/398917966676258816">November 8, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

