---
layout: post
title: Login to the cluster, request a node and change to your project directory in a single command
tags:
- cluster
categories:
- computing
---
{% include JB/setup %}








To be able to do RNA-seq research work in large multi-sample studies you have to be able to analyze large files and thus frequently use a powerful computing environment. In my case, this means that I have to login to a [computing cluster](http://en.wikipedia.org/wiki/Computer_cluster) frequently. This is a common task for other biostatisticians (like those that do brain imagining studies) and many other people. When I am working on a project, I generally have to login to the cluster and then change the directory to the location where I have my project files.

A local cluster is normally composed of a login machine (enigma2 in my case) from where you can request to work on a node. There are several options for controlling this process of requesting a node, and in our institution we use a [Sun/Oracle Grid Engine](http://en.wikipedia.org/wiki/Oracle_Grid_Engine). When a cluster has a lot of users, you want to dedicate the login machine as much as possible to handling login requests and assigning nodes for people to use. This means that you want to minimize doing any other kind of operations on the login machine, such as input/output operations.  


## Basic workflow

This means that the steps I normally follow before getting to work on my project are:


{% highlight bash %}
## Open the terminal
## Login to enigma
ssh username@enigma2.etc.edu

## Request a node to work on interactively
qrsh

## Change to the directory where I have my project files
cd projectDir

## Done!
{% endhighlight %}


For a long time I have used an [alias](http://en.wikipedia.org/wiki/Alias_\(command\)) for the login step. I have this alias in my local `.bashrc` file:


{% highlight bash %}
## In local .bashrc file
alias enigma="ssh username@enigma2.etc.edu"
{% endhighlight %}


Thus saving a tiny bit of typing:


{% highlight bash %}
## Open terminal
## Login to enigma
enigma
## Etc
qrsh
cd projectDir
{% endhighlight %}


When the `projectDir` gets complicated, I make an `alias` on my `.bashrc` file on the cluster. For example:


{% highlight bash %}
## In cluster .bashrc file
alias pdir="cd /very/complicated/path/to/projectDir/"
{% endhighlight %}


And finally, I can accomplish the setup task with minimal typing:


{% highlight bash %}
## Open terminal
enigma
qrsh
pdir
{% endhighlight %}


## Using ssh config

This section was added after Kasper Hansen's comment.

You can edit the ~.ssh/config file (check [how to set it up](http://www.howtogeek.com/75007/stupid-geek-tricks-use-your-ssh-config-file-to-create-aliases-for-hosts/), [explained differently](http://nerderati.com/2011/03/simplify-your-life-with-an-ssh-config-file/) and the [manual](http://linux.die.net/man/5/ssh_config)) to make things even better. This is how mine looks like:


{% highlight bash %}
Host enigma
	User username
    Hostname enigma2.etc.edu
	ForwardX11 yes
{% endhighlight %}


I like the ssh `-X` (or `-Y`) option so I can later view plots in X11 when running `R`. That is why the __ForwardX11__ option is present.

Then you can use the following command to ssh into the cluster.


{% highlight bash %}
ssh enigma
{% endhighlight %}


Or if you prefer, simplify the bash alias to:


{% highlight bash %}
## In local .bashrc file
alias enigma="ssh enigma"
{% endhighlight %}


The sections below have been edited to assume that you are configured the __enigma__ host shortcut in your ~.ssh/config file.

## Needed a new strategy

The previous strategy works and I had been very comfortable with it. However, at times you might forget to request a node from the cluster to do your work interactively. This is specially true for me when I only plan on using a few `git` commands. But when many users forget this, it becomes a problem and our cluster manager had to send us a reminder:

	*ALWAYS* work on a cluster node rather than on enigma2.
	Enigma2 is a *single machine* with many people trying to use it to gain access to the cluster.
	Even for tar commands, cp commands, wc commands ... first qrsh to a node.

## Profiles in [iTerm2](http://www.iterm2.com/)

Just a few days after we got this reminder, I decided to take a look at the [iTerm2](http://www.iterm2.com/) profile menu. There are plenty of options for customizing your terminal, but the ones I mainly ended up using are:

1. `Working directory` -> `Directory :` -> choose a directory in my laptop. Generally the location of my `git` repository for version controlling the code of a given project.
1. `Command` -> `Send text at start` -> an alias from my local `.bashrc` file as shown in the image below (the alias is __qr__).

<center>
<a href="http://lcolladotor.github.io/figs/2013-12-11-quick-cluster-login-to-interactive-session/iTerm2-profile-cluster.png"><img src="http://lcolladotor.github.io/figs/2013-12-11-quick-cluster-login-to-interactive-session/iTerm2-profile-cluster.png" alt="iTerm2 cluster profile screenshot" style="width: 400px;"/></a>
</center>

The first case above is nice, but the real power comes from the second case. Since I can pretty much evaluate any command, I asked myself if I could set up a profile that automatically logs in to the cluster? Can it also request a node interactively? And even go to my project directory?


## cluster `qr` alias

I then remembered that [Samuel Younkin](https://github.com/syounkin) explained to us how to set up __qrsh__ to automatically change the directory to the directory from which you invoked __qrsh__ (<span class="showtooltip" title="(2013). 'BiocHopkins.' ."><a href="http://bit.ly/19zLZeD">Younkin, 2013</a></span>). I modified things a little bit and saved this qrsh version as the `qr` alias on the cluster:


{% highlight bash %}
## In cluster .bashrc file

## change dir automatically when using qrsh
## Details: https://github.com/rkostadi/BiocHopkins/wiki/Useless-Tips-&-Code-Snippets
if [ -f ~/.bash_pwd ]; then
    source ~/.bash_pwd
    rm ~/.bash_pwd
fi
alias qr='echo "cd $PWD" > ~/.bash_pwd; history -w; qrsh'
{% endhighlight %}


Note that I tried using the `qrsh -ac` option, but couldn't get to pass a variable. Doing so in theory would remove the need to create the __.bash_pwd__ temporary file. 


## ssh and change dir in one command

Then googling I found how to __ssh__ and change directory in one command (<span class="showtooltip" title="Frosty (2009). 'How can I ssh directly to a particular directory?' ."><a href="http://stackoverflow.com/questions/626533/how-can-i-ssh-directly-to-a-particular-directory">Frosty, 2009</a></span>):


{% highlight bash %}
ssh -t enigma 'cd /very/complicated/path/to/projectDir/; bash'
{% endhighlight %}



The problem I soon encountered was that I couldn't __qrsh__ right after because the command was not been found. Some setup files are not been read even after using `bash -l` like shown here:


{% highlight bash %}
ssh -t enigma 'cd /very/complicated/path/to/projectDir/; bash -l'
{% endhighlight %}


## local `qr` alias

With our cluster administrator's help, I was finally able to find how to do all of this in a single command:


{% highlight bash %}
## Requires the code by Sam Younkin to work (or the version I modified)
ssh -t enigma 'cd /very/complicated/path/to/projectDir/; source /etc/profile; echo "cd $PWD" > ~/.bash_pwd; history -w; qrsh'
{% endhighlight %}



Finally, I created the `qr` alias in my local machine. This alias:

1. performs the ssh connection to the login machine of our cluster (enigma2),
1. then changes the directory to the project directory, 
1. loads the necessary setup files so __qrsh__ can be found on the path,
1. creates the temporary __.bash_pwd__ file (you could even make this more concise by echoing the directory of interest to the temp file),
1. saves the command history as recommended by [Samuel Younkin](https://github.com/syounkin),
1. requests an interactive node (with your default settings) by executing __qrsh__.


{% highlight bash %}
## In local .bashrc file

# qrsh
alias qr="ssh -t enigma 'cd /very/complicated/path/to/projectDir/; source /etc/profile; echo \"cd \$PWD\" > ~/.bash_pwd; qrsh'"
{% endhighlight %}


Note the use of the backslash to delay the execution of `$PWD`. I want it to be executed on the cluster, not on my local machine. 

## Glory!

So now using [iTerm2](http://www.iterm2.com/) I can simply use the shortcut for my _cluster_ profile which runs the local `qr` alias and the next thing I have is a terminal with an interactive session on the cluster and located in my project directory. Sweet! =)

Plus I also have the cluster `qr` alias for doing what [Samuel Younkin](https://github.com/syounkin) previously described.  


### Can do it better?

If you have suggestions on how to improve this, let me know!


### Extra aliases

The following two aliases take your local current directory basename and use it for accessing /very/complicated/path/to/projectDir/__basename__. This is useful if you use an organization similar to mine:

* Projects dir
	* Project 1 dir
	* Project 2 dir
	
The full paths are different in my computer and in the cluster, but once you are in  /very/complicated/path/to/projectDir/
it is all the same on both locations.

The first one runs __qrsh__ while the second one doesn't request a node for interactive work. 


{% highlight bash %}
## In local .bashrc file

## qrsh-basename
alias qs='LEODIR=`basename $PWD`; ssh -t enigma "cd /very/complicated/path/to/projectDir/$LEODIR/; source /etc/profile; echo \"cd \$PWD\" > ~/.bash_pwd; history -w; qrsh"'
## basename, but no qrsh
alias qq='LEODIR=`basename $PWD`; ssh -t enigma "cd /very/complicated/path/to/projectDir/$LEODIR/; source /etc/profile; echo \"cd \$PWD\" > ~/.bash_pwd; history -w; bash"'
{% endhighlight %}



### References

Citations made with `knitcitations` (<span class="showtooltip" title="Boettiger C (2013). knitcitations: Citations for knitr markdown files. R package version 0.4-7."><a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2013</a></span>).



-  Frosty,   (2009) How can I ssh directly to a particular directory?.  *How can I ssh directly to a particular directory? - Stack Overflow*  [http://stackoverflow.com/questions/626533/how-can-i-ssh-directly-to-a-particular-directory](http://stackoverflow.com/questions/626533/how-can-i-ssh-directly-to-a-particular-directory)
-  BiocHopkins.  *GitHub*  [http://bit.ly/19zLZeD](http://bit.ly/19zLZeD)
- Carl Boettiger,   (2013) knitcitations: Citations for knitr markdown files.  [http://CRAN.R-project.org/package=knitcitations](http://CRAN.R-project.org/package=knitcitations)



### Recap

If you got lost, these are the basic modifications you need to make to your local and cluster `.bashrc` files.

<script src="https://gist.github.com/lcolladotor/7897221.js"></script>

Check the history of this post [here](https://github.com/lcolladotor/lcolladotor.github.com/commits/master/_posts/2013-12-11-quick-cluster-login-to-interactive-session.md).
